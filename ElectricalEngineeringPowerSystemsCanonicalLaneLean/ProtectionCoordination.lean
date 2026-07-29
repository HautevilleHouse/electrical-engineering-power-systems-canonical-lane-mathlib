import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure ProtectionPackage where
  relaySettings : Type
  coordinationVerified : Prop
  selectivityAchieved : Prop
  faultClearingTime : Prop

structure ProtectionEvidence (P : ProtectionPackage) where
  coordinationVerifiedClosed : P.coordinationVerified
  selectivityAchievedClosed : P.selectivityAchieved
  faultClearingTimeClosed : P.faultClearingTime

def ProtectionClosed (P : ProtectionPackage) : Prop :=
  P.coordinationVerified ∧ P.selectivityAchieved ∧ P.faultClearingTime

theorem protection_closed_from_evidence (P : ProtectionPackage) (E : ProtectionEvidence P) :
    ProtectionClosed P := by
  exact And.intro E.coordinationVerifiedClosed
    (And.intro E.selectivityAchievedClosed E.faultClearingTimeClosed)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse