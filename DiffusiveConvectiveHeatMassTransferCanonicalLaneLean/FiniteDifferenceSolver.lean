import canonicalLaneMathlib.AdmissibleClass

/-!
# Finite Difference Solver Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure FiniteDifferenceSolverPackage where
  spatialDiscretization : Prop
  timeSteppingScheme : Prop
  stabilityCondition : Prop
  convergenceOrder : Prop
  boundaryConditionImplementation : Prop
  solverStable : Prop
  solverConvergent : Prop

structure FiniteDifferenceSolverEvidence (F : FiniteDifferenceSolverPackage) where
  spatialDiscretizationClosed : F.spatialDiscretization
  timeSteppingSchemeClosed : F.timeSteppingScheme
  stabilityConditionClosed : F.stabilityCondition
  convergenceOrderClosed : F.convergenceOrder
  boundaryConditionImplementationClosed : F.boundaryConditionImplementation
  solverStableClosed : F.solverStable
  solverConvergentClosed : F.solverConvergent

def FiniteDifferenceSolverClosed (F : FiniteDifferenceSolverPackage) : Prop :=
  F.spatialDiscretization ∧ F.timeSteppingScheme ∧ F.stabilityCondition ∧
  F.convergenceOrder ∧ F.boundaryConditionImplementation ∧
  F.solverStable ∧ F.solverConvergent

theorem finite_difference_solver_closed_from_evidence
    (F : FiniteDifferenceSolverPackage) (E : FiniteDifferenceSolverEvidence F) :
    FiniteDifferenceSolverClosed F := by
  exact And.intro E.spatialDiscretizationClosed
    (And.intro E.timeSteppingSchemeClosed
      (And.intro E.stabilityConditionClosed
        (And.intro E.convergenceOrderClosed
          (And.intro E.boundaryConditionImplementationClosed
            (And.intro E.solverStableClosed E.solverConvergentClosed)))))

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse