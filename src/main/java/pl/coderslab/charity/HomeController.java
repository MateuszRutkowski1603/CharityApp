package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.donation.Donation;
import pl.coderslab.charity.donation.DonationRepository;

import java.util.List;


@Controller
public class HomeController {
    private final DonationRepository donationRepository;

    public HomeController(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        List<Donation> donations = donationRepository.findAll();
        Long totalBags = donationRepository.findTotalBags();
        Long totalDonations = donationRepository.findTotalDonations();
        model.addAttribute("donations", donations);
        model.addAttribute("totalBags", totalBags);
        model.addAttribute("totalDonations", totalDonations);
        return "main";
    }
}
