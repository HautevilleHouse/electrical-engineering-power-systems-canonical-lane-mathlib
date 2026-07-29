import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerSystemBus where
  busNumber : Nat
  voltageMagnitude : Prop
  voltageAngle : Prop
  busType : Prop

structure PowerSystemLine where
  fromBus : Nat
  toBus : Nat
  resistance : Prop
  reactance : Prop
  susceptance : Prop
  rating : Prop

structure PowerSystemTopology where
  buses : List PowerSystemBus
  lines : List PowerSystemLine
  connectivity : Prop
  nominalFrequency : Prop

structure PowerSystemTopologyEvidence (T : PowerSystemTopology) where
  connectivityClosed : T.connectivity
  nominalFrequencyClosed : T.nominalFrequency

def PowerSystemTopologyClosed (T : PowerSystemTopology) : Prop :=
  T.connectivity ∧ T.nominalFrequency

theorem powerSystemTopology_closed_from_evidence (T : PowerSystemTopology) (E : PowerSystemTopologyEvidence T) : PowerSystemTopologyClosed T := by
  exact And.intro E.connectivityClosed E.nominalFrequencyClosed

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse