import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure InitialBoundaryConditionsPackage where
  initialTemperature : ℝ → ℝ
  boundaryTemperature : ℝ → ℝ → ℝ
  initialConcentration : ℝ → ℝ
  boundaryConcentration : ℝ → ℝ → ℝ
  dirichletCondition : Prop
  neumannCondition : Prop
  robinCondition : Prop
  wellPosed : Prop

structure InitialBoundaryConditionsEvidence (I : InitialBoundaryConditionsPackage) where
  dirichletConditionClosed : I.dirichletCondition
  neumannConditionClosed : I.neumannCondition
  robinConditionClosed : I.robinCondition
  wellPosedClosed : I.wellPosed

def InitialBoundaryConditionsClosed (I : InitialBoundaryConditionsPackage) : Prop :=
  I.dirichletCondition ∧ I.neumannCondition ∧ I.robinCondition ∧ I.wellPosed

theorem initial_boundary_conditions_closed_from_evidence
    (I : InitialBoundaryConditionsPackage)
    (E : InitialBoundaryConditionsEvidence I) : InitialBoundaryConditionsClosed I := by
  exact And.intro E.dirichletConditionClosed
    (And.intro E.neumannConditionClosed
      (And.intro E.robinConditionClosed E.wellPosedClosed))

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse