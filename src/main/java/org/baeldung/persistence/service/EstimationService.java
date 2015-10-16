package org.baeldung.persistence.service;

import java.util.List;
import javax.transaction.Transactional;
import org.baeldung.persistence.dao.IEstimationRespository;

import org.baeldung.persistence.dao.ProductRespository;
import org.baeldung.persistence.model.Customer;
import org.baeldung.persistence.model.Estimation;
import org.baeldung.persistence.model.Estimationdetail;
import org.baeldung.persistence.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class EstimationService implements IEstimationService {

	@Autowired
	private IEstimationRespository repository;
	
        @Autowired 
        private ICustomerService customerService;
        
        @Autowired
        private IProductService productService;
        
        @Autowired
        private ProductRespository productRespository;
        
	@Override
	public Estimation addNewInvoice(EstimationDto invoiceDto) {
		
		final Estimation invoice = new Estimation();
                Customer customoer = customerService.findCustomerByName(invoiceDto.getCustomer()!=null?invoiceDto.getCustomer():null);
		invoice.setEstimateno(invoiceDto.getEstimateno());
                invoice.setEstimatelabel(invoiceDto.getEstimatelabel());
		invoice.setCustomer(customoer!=null?customoer:null);
                invoice.setInvoicedate(invoiceDto.getInvoicedate()!=null?invoiceDto.getInvoicedate():null);
                invoice.setDuedate(invoiceDto.getDuedate()!=null?invoiceDto.getDuedate():null);
                List<Estimationdetail> invlist = invoiceDto.getInvdetailList();
                for(Estimationdetail invdetail:invlist){
                    Product prd = productService.findProductByName(invdetail.getProduct()!=null?invdetail.getProduct():"");
                    //save the product extra fields too.
                    if(prd!=null){
                        prd.setDescription(invdetail.getDescription());
                        prd.setPrice(invdetail.getPrice());
                        productRespository.save(prd);
                    }
                    invdetail.setProductid(prd!=null?prd.getId():0);
                }
                invoice.setInvdetailList(invoiceDto.getInvdetailList()!=null?invoiceDto.getInvdetailList():null);
                invoice.setSubtotal(invoiceDto.getSubtotal()!=null?invoiceDto.getSubtotal():null);
                invoice.setTax(invoiceDto.getTax()!=null?invoiceDto.getTax():null);
                invoice.setTotal(invoiceDto.getTotal()!=null?invoiceDto.getTotal():null);
                
                System.out.println(" Estimation to be saved:"+invoice);
		
		return repository.save(invoice);
	}

	@Override
	public void deleteInvoice(Estimation invoice) {
		
		repository.delete(invoice); 
	}

    @Override
    public List<Estimation> listInvoices() {
        return repository.findAll();
    }

    @Override
    public Estimation getLastInvoice() {
        List<Estimation> listinv = repository.findWithPageable(new PageRequest(0, 2, Sort.Direction.DESC, "id"));
        System.out.println(listinv);
        if (listinv != null && !listinv.isEmpty()) {
            return listinv.get(0);
        } else {
            return null;
            
        }
    }
	
        
}