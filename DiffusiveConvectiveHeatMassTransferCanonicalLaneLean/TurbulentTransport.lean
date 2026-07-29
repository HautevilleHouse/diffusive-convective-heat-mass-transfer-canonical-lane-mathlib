import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure TurbulentTransportPackage where
  turbulentViscosity : Prop
  eddyDiffusivity : Prop
  reynoldsStress : Prop
  turbulentHeatFlux : Prop
  turbulentMassFlux : Prop
  closureModel : Prop

def TurbulentTransportClosed (T : TurbulentTransportPackage) : Prop :=
  T.turbulentViscosity ∧ T.eddyDiffusivity ∧ T.reynoldsStress ∧
  T.turbulentHeatFlux ∧ T.turbulentMassFlux ∧ T.closureModel

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse