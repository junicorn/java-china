package com.javachina.exception;

/**
 * Created by biezhi on 2016/12/30.
 */
public class TipException extends RuntimeException {

    public TipException() {
    }

    public TipException(String message) {
        super(message);
    }

    public TipException(String message, Throwable cause) {
        super(message, cause);
    }

    public TipException(Throwable cause) {
        super(cause);
    }
}
