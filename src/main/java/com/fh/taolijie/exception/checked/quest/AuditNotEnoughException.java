package com.fh.taolijie.exception.checked.quest;

import com.fh.taolijie.constant.ErrorCode;
import com.fh.taolijie.exception.checked.GeneralCheckedException;

/**
 * Created by whf on 10/1/15.
 */
public class AuditNotEnoughException extends GeneralCheckedException {
    public AuditNotEnoughException() {
        super("");
        setCode(ErrorCode.AUDIT_NOT_ENOUGH);
    }
}
