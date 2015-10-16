package org.baeldung.web.controller;

import java.util.Locale;
import javax.validation.Valid;
import org.baeldung.persistence.model.Estimation;
import org.baeldung.persistence.model.Estimationdetail;
import org.baeldung.persistence.service.*;
import org.baeldung.web.error.CustomerNotFoundException;
import org.baeldung.web.error.ProductNotFoundException;
import org.baeldung.web.util.GenericResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EstimationController {

    private final Logger LOGGER = LoggerFactory.getLogger(getClass());
    @Autowired
    private IEstimationService estimateService;
    @Autowired
    private IProductService productService;
    @Autowired
    private ICustomerService customerService;
    @Autowired
    private MessageSource messages;

    public EstimationController() {
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
    @RequestMapping(value = "/estimation", method = RequestMethod.GET)
    public String listExisitingCustomers(Model model) {

        model.addAttribute("productList", productService.listProducts());
        model.addAttribute("productName", productService.listProductNames());
        model.addAttribute("customerList", customerService.listCustomers());
        model.addAttribute("invoiceList",estimateService.listInvoices());
        EstimationDto invoiceDto = new EstimationDto();
        invoiceDto.getInvdetailList().add(new Estimationdetail());
        model.addAttribute("invoice", invoiceDto);

        return "estimationlist";
    }

    @RequestMapping(value = "/estimation/add", method = RequestMethod.GET)
    public String getAddInvoice(Model model) {

        LOGGER.debug("getAddestimation {}");

        model.addAttribute("productList", productService.listProducts());
        model.addAttribute("productName", productService.listProductNames());
        model.addAttribute("customerList", customerService.listCustomers());
        EstimationDto invoiceDto = new EstimationDto();
        invoiceDto.getInvdetailList().add(new Estimationdetail());
        model.addAttribute("invoice", invoiceDto);

        return "estimation";
    }

    @RequestMapping(value = "/estimation/add", method = RequestMethod.POST)
    @ResponseBody
    public GenericResponse saveInvoice(final Locale locale, @Valid final EstimationDto invoiceDto, BindingResult result, Model m) {
        LOGGER.debug("Saving estimation{}", invoiceDto);
        System.out.println("Saving estimation{}" + invoiceDto);

        if (customerService.findCustomerByName(invoiceDto.getCustomer()) == null) {
            throw new CustomerNotFoundException();
        }
        if (invoiceDto.getInvdetailList() != null) {
            for (Estimationdetail i : invoiceDto.getInvdetailList()) {
                if (productService.findProductByName(i.getProduct()) == null) {
                    throw new ProductNotFoundException();
                }
            }
        }
//        if (result.hasErrors()) {
//            return "invoice";
//        }
        if (invoiceDto != null) {
            estimateService.addNewInvoice(invoiceDto);
            final String message = messages.getMessage("auth.message.invalidToken", null, locale);
            m.addAttribute("message", message);
        } else {
            LOGGER.debug("Invoicedto is null");
            System.out.println("Invoicedto is null");
        }
        return new GenericResponse("success");
    }

    @RequestMapping(value = "/estimation/getid", method = RequestMethod.GET)
    @ResponseBody
    public GenericResponse getAddEstimation() {

        LOGGER.debug("getAddInvoice Invoice{}");

        Estimation inv = estimateService.getLastInvoice();
        EstimationDto invoiceDto = clone(inv);

        return new GenericResponse("success",invoiceDto);
    }

    private EstimationDto clone(Estimation inv) {
        EstimationDto dto = new EstimationDto();
        if(inv!=null){
            dto.setId(inv.getId());
            dto.setEstimateno(inv.getEstimateno());
            dto.setEstimatelabel(inv.getEstimatelabel());
            dto.setCustomer(inv.getCustomer().getName());
            dto.setDuedate(inv.getDuedate());
            dto.setInvoicedate(inv.getInvoicedate());
//            dto.setStatus(inv.getStatus());
            dto.setSubtotal(inv.getSubtotal());
            dto.setTax(inv.getTax());
            dto.setTotal(inv.getTotal());
        }else{
            System.out.println("clone () invoice is null.");
        }
        return dto;
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
