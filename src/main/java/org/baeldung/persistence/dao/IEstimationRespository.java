/**
 * 
 */
package org.baeldung.persistence.dao;

import java.util.List;
import org.baeldung.persistence.model.Estimation;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @author sachinbabujettipraksh
 *
 */
public interface IEstimationRespository extends JpaRepository<Estimation, Long> {
	
	    @Override
	    void delete(Estimation invoice);

    @Query(value = "select i from Estimation i")
    public List<Estimation> findWithPageable(PageRequest pageRequest);

	

}
