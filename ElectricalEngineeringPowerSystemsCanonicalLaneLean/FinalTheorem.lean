import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

def ConstrainedPowerSystemClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_power_system_endgame (A : AdmissibleClass) :
    ConstrainedPowerSystemClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse