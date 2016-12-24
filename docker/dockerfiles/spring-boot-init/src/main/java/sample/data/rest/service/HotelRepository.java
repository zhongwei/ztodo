
package sample.data.rest.service;

import sample.data.rest.domain.City;
import sample.data.rest.domain.Hotel;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "hotels", path = "hotels")
interface HotelRepository extends PagingAndSortingRepository<Hotel, Long> {

	Hotel findByCityAndName(City city, String name);

}
