import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerSystemAdmittedClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

def bridgeClosed (A : PowerSystemAdmissibleClass) : Prop :=
  A.object.powerFlowConverged

theorem bridge_from_admissible_class (A : PowerSystemAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion.left

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse
