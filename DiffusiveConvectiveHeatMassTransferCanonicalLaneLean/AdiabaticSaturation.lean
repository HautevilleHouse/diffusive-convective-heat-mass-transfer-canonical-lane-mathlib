import DiffusiveConvectiveHeatMassTransferCanonicalLaneLean.BoundaryLayerAnalysis

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure AdiabaticSaturationPackage {F : ConvectionDiffusionPDEPackage}
    {T : ThermodynamicForcesPackage F} {B : BoundaryLayerPackage F T} where
  wetBulbTemperature : ℝ
  saturationHumidity : ℝ
  psychrometricRatio : ℝ
  heatMassTransferAnalogy : Prop
  lewisNumber : ℝ
  adiabaticSaturationCondition : Prop

structure AdiabaticSaturationEvidence {F : ConvectionDiffusionPDEPackage}
    {T : ThermodynamicForcesPackage F} {B : BoundaryLayerPackage F T}
    (A : AdiabaticSaturationPackage F T B) where
  heatMassTransferAnalogyClosed : A.heatMassTransferAnalogy
  adiabaticSaturationConditionClosed : A.adiabaticSaturationCondition

def AdiabaticSaturationClosed {F : ConvectionDiffusionPDEPackage}
    {T : ThermodynamicForcesPackage F} {B : BoundaryLayerPackage F T}
    (A : AdiabaticSaturationPackage F T B) : Prop :=
  A.heatMassTransferAnalogy ∧ A.adiabaticSaturationCondition

theorem adiabatic_saturation_closed_from_evidence
    {F : ConvectionDiffusionPDEPackage} {T : ThermodynamicForcesPackage F}
    {B : BoundaryLayerPackage F T} (A : AdiabaticSaturationPackage F T B)
    (E : AdiabaticSaturationEvidence A) : AdiabaticSaturationClosed A := by
  exact And.intro E.heatMassTransferAnalogyClosed E.adiabaticSaturationConditionClosed

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse