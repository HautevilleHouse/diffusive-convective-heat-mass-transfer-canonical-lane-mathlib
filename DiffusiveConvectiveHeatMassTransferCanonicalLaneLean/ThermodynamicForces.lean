import DiffusiveConvectiveHeatMassTransferCanonicalLaneLean.ConvectionDiffusionPDE

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure ThermodynamicForcesPackage {F : ConvectionDiffusionPDEPackage} where
  temperatureGradient : F.spatialDomain → ℝ³
  concentrationGradient : F.spatialDomain → ℝ³
  thermalDrivingForce : F.spatialDomain → ℝ³
  massDrivingForce : F.spatialDomain → ℝ³
  linearResponseCoefficients : Prop
  onsagerSymmetry : Prop
  entropyProduction : Prop

structure ThermodynamicForcesEvidence {F : ConvectionDiffusionPDEPackage}
    (T : ThermodynamicForcesPackage F) where
  linearResponseCoefficientsClosed : T.linearResponseCoefficients
  onsagerSymmetryClosed : T.onsagerSymmetry
  entropyProductionClosed : T.entropyProduction

def ThermodynamicForcesClosed {F : ConvectionDiffusionPDEPackage}
    (T : ThermodynamicForcesPackage F) : Prop :=
  T.linearResponseCoefficients ∧ T.onsagerSymmetry ∧ T.entropyProduction

theorem thermodynamic_forces_closed_from_evidence
    {F : ConvectionDiffusionPDEPackage} (T : ThermodynamicForcesPackage F)
    (E : ThermodynamicForcesEvidence T) : ThermodynamicForcesClosed T := by
  exact And.intro E.linearResponseCoefficientsClosed
    (And.intro E.onsagerSymmetryClosed E.entropyProductionClosed)

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse