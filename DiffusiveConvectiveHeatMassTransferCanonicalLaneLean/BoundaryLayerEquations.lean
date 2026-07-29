import DiffusiveConvectiveHeatMassTransferCanonicalLaneLean.DiffusiveConvectiveSystem

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure BoundaryLayerEquations {D : DiffusiveConvectiveSystem} where
  momentumBoundaryLayer : Prop
  thermalBoundaryLayer : Prop
  concentrationBoundaryLayer : Prop
  similaritySolution : Prop
  momentumBoundaryLayerTerm : momentumBoundaryLayer
  thermalBoundaryLayerTerm : thermalBoundaryLayer
  concentrationBoundaryLayerTerm : concentrationBoundaryLayer
  similaritySolutionTerm : similaritySolution

structure BoundaryLayerEquationsEvidence {D : DiffusiveConvectiveSystem} (B : BoundaryLayerEquations D) where
  momentumBoundaryLayerClosed : B.momentumBoundaryLayer
  thermalBoundaryLayerClosed : B.thermalBoundaryLayer
  concentrationBoundaryLayerClosed : B.concentrationBoundaryLayer
  similaritySolutionClosed : B.similaritySolution

def BoundaryLayerEquationsClosed {D : DiffusiveConvectiveSystem} (B : BoundaryLayerEquations D) : Prop :=
  B.momentumBoundaryLayer ∧ B.thermalBoundaryLayer ∧ B.concentrationBoundaryLayer ∧ B.similaritySolution

theorem boundary_layer_equations_closed_from_evidence {D : DiffusiveConvectiveSystem} (B : BoundaryLayerEquations D) (E : BoundaryLayerEquationsEvidence B) : BoundaryLayerEquationsClosed B := by
  exact And.intro E.momentumBoundaryLayerClosed (And.intro E.thermalBoundaryLayerClosed (And.intro E.concentrationBoundaryLayerClosed E.similaritySolutionClosed))

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse