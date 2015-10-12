package org.baeldung.persistence.service;

import java.util.List;
import org.baeldung.persistence.model.Invoice;

public interface IInvoiceService {

    Invoice addNewInvoice(InvoiceDto invoiceDto);

    void deleteInvoice(Invoice invoice);

    public List<Invoice> listInvoices();
}
