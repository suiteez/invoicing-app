package org.baeldung.persistence.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.baeldung.persistence.dao.ProductRespository;
import org.baeldung.persistence.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class ProductService implements IProductService {

	@Autowired
	private ProductRespository repository;

	@Override
	public Product createNewProduct(ProductDto productDto) { 
		
		final Product product = new Product();
		product.setProductName(productDto.getProductName());
		product.setPrice(productDto.getPrice());
		product.setIncomeAccount(productDto.getIncomeAccount());
		product.setDescription(productDto.getDescription());
		
		return repository.save(product); 
	}

	@Override
	public void deleteProduct(Product product) {
		repository.delete(product);;
		
	}

	@Override
	public Product findProduct(int id) {
		final List<Product> products = repository.findAll();

		for (Product product : products) {
			if (product.getId() == id) {
				return product;
			}

		}
		return null;
	}
        
        @Override
	public Product findProductByName(String name) {
		final List<Product> products = repository.findAll();

		for (Product product : products) {
			if (product.getProductName()!=null && name !=null &&
                                product.getProductName().equals(name)) {
				return product;
			}

		}
		return null;
	}

	@Override
	public List<Product> listProducts() {
		
		List<Product> products = repository.findAll();
		
		for(Product product : products){
			
			product.getProductName();
		}
	
		return null;
	}

	@Override
	public List<String> listProductNames() {

		List<String> productNames = new ArrayList<String>();

		List<Product> products = repository.findAll();

		for (Product product : products) {

			productNames.add(product.getProductName());
		}

		return productNames;
	}
	
	@Override
	public List<String> listProductIncomeAmount() {

		List<String> productNames = new ArrayList<String>();

		List<Product> products = repository.findAll();

		for (Product product : products) {

			productNames.add(product.getProductName());
		}

		return productNames;
	}


}