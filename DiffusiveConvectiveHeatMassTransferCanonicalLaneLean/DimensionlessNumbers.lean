import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure DimensionlessNumbers where
  reynoldsNumber : ℝ
  prandtlNumber : ℝ
  schmidtNumber : ℝ
  pecletNumber : ℝ
  nusseltNumber : ℝ
  sherwoodNumber : ℝ
  reynoldsDefined : Prop
  prandtlDefined : Prop
  schmidtDefined : Prop
  pecletDefined : Prop
  nusseltDefined : Prop
  sherwoodDefined : Prop
  reynoldsDefinedTerm : reynoldsDefined
  prandtlDefinedTerm : prandtlDefined
  schmidtDefinedTerm : schmidtDefined
  pecletDefinedTerm : pecletDefined
  nusseltDefinedTerm : nusseltDefined
  sherwoodDefinedTerm : sherwoodDefined

structure DimensionlessNumbersEvidence (N : DimensionlessNumbers) where
  reynoldsDefinedClosed : N.reynoldsDefined
  prandtlDefinedClosed : N.prandtlDefined
  schmidtDefinedClosed : N.schmidtDefined
  pecletDefinedClosed : N.pecletDefined
  nusseltDefinedClosed : N.nusseltDefined
  sherwoodDefinedClosed : N.sherwoodDefined

def DimensionlessNumbersClosed (N : DimensionlessNumbers) : Prop :=
  N.reynoldsDefined ∧ N.prandtlDefined ∧ N.schmidtDefined ∧ N.pecletDefined ∧ N.nusseltDefined ∧ N.sherwoodDefined

theorem dimensionless_numbers_closed_from_evidence (N : DimensionlessNumbers) (E : DimensionlessNumbersEvidence N) : DimensionlessNumbersClosed N := by
  exact And.intro E.reynoldsDefinedClosed (And.intro E.prandtlDefinedClosed (And.intro E.schmidtDefinedClosed (And.intro E.pecletDefinedClosed (And.intro E.nusseltDefinedClosed E.sherwoodDefinedClosed))))

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse