import canonicalLaneMathlib.AdmissibleClass

/-!
# Diffusion-Convection PDE Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure DiffusionConvectionPDEPackage where
  temperatureField : Type u
  concentrationField : Type v
  thermalConductivity : Type w
  massDiffusivity : Type x
  convectionVelocity : Type y
  heatEquation : Prop
  massEquation : Prop
  couplingTerms : Prop
  boundaryConditions : Prop
  initialConditions : Prop

structure DiffusionConvectionPDEEvidence (D : DiffusionConvectionPDEPackage) where
  heatEquationClosed : D.heatEquation
  massEquationClosed : D.massEquation
  couplingTermsClosed : D.couplingTerms
  boundaryConditionsClosed : D.boundaryConditions
  initialConditionsClosed : D.initialConditions

def DiffusionConvectionPDEClosed (D : DiffusionConvectionPDEPackage) : Prop :=
  D.heatEquation ∧ D.massEquation ∧ D.couplingTerms ∧ D.boundaryConditions ∧ D.initialConditions

theorem diffusion_convection_pde_closed_from_evidence
    (D : DiffusionConvectionPDEPackage) (E : DiffusionConvectionPDEEvidence D) :
    DiffusionConvectionPDEClosed D := by
  exact And.intro E.heatEquationClosed
    (And.intro E.massEquationClosed
      (And.intro E.couplingTermsClosed
        (And.intro E.boundaryConditionsClosed E.initialConditionsClosed)))

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse