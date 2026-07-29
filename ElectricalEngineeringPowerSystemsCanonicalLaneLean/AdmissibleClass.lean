import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerSystemAdmittedObject where
  systemModel : Type
  parametersDefined : Prop
  stabilityMargin : Prop
  conclusion : stabilityMargin

structure AdmissibleClass where
  object : PowerSystemAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse