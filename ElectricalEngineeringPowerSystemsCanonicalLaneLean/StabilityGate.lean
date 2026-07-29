import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerSystemAdmittedClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

def gateClosed (A : PowerSystemAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : PowerSystemAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse
