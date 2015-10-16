package org.baeldung.persistence.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name = "INVOICE")
public class Invoice {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Basic(optional = false)
//    @Column(name = "id", nullable = false)
//    @GenericGenerator(name = "seq_id", strategy = "org.baeldung.persistence.conf.CustomGenerator", parameters = { @Parameter(name = "sequence", value = "INVOICE_PRM_SEQ") })
//    @GeneratedValue(generator = "seq_id")
    private int id;
    private String invoicelabel;
    private String invoiceno;
    
    @Temporal(TemporalType.DATE)
    private Date invoicedate;
    @Temporal(TemporalType.DATE)
    private Date duedate;
//    private int customerid;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "customerid")
    private Customer customer;
    private BigDecimal subtotal;
    private BigDecimal tax;
    private BigDecimal total;
    private Integer status;
//    @OneToMany(mappedBy="invoice")
    @OneToMany(cascade= CascadeType.ALL)
    @JoinColumn(name="invoice_id")
    private List<Invoicedetail> invdetailList = new ArrayList<> ();

    public Invoice() {
    }

    public Invoice(int id) {
        this.id = id;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInvoicelabel() {
        return invoicelabel;
    }

    public void setInvoicelabel(String invoicelabel) {
        this.invoicelabel = invoicelabel;
    }

    public String getInvoiceno() {
        return invoiceno;
    }

    public void setInvoiceno(String invoiceno) {
        this.invoiceno = invoiceno;
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

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

//    @JoinTable(
//            name="Invoicedetail",
//            joinColumns = @JoinColumn( name="PRODUCT_ID"),
//            inverseJoinColumns = @JoinColumn( name="PART_ID")
//    )
    public List<Invoicedetail> getInvdetailList() {
        return invdetailList;
    }

    public void setInvdetailList(List<Invoicedetail> invdetailList) {
        this.invdetailList = invdetailList;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    
    @Override
    public String toString() {
        return "Invoice{" + "id=" + id + ", invoicelabel=" + invoicelabel + 
                ", invoiceno=" + invoiceno + ", invoicedate=" + invoicedate + 
                ", duedate=" + duedate + ", status=" + status + ", customer=" + customer + 
                ", subtotal=" + subtotal + ", tax=" + tax + ", total=" + total + 
                ", invdetailList=" + invdetailList + '}';
    }

}
