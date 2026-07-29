import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure MassTransferPackage where
  speciesConcentration : ℝ → ℝ → ℝ
  diffusionCoefficientForSpecies : ℝ
  reactionRate : ℝ → ℝ
  ficksLawValid : Prop
  massConservation : Prop
  initialConcentration : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  ficksLawValidClosed : M.ficksLawValid
  massConservationClosed : M.massConservation
  initialConcentrationClosed : M.initialConcentration

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.ficksLawValid ∧ M.massConservation ∧ M.initialConcentration

theorem mass_transfer_closed_from_evidence (M : MassTransferPackage)
    (E : MassTransferEvidence M) : MassTransferClosed M := by
  exact And.intro E.ficksLawValidClosed (And.intro E.massConservationClosed E.initialConcentrationClosed)

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse