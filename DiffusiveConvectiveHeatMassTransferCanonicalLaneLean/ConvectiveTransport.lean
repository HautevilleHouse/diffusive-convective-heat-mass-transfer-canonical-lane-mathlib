import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure ConvectiveTransportPackage where
  fluidVelocity : ℝ → ℝᵈ
  advectiveFlux : ℝ → ℝᵈ
  reynoldsNumber : ℝ
  pecletNumber : ℝ
  momentumEquation : Prop
  advectionDominance : Prop
  boundaryLayer : Prop

structure ConvectiveTransportEvidence (C : ConvectiveTransportPackage) where
  momentumEquationClosed : C.momentumEquation
  advectionDominanceClosed : C.advectionDominance
  boundaryLayerClosed : C.boundaryLayer

def ConvectiveTransportClosed (C : ConvectiveTransportPackage) : Prop :=
  C.momentumEquation ∧ C.advectionDominance ∧ C.boundaryLayer

theorem convective_transport_closed_from_evidence (C : ConvectiveTransportPackage)
    (E : ConvectiveTransportEvidence C) : ConvectiveTransportClosed C := by
  exact And.intro E.momentumEquationClosed (And.intro E.advectionDominanceClosed E.boundaryLayerClosed)

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse