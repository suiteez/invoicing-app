/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.baeldung.web.util;

/**
 *
 * @author Aamir Mansuri
 */
public enum InvoiceStatus {

    DRAFT(0), SUBMITTED(1), OVERDUE(2);
    private int value;

    private InvoiceStatus(int value) {
        this.value = value;
    }
}