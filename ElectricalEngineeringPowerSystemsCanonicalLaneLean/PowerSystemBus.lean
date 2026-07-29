import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerSystemBus where
  busNumber : Nat
  busType : String -- "PQ", "PV", "Slack"
  baseKV : Float
  voltageMagnitude : Float
  voltageAngle : Float
  activePower : Float
  reactivePower : Float

structure BusEvidence (B : PowerSystemBus) where
  busNumberValid : B.busNumber > 0
  busTypeRecognized : B.busType ∈ ["PQ", "PV", "Slack"]
  baseKVPositive : B.baseKV > 0

def BusClosed (B : PowerSystemBus) : Prop :=
  B.busNumber > 0 ∧ B.busType ∈ ["PQ", "PV", "Slack"] ∧ B.baseKV > 0

theorem bus_closed_from_evidence (B : PowerSystemBus) (E : BusEvidence B) : BusClosed B := by
  exact And.intro E.busNumberValid (And.intro E.busTypeRecognized E.baseKVPositive)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse