/**
 *
 */
package org.baeldung.persistence.dao;

import java.util.List;
import org.baeldung.persistence.model.Invoice;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @author sachinbabujettipraksh
 *
 */
public interface IInvoiceRespository extends JpaRepository<Invoice, Long> {

    @Override
    void delete(Invoice invoice);

    @Query(value = "select i from Invoice i")
    public List<Invoice> findWithPageable(Pageable pageable);
}
