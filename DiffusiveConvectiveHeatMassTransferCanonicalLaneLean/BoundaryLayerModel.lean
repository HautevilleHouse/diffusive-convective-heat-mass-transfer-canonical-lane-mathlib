import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Layer Model Package

This module formalizes the boundary layer approximation for high-Peclet-number flows.
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure BoundaryLayerPackage where
  velocityProfile : ℝ → ℝ  -- dimensionless velocity as function of similarity variable
  temperatureProfile : ℝ → ℝ  -- dimensionless temperature
  boundaryLayerThickness : ℝ
  heatFluxAtWall : ℝ
  velocityProfileValid : Prop
  temperatureProfileValid : Prop
  energyIntegralBalance : Prop

def BoundaryLayerClosed (B : BoundaryLayerPackage) : Prop :=
  B.velocityProfileValid ∧ B.temperatureProfileValid ∧ B.energyIntegralBalance

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse