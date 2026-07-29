import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure StabilityPackage where
  systemDynamics : Type
  equilibriumPoint : Prop
  lyapunovFunctionExists : Prop
  transientStability : Prop

structure StabilityEvidence (S : StabilityPackage) where
  equilibriumPointClosed : S.equilibriumPoint
  lyapunovFunctionExistsClosed : S.lyapunovFunctionExists
  transientStabilityClosed : S.transientStability

def StabilityClosed (S : StabilityPackage) : Prop :=
  S.equilibriumPoint ∧ S.lyapunovFunctionExists ∧ S.transientStability

theorem stability_closed_from_evidence (S : StabilityPackage) (E : StabilityEvidence S) :
    StabilityClosed S := by
  exact And.intro E.equilibriumPointClosed
    (And.intro E.lyapunovFunctionExistsClosed E.transientStabilityClosed)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse