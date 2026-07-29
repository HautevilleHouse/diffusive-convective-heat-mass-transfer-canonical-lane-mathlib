import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure HeatConductionPackage where
  thermalConductivity : ℝ → ℝ
  heatCapacity : ℝ → ℝ
  heatSource : ℝ → ℝ
  temperatureProfile : ℝ → ℝ
  fourierLawValid : Prop
  energyConservation : Prop
  initialTemperature : Prop

structure HeatConductionEvidence (H : HeatConductionPackage) where
  fourierLawValidClosed : H.fourierLawValid
  energyConservationClosed : H.energyConservation
  initialTemperatureClosed : H.initialTemperature

def HeatConductionClosed (H : HeatConductionPackage) : Prop :=
  H.fourierLawValid ∧ H.energyConservation ∧ H.initialTemperature

theorem heat_conduction_closed_from_evidence (H : HeatConductionPackage)
    (E : HeatConductionEvidence H) : HeatConductionClosed H := by
  exact And.intro E.fourierLawValidClosed (And.intro E.energyConservationClosed E.initialTemperatureClosed)

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse