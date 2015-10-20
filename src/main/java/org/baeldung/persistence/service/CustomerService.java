package org.baeldung.persistence.service;

import java.util.List;

import javax.transaction.Transactional;

import org.baeldung.persistence.dao.CustomerRespository;
import org.baeldung.persistence.dao.PasswordResetTokenRepository;
import org.baeldung.persistence.dao.RoleRepository;
import org.baeldung.persistence.dao.VerificationTokenRepository;
import org.baeldung.persistence.model.Customer;
import org.baeldung.persistence.model.PasswordResetToken;
import org.baeldung.persistence.model.User;
import org.baeldung.validation.EmailExistsException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRespository repository;
    private SessionFactory sessionFactory;

    @Override
    public Customer registerNewCustomerAccount(CustomerDto customerDto)
            throws EmailExistsException {
        final Customer customer = new Customer();

        customer.setFirstName(customerDto.getFirstName());
        customer.setLastName(customerDto.getLastName());
        customer.setName(customerDto.getName());
        customer.setEmail(customerDto.getEmail());
        customer.setState(customerDto.getState());
        customer.setCountry(customerDto.getCountry());
        customer.setCity(customerDto.getCity());
        customer.setStreetAddress(customerDto.getStreetAddress());
        customer.setZip(customerDto.getZip());

        return repository.save(customer);
    }

    @Override
    public List<Customer> listCustomers() {
        final List<Customer> customers = repository.findAll();
        return customers;
    }

    @Override
    public void deleteCustomer(Customer customer) {

        repository.delete(customer);

    }

    @Override
    public Customer findCustomer(int customerID) {

        final List<Customer> customers = repository.findAll();

        for (Customer customer : customers) {
            if (customer.getId() == customerID) {
                return customer;
            }

        }
        return null;
    }

    @Override
    public Customer findCustomerByName(String name) {
        final List<Customer> customers = repository.findAll();

        for (Customer customer : customers) {
            if (customer.getName() != null && name != null
                    && customer.getName().equals(name)) {
                return customer;
            }

        }
        return null;
    }
}