package org.baeldung.persistence.service;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.baeldung.persistence.model.Customer;
import org.baeldung.validation.PasswordMatches;
import org.baeldung.validation.ValidEmail;
import org.baeldung.validation.ValidPassword;

public class CustomerDto {

    @NotNull
    @Size(min = 1)
    private String firstName;
    @NotNull
    @Size(min = 1)
    private String lastName;
    @NotNull
    @Size(min = 1)
    private String name;
    @ValidEmail
//    @NotNull
//    @Size(min = 1)
    private String email;
    private String streetAddress;
    private String city;
    private String zip;
    private String country;
    private String state;
    private List<Customer> listCustomers;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(final String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(final String lastName) {
        this.lastName = lastName;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<Customer> getListCustomers() {
        return listCustomers;
    }

    public void setListCustomers(List<Customer> listCustomers) {
        Customer newCustomer = new Customer();
        newCustomer.setFirstName("firstName");
        newCustomer.setLastName("lastName");
        listCustomers.add(newCustomer);
        this.listCustomers = listCustomers;
    }

    @Override
    public String toString() {
        return "CustomerDto [firstName=" + firstName + ", lastName=" + lastName
                + ", email=" + email + "]";
    }
}
