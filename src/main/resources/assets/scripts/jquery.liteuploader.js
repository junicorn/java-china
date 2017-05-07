/* liteUploader v3.3.2 | https://github.com/burt202/lite-uploader | Aaron Burtnyk (http://www.burtdev.net) */

(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        module.exports = factory(require("jquery"));
    } else {
        factory($);
    }
}(function ($) {

    $.fn.liteUploader = function (options) {
        return this.each(function () {
            var getFiles = function () {
                return $(this).get(0).files;
            }.bind(this);

            options.ref = options.ref || $(this).attr("name");

            $.data(this, "liteUploader", new LiteUploader(
                options,
                getFiles,
                $(this).trigger.bind($(this))
            ));
        });
    };

    function LiteUploader(options, getFiles, onEvent) {
        this.options = this._applyDefaults(options);
        this._getFiles = getFiles;
        this._triggerEvent = onEvent;
        this.xhrs = [];
    }

    LiteUploader.prototype = {
        _applyDefaults: function (options) {
            return $.extend({
                script: null,
                ref: null,
                rules: {},
                params: {},
                headers: {},
                singleFileUploads: false,
                beforeRequest: function (files, formData) {
                    return Promise.resolve(formData);
                }
            }, options);
        },

        _init: function (files) {
            files = files || this._getFiles();
            if (!files || !files.length) return;

            var errors = this._validateOptions();
            if (!errors) errors = this._validateFiles(files);

            if (errors) {
                this._triggerEvent("lu:errors", [errors]);
            } else {
                this._triggerEvent("lu:start", files);
                this._startUploadWithFiles(files);
            }
        },

        _startUploadWithFiles: function (files) {
            if (this.options.singleFileUploads) {
                for (var i = 0; i < files.length; i++) {
                    this._beforeUpload([files[i]]);
                }
            } else {
                this._beforeUpload(files);
            }
        },

        _beforeUpload: function (files) {
            this._triggerEvent("lu:before", files);
            return this.options.beforeRequest(files, this._collateFormData(files))
                .then(this._performUpload.bind(this));
        },

        _validateOptions: function () {
            var requiredOptions = ["script", "ref"];

            var errors = requiredOptions.reduce(function (acc, option) {
                if (!this.options[option]) acc.push({type: option + "Required"});
                return acc;
            }.bind(this), []);

            if (errors.length) {
                return [{
                    name: "_options",
                    errors: errors
                }];
            } else {
                return null;
            }
        },

        _validateFiles: function (files) {
            var fileErrors = [];

            for (var i = 0; i < files.length; i++) {
                var errors = this._findErrorsForFile(files[i]);

                if (errors.length) {
                    fileErrors.push({
                        name: files[i].name,
                        errors: errors
                    });
                }
            }

            return (fileErrors.length) ? fileErrors : null;
        },

        _findErrorsForFile: function (file) {
            return Object.keys(this.options.rules).reduce(function (acc, key) {
                var value = this.options.rules[key];

                if (key === "allowedFileTypes" && value && !this._isAllowedFileType(value, file.type)) {
                    acc.push({
                        type: "type",
                        rule: value,
                        given: file.type
                    });
                }

                if (key === "maxSize" && value && file.size > value) {
                    acc.push({
                        type: "size",
                        rule: value,
                        given: file.size
                    });
                }

                return acc;
            }.bind(this), []);
        },

        _isAllowedFileType: function (rules, type) {
            var allowedTypes = rules.split(",");
            var isWildcardType = /([a-z]+)\/\*$/;

            if (allowedTypes.indexOf(type) !== -1) return true;

            return allowedTypes.reduce(function (result, allowedType) {
                if (result) {
                    return result;
                } else {
                    var matches = allowedType.match(isWildcardType) || [];
                    return matches[1] === type.split("/")[0];
                }
            }, false);
        },

        _getFormDataObject: function () {
            return new FormData();
        },

        _collateFormData: function (files) {
            var formData = this._getFormDataObject();

            for (var key in this.options.params) {
                formData.append(key, this.options.params[key]);
            }

            for (var i = 0; i < files.length; i++) {
                formData.append(this.options.ref, files[i]);
            }

            return formData;
        },

        _getXmlHttpRequestObject: function () {
            return new XMLHttpRequest();
        },

        _buildXhrObject: function () {
            var xhr = this._getXmlHttpRequestObject();
            xhr.upload.addEventListener("progress", this._onXHRProgress.bind(this), false);
            this.xhrs.push(xhr);
            return xhr;
        },

        _performUpload: function (formData) {
            $.ajax({
                xhr: this._buildXhrObject.bind(this),
                url: this.options.script,
                type: "POST",
                data: formData,
                headers: this.options.headers,
                processData: false,
                contentType: false
            })
                .done(this._onXHRSuccess.bind(this))
                .fail(this._onXHRFailure.bind(this));
        },

        _onXHRProgress: function (e) {
            if (e.lengthComputable) this._triggerEvent("lu:progress", Math.floor((e.loaded / e.total) * 100));
        },

        _onXHRSuccess: function (response) {
            this._triggerEvent("lu:success", response);
        },

        _onXHRFailure: function (jqXHR) {
            this._triggerEvent("lu:fail", jqXHR);
        },

        /* Public Methods */

        startUpload: function (files) {
            this._init(files);
        },

        addParam: function (key, value) {
            this.options.params[key] = value;
        },

        cancelUpload: function () {
            this.xhrs.forEach(function (xhr) {
                xhr.abort();
            });
            this._triggerEvent("lu:cancelled");
        }
    };

    return LiteUploader;
}));