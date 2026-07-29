import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure DiffusiveConvectiveSystem where
  speciesConcentration : Type u -> Type v
  temperatureField : Type u -> Type w
  velocityField : Type u -> Type x
  pressureField : Type u -> Type y
  concentrationEquation : Prop
  energyEquation : Prop
  momentumEquation : Prop
  continuityEquation : Prop
  concentrationEquationTerm : concentrationEquation
  energyEquationTerm : energyEquation
  momentumEquationTerm : momentumEquation
  continuityEquationTerm : continuityEquation

structure DiffusiveConvectiveSystemEvidence (D : DiffusiveConvectiveSystem) where
  concentrationEquationClosed : D.concentrationEquation
  energyEquationClosed : D.energyEquation
  momentumEquationClosed : D.momentumEquation
  continuityEquationClosed : D.continuityEquation

def DiffusiveConvectiveSystemClosed (D : DiffusiveConvectiveSystem) : Prop :=
  D.concentrationEquation ∧ D.energyEquation ∧ D.momentumEquation ∧ D.continuityEquation

theorem diffusive_convective_system_closed_from_evidence (D : DiffusiveConvectiveSystem) (E : DiffusiveConvectiveSystemEvidence D) : DiffusiveConvectiveSystemClosed D := by
  exact And.intro E.concentrationEquationClosed (And.intro E.energyEquationClosed (And.intro E.momentumEquationClosed E.continuityEquationClosed))

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse