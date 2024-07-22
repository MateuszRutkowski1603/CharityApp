package pl.coderslab.charity.donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.institution.InstitutionRepository;



@Controller
public class DonationController {
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;

    public DonationController(DonationRepository donationRepository, CategoryRepository categoryRepository, InstitutionRepository institutionRepository) {
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
    }
    @GetMapping("/donation/add")
    public String ShowAddDonation(Model model) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institutions", institutionRepository.findAll());
        return "donationForm";
    }
    @PostMapping("/donation/add")
    public String AddDonation(@ModelAttribute Donation donation,Model model) {
        donationRepository.save(donation);
        model.addAttribute("donation", donation);
        return "donationSummary";
    }
}
