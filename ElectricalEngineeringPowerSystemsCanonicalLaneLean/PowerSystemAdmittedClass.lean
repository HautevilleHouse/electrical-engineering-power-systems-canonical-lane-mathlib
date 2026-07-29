import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerSystemState where
  voltageMagnitude : Float
  voltageAngle : Float
  activePower : Float
  reactivePower : Float

structure PowerSystemAdmittedObject where
  systemState : PowerSystemState
  powerFlowConverged : Prop
  stabilityMargin : Prop
  conclusion : powerFlowConverged ∧ stabilityMargin

structure PowerSystemAdmissibleClass where
  object : PowerSystemAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def powerSystemAdmittedClosure (A : PowerSystemAdmissibleClass) : Prop :=
  (A.object.powerFlowConverged ∧ A.object.stabilityMargin) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse
