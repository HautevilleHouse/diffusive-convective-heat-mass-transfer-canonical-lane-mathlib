import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

structure HeatMassAdmittedObject where
  domain : Type
  temperatureField : Type
  concentrationField : Type
  convectiveVelocity : Type
  diffusiveFlux : Type
  equationsSatisfied : Prop
  boundaryConditions : Prop
  initialConditions : Prop
  conclusion : equationsSatisfied ∧ boundaryConditions ∧ initialConditions

def HeatMassWitnessClosed (O : HeatMassAdmittedObject) : Prop :=
  O.conclusion

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse