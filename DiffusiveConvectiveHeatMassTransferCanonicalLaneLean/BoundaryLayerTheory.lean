import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Layer Theory Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure BoundaryLayerTheoryPackage where
  thermalBoundaryLayer : Prop
  concentrationBoundaryLayer : Prop
  boundaryLayerThickness : ℝ
  heatTransferCoefficient : ℝ
  massTransferCoefficient : ℝ
  analogyValid : Prop
  scalingLaws : Prop
  empiricalCorrelations : Prop

structure BoundaryLayerTheoryEvidence (B : BoundaryLayerTheoryPackage) where
  thermalBoundaryLayerClosed : B.thermalBoundaryLayer
  concentrationBoundaryLayerClosed : B.concentrationBoundaryLayer
  analogyValidClosed : B.analogyValid
  scalingLawsClosed : B.scalingLaws
  empiricalCorrelationsClosed : B.empiricalCorrelations

def BoundaryLayerTheoryClosed (B : BoundaryLayerTheoryPackage) : Prop :=
  B.thermalBoundaryLayer ∧ B.concentrationBoundaryLayer ∧
  B.analogyValid ∧ B.scalingLaws ∧ B.empiricalCorrelations

theorem boundary_layer_theory_closed_from_evidence
    (B : BoundaryLayerTheoryPackage) (E : BoundaryLayerTheoryEvidence B) :
    BoundaryLayerTheoryClosed B := by
  exact And.intro E.thermalBoundaryLayerClosed
    (And.intro E.concentrationBoundaryLayerClosed
      (And.intro E.analogyValidClosed
        (And.intro E.scalingLawsClosed E.empiricalCorrelationsClosed)))

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse