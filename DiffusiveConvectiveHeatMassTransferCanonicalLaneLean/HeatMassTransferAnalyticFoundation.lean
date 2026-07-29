import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure HeatMassTransferAnalyticFoundation where
  pde : ConvectionDiffusionPDEPackage
  boundaryLayer : BoundaryLayerPackage
  turbulence : TurbulentTransportPackage
  foundationClosed : Prop
  evidence : foundationClosed

def FoundationClosed (F : HeatMassTransferAnalyticFoundation) : Prop :=
  ConvectionDiffusionPDEClosed F.pde ∧ BoundaryLayerClosed F.boundaryLayer ∧
  TurbulentTransportClosed F.turbulence

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse