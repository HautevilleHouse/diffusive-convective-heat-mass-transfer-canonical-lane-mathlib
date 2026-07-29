import DiffusiveConvectiveHeatMassTransferCanonicalLaneLean.ThermodynamicForces

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure BoundaryLayerPackage {F : ConvectionDiffusionPDEPackage}
    {T : ThermodynamicForcesPackage F} where
  thermalBoundaryLayerThickness : ℝ
  massBoundaryLayerThickness : ℝ
  prandtlNumber : ℝ
  schmidtNumber : ℝ
  nusseltNumber : ℝ
  sherwoodNumber : ℝ
  similaritySolution : Prop
  correlationClosed : Prop

structure BoundaryLayerEvidence {F : ConvectionDiffusionPDEPackage}
    {T : ThermodynamicForcesPackage F} (B : BoundaryLayerPackage F T) where
  similaritySolutionClosed : B.similaritySolution
  correlationClosedClosed : B.correlationClosed

def BoundaryLayerClosed {F : ConvectionDiffusionPDEPackage}
    {T : ThermodynamicForcesPackage F} (B : BoundaryLayerPackage F T) : Prop :=
  B.similaritySolution ∧ B.correlationClosed

theorem boundary_layer_closed_from_evidence
    {F : ConvectionDiffusionPDEPackage} {T : ThermodynamicForcesPackage F}
    (B : BoundaryLayerPackage F T) (E : BoundaryLayerEvidence B) :
    BoundaryLayerClosed B := by
  exact And.intro E.similaritySolutionClosed E.correlationClosedClosed

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse