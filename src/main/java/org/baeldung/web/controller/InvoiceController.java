package org.baeldung.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.validation.Valid;
import org.baeldung.persistence.model.Invoicedetail;
import org.baeldung.persistence.service.ICustomerService;
import org.baeldung.persistence.service.IInvoiceService;
import org.baeldung.persistence.service.IProductService;
import org.baeldung.persistence.service.InvoiceDto;
import org.baeldung.web.error.CustomerNotFoundException;
import org.baeldung.web.error.ProductNotFoundException;
import org.baeldung.web.util.GenericResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InvoiceController {

    private final Logger LOGGER = LoggerFactory.getLogger(getClass());
    @Autowired
    private IInvoiceService invoiceService;
    @Autowired
    private IProductService productService;
    @Autowired
    private ICustomerService customerService;
    @Autowired
    private MessageSource messages;

    public InvoiceController() {
        super();
    }

//    @InitBinder
//    private void dateBinder(WebDataBinder binder) {
//        //The date format to parse or output your dates
//        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
//        //Create a new CustomDateEditor
//        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
//        //Register it as custom editor for the Date type
//        binder.registerCustomEditor(Date.class, editor);
//    }
    @RequestMapping(value = "/invoices", method = RequestMethod.GET)
    public String listExisitingCustomers(Model model) {

        model.addAttribute("productList", productService.listProducts());
        model.addAttribute("productName", productService.listProductNames());
        model.addAttribute("customerList", customerService.listCustomers());
        InvoiceDto invoiceDto = new InvoiceDto();
        invoiceDto.getInvdetailList().add(new Invoicedetail());
        model.addAttribute("invoice", invoiceDto);

        return "invoice";
    }

    @RequestMapping(value = "/invoices/add", method = RequestMethod.GET)
    public String getAddInvoice(Model model) {

        LOGGER.debug("getAddInvoice Invoice{}");

        model.addAttribute("productList", productService.listProducts());
        model.addAttribute("productName", productService.listProductNames());
        model.addAttribute("customerList", customerService.listCustomers());
        InvoiceDto invoiceDto = new InvoiceDto();
        invoiceDto.getInvdetailList().add(new Invoicedetail());
        model.addAttribute("invoice", invoiceDto);

        return "invoice";
    }

    @RequestMapping(value = "/invoice/add", method = RequestMethod.POST)
    @ResponseBody
    public GenericResponse saveInvoice(final Locale locale, @Valid final InvoiceDto invoiceDto, BindingResult result, Model m) {
        LOGGER.debug("Saving Invoice{}", invoiceDto);
        System.out.println("Saving Invoice{}" + invoiceDto);

        if (customerService.findCustomerByName(invoiceDto.getCustomer()) == null) {
            throw new CustomerNotFoundException();
        }
        if (invoiceDto.getInvdetailList() != null) {
            for (Invoicedetail i : invoiceDto.getInvdetailList()) {
                if (productService.findProductByName(i.getProduct()) == null) {
                    throw new ProductNotFoundException();
                }
            }
        }
//        if (result.hasErrors()) {
//            return "invoice";
//        }
        if (invoiceDto != null) {
            invoiceService.addNewInvoice(invoiceDto);
            final String message = messages.getMessage("auth.message.invalidToken", null, locale);
            m.addAttribute("message", message);
        } else {
            LOGGER.debug("Invoicedto is null");
            System.out.println("Invoicedto is null");
        }
        return new GenericResponse("success");
    }
    /*
     * @RequestMapping("/remove/{id}/invoice") public String
     * removeInvoice(@PathVariable("id") int id){
     *
     * Invoice invoice = invoiceService. Customer customer =
     * customerSerivce.findCustomer(id);
     *
     * customerSerivce.deleteCustomer(customer);
     *
     *
     * return "redirect:/customers"; }
     */
}
