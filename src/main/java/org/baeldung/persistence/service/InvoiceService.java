package org.baeldung.persistence.service;

import java.util.List;
import javax.transaction.Transactional;

import org.baeldung.persistence.dao.IInvoiceRespository;
import org.baeldung.persistence.dao.ProductRespository;
import org.baeldung.persistence.model.Customer;
import org.baeldung.persistence.model.Invoice;
import org.baeldung.persistence.model.Invoicedetail;
import org.baeldung.persistence.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class InvoiceService implements IInvoiceService {

    @Autowired
    private IInvoiceRespository repository;
    @Autowired
    private ICustomerService customerService;
    @Autowired
    private IProductService productService;
    @Autowired
    private ProductRespository productRespository;

    @Override
    public Invoice addNewInvoice(InvoiceDto invoiceDto) {

        final Invoice invoice = new Invoice();
        Customer customoer = customerService.findCustomerByName(invoiceDto.getCustomer() != null ? invoiceDto.getCustomer() : null);
        invoice.setInvoiceno(invoiceDto.getInvoiceno());
        invoice.setInvoicelabel(invoiceDto.getInvoicelabel());
        invoice.setCustomer(customoer != null ? customoer : null);
        invoice.setStatus(invoiceDto.getStatus());
        invoice.setInvoicedate(invoiceDto.getInvoicedate() != null ? invoiceDto.getInvoicedate() : null);
        invoice.setDuedate(invoiceDto.getDuedate() != null ? invoiceDto.getDuedate() : null);
        List<Invoicedetail> invlist = invoiceDto.getInvdetailList();
        for (Invoicedetail invdetail : invlist) {
            Product prd = productService.findProductByName(invdetail.getProduct() != null ? invdetail.getProduct() : "");
            //save the product extra fields too.
            if (prd != null) {
                prd.setDescription(invdetail.getDescription());
                prd.setPrice(invdetail.getPrice());
                productRespository.save(prd);
            }
            invdetail.setProductid(prd != null ? prd.getId() : 0);
        }
        invoice.setInvdetailList(invoiceDto.getInvdetailList() != null ? invoiceDto.getInvdetailList() : null);
        invoice.setSubtotal(invoiceDto.getSubtotal() != null ? invoiceDto.getSubtotal() : null);
        invoice.setTax(invoiceDto.getTax() != null ? invoiceDto.getTax() : null);
        invoice.setTotal(invoiceDto.getTotal() != null ? invoiceDto.getTotal() : null);

        System.out.println(" Inv to be saved:" + invoice);

        return repository.save(invoice);
    }

    @Override
    public void deleteInvoice(Invoice invoice) {

        repository.delete(invoice);
    }

    @Override
    public List<Invoice> listInvoices() {
        return repository.findAll();
    }

    @Override
    public Invoice getLastInvoice() {
        List<Invoice> listinv = repository.findWithPageable(new PageRequest(0, 2, Sort.Direction.DESC, "id"));
        System.out.println(listinv);
        if (listinv != null && !listinv.isEmpty()) {
            return listinv.get(0);
        } else {
            return null;
            
        }
    }
}