package org.baeldung.persistence.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;
import org.baeldung.persistence.model.Estimationdetail;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

public class EstimationDto {

    private Integer id;
    @NotNull
    private String estimateno;
    @NotNull
    private String estimatelabel;
    @NotNull
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date invoicedate;
    @NotNull
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date duedate;
    @NotNull
    private String customer;
    @NotNull
    @NumberFormat(style = NumberFormat.Style.CURRENCY)
    private BigDecimal subtotal;
    @NotNull
    @NumberFormat(style = NumberFormat.Style.CURRENCY)
    private BigDecimal tax;
    @NotNull
    @NumberFormat(style = NumberFormat.Style.CURRENCY)
    private BigDecimal total;
    @NotEmpty
    private List<Estimationdetail> invdetailList = new ArrayList<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEstimateno() {
        return estimateno;
    }

    public void setEstimateno(String estimateno) {
        this.estimateno = estimateno;
    }

    public String getEstimatelabel() {
        return estimatelabel;
    }

    public void setEstimatelabel(String estimatelabel) {
        this.estimatelabel = estimatelabel;
    }

    public Date getInvoicedate() {
        return invoicedate;
    }

    public void setInvoicedate(Date invoicedate) {
        this.invoicedate = invoicedate;
    }

    public Date getDuedate() {
        return duedate;
    }

    public void setDuedate(Date duedate) {
        this.duedate = duedate;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public List<Estimationdetail> getInvdetailList() {
        return invdetailList;
    }

    public void setInvdetailList(List<Estimationdetail> invdetailList) {
        this.invdetailList = invdetailList;
    }

//	@Override
//	public String toString() {
//		return "InvoiceDto [id=" + id + ", product=" + product
//				+ ", description=" + description + ", quantity=" + quantity
//				+ ", price=" + price + ", tax=" + tax + ", amount=" + amount
//				+ "]";
//	}
    @Override
    public String toString() {
        return "EstimationDto{" + "id=" + id + ", invoicedate=" + invoicedate + ", "
                + "duedate=" + duedate + ", customer=" + customer + ", "
                + "subtotal=" + subtotal + ", tax=" + tax + ", total=" + total + ", "
                + "invdetailList=" + invdetailList + '}';
    }
}
