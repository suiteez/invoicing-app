package org.baeldung.persistence.model;

import com.sun.istack.internal.Nullable;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
//import javax.validation.constraints.NotNull;

@Entity
@Table(name = "INVOICEDETAIL")
public class Invoicedetail implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @NotNull
    private Integer id;
    @ManyToOne
    @JoinColumn(name="invoice_id"
            ,insertable=false, updatable=false, 
                nullable=true
            )
//    @NotNull
    private Invoice invoice;
//    @NotNull
    private Integer productid;
    @NotNull
    private String product;
    @NotNull
    private String description;
    @NotNull
    private Integer quantity;
    @NotNull
    private BigDecimal price;
    @NotNull
    private BigDecimal tax;
    @NotNull
    private BigDecimal amount;

        public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

        public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "InvoiceDto [product=" + product + ", description="
                + description + ", quantity=" + quantity + ", price=" + price
                + ", tax=" + tax + ", amount=" + amount + "]";
    }
}
