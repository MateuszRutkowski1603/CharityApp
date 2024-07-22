package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.donation.Donation;
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.Institution;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {
    private final DonationRepository donationRepository;

    public HomeController(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model) {
        List<Donation> donations = donationRepository.findAll();
        Long totalBags = donationRepository.findTotalBags();
        Long totalDonations = donationRepository.findTotalDonations();

        Set<Institution> uniqueInstitutions = new HashSet<>();
        for (Donation donation : donations) {
            uniqueInstitutions.add(donation.getInstitution());
        }

        model.addAttribute("uniqueInstitutions", uniqueInstitutions);
        model.addAttribute("totalBags", totalBags);
        model.addAttribute("totalDonations", totalDonations);
        return "main";
    }
}
