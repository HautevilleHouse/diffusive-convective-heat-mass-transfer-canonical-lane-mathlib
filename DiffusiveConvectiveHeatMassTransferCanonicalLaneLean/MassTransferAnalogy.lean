import canonicalLaneMathlib.AdmissibleClass

/-!
# Mass Transfer Analogy Package

This module encodes the analogy between heat and mass transfer via the Chilton-Colburn j-factor.
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure MassTransferAnalogyPackage where
  reynoldsNumber : ℝ
  schmidtNumber : ℝ
  prandtlNumber : ℝ
  heatTransferFactor : ℝ  -- j_H
  massTransferFactor : ℝ  -- j_D
  analogyRelation : Prop
  analogyValid : analogyRelation

def MassTransferAnalogyClosed (M : MassTransferAnalogyPackage) : Prop :=
  M.analogyRelation

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse