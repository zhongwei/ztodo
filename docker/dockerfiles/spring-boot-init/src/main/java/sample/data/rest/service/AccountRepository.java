package sample.data.rest.service;

/**
 * Created by zhongwei on 23/12/2016.
 */
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import sample.data.rest.domain.Account;

@RepositoryRestResource(collectionResourceRel = "accounts", path = "accounts")
interface AccountRepository extends PagingAndSortingRepository<Account, Long> {
    public Account findByNumber(String accountNumber);

    public List<Account> findByOwnerContainingIgnoreCase(String partialName);

    @Query("SELECT count(*) from Account")
    public int countAccounts();
}
