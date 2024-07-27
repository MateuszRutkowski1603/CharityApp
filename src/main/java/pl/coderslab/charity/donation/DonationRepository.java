package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("SELECT SUM(d.quantity) FROM Donation d")
    Long findTotalBags();

    @Query("SELECT COUNT(d) FROM Donation d")
    Long findTotalDonations();

    void deleteAllByInstitutionId(Long institutionId);
}
