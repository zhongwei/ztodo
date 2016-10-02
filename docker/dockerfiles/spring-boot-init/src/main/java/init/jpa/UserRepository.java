package init.jpa;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

/**
 * Created by zhongwei on 2016/10/2.
 */

public interface UserRepository extends CrudRepository<User, Long> {

    User findByTheUsersName(String username);

    Optional<User> findByUsername(Optional<String> username);

    List<User> findByLastname(String lastname);

    @Query("select u from User u where u.firstname = :firstname")
    List<User> findByFirstname(String firstname);

    @Query("select u from User u where u.firstname = :name or u.lastname = :name")
    List<User> findByFirstnameOrLastname(String name);

    Long removeByLastname(String lastname);

    /**
     * Returns a {@link Slice} counting a maximum number of {@link Pageable#getPageSize()} users matching given criteria
     * starting at {@link Pageable#getOffset()} without prior count of the total number of elements available.
     *
     * @param lastname
     * @param page
     * @return
     */
    Slice<User> findByLastnameOrderByUsernameAsc(String lastname, Pageable page);

    /**
     * Return the first 2 users ordered by their lastname asc.
     * <p>
     * <pre>
     * Example for findFirstK / findTopK functionality.
     * </pre>
     *
     * @return
     */
    List<User> findFirst2ByOrderByLastnameAsc();

    /**
     * Return the first 2 users ordered by the given {@code sort} definition.
     * <p>
     * <pre>
     * This variant is very flexible because one can ask for the first K results when a ASC ordering
     * is used as well as for the last K results when a DESC ordering is used.
     * </pre>
     *
     * @param sort
     * @return
     */
    List<User> findTop2By(Sort sort);

    @Query("select u from User u where u.firstname = :#{#user.firstname} or u.lastname = :#{#user.lastname}")
    Iterable<User> findByFirstnameOrLastname(User user);
}