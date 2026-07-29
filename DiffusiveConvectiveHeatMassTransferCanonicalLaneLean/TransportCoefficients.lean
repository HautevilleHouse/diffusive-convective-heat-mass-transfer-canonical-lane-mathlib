import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure TransportCoefficients where
  diffusivity : Type u
  thermalConductivity : Type v
  viscosity : Type w
  diffusivityPositive : Prop
  thermalConductivityPositive : Prop
  viscosityPositive : Prop
  diffusivityPositiveTerm : diffusivityPositive
  thermalConductivityPositiveTerm : thermalConductivityPositive
  viscosityPositiveTerm : viscosityPositive

structure TransportCoefficientsEvidence (T : TransportCoefficients) where
  diffusivityPositiveClosed : T.diffusivityPositive
  thermalConductivityPositiveClosed : T.thermalConductivityPositive
  viscosityPositiveClosed : T.viscosityPositive

def TransportCoefficientsClosed (T : TransportCoefficients) : Prop :=
  T.diffusivityPositive ∧ T.thermalConductivityPositive ∧ T.viscosityPositive

theorem transport_coefficients_closed_from_evidence (T : TransportCoefficients) (E : TransportCoefficientsEvidence T) : TransportCoefficientsClosed T := by
  exact And.intro E.diffusivityPositiveClosed (And.intro E.thermalConductivityPositiveClosed E.viscosityPositiveClosed)

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse