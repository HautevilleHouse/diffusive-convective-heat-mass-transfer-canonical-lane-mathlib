import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmissibleClosure A

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiffusiveConvectiveHeatMassTransferCanonicalLaneLean
end HautevilleHouse