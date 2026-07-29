import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerFlowBridge
import ElectricalEngineeringPowerSystemsCanonicalLaneLean.StabilityGate

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

def ConstrainedPowerSystemClosure (A : PowerSystemAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_power_system_endgame (A : PowerSystemAdmissibleClass) :
    ConstrainedPowerSystemClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse
