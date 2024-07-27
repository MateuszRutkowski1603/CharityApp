package pl.coderslab.charity.institution;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.donation.DonationRepository;

import javax.transaction.Transactional;
import java.util.Optional;

@Controller
@RequestMapping("/institutions")
public class InstitutionController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    public InstitutionController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping("/list")
    public String listInstitutions(Model model) {
        model.addAttribute("institutions", institutionRepository.findAll());
        return "institutions/list";
    }

    @GetMapping("/add")
    public String showAddInstitutionForm(Model model) {
        model.addAttribute("institution", new Institution());
        return "institutions/add";
    }

    @PostMapping("/add")
    public String addInstitution(@ModelAttribute Institution institution) {
        institutionRepository.save(institution);
        return "redirect:/institutions/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditInstitutionForm(@PathVariable Long id, Model model) {
        Optional<Institution> institution = institutionRepository.findById(id);
        if (institution.isPresent()) {
            model.addAttribute("institution", institution.get());
            return "institutions/edit";
        } else {
            return "redirect:/institutions/list";
        }
    }

    @PostMapping("/edit/{id}")
    public String editInstitution(@PathVariable Long id, @ModelAttribute Institution institution) {
        Institution editedInstitution = institutionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Nie znaleziono instytucji o id: " + id));
        editedInstitution.setName(institution.getName());
        editedInstitution.setDescription(institution.getDescription());
        institutionRepository.save(editedInstitution);
        return "redirect:/institutions/list";
    }

    @Transactional
    @GetMapping("/delete/{id}")
    public String deleteInstitution(@PathVariable Long id) {
        donationRepository.deleteAllByInstitutionId(id);
        institutionRepository.deleteById(id);
        return "redirect:/institutions/list";
    }
}
