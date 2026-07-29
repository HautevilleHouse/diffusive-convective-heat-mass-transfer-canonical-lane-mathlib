import canonicalLaneMathlib.AdmissibleClass

/-!
# Convection-Diffusion PDE Package

This module defines the convection-diffusion equation structure for heat and mass transfer.
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure ConvectionDiffusionPDEPackage where
  timeParameter : Type u
  spatialDimension : Type v
  temperatureField : timeParameter -> spatialDimension -> ℝ
  velocityField : timeParameter -> spatialDimension -> ℝ
  thermalDiffusivity : ℝ
  heatSource : timeParameter -> spatialDimension -> ℝ
  equationForm : Prop
  initialCondition : Prop
  boundaryCondition : Prop

def ConvectionDiffusionPDEClosed (P : ConvectionDiffusionPDEPackage) : Prop :=
  P.equationForm ∧ P.initialCondition ∧ P.boundaryCondition

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse