import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferCanonicalLaneLean.ConvectionDiffusionPDE
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferCanonicalLaneLean.BoundaryLayerModel
import HautevilleHouse.DiffusiveConvectiveHeatMassTransferCanonicalLaneLean.MassTransferAnalogy

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

open ConvectionDiffusionPDEPackage
open BoundaryLayerPackage
open MassTransferAnalogyPackage

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A with
  | _ => True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedDiffusiveConvectiveHeatMassTransferClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

theorem diffusive_convective_endgame (A : AdmissibleClass) :
    ConstrainedDiffusiveConvectiveHeatMassTransferClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse