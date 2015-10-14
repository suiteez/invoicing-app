package org.baeldung.persistence.service;

import java.util.List;
import org.baeldung.persistence.model.Estimation;

public interface IEstimationService {

    Estimation addNewInvoice(EstimationDto estimationDto);

    void deleteInvoice(Estimation invoice);

    public List<Estimation> listInvoices();
}
