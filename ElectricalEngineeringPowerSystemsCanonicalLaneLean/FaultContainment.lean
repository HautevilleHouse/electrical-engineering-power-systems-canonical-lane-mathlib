import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringPowerSystemsCanonicalLaneLean.StabilityMargins

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure FaultContainmentPackage {G : GridTopologyPackage} {F : PowerFlowPackage G} {M : StabilityMarginsPackage F} where
  faultLocation : G.node
  faultType : Prop
  protectionScheme : Prop
  isolationTime : Prop
  postFaultState : Prop

structure FaultContainmentEvidence {G : GridTopologyPackage} {F : PowerFlowPackage G} {M : StabilityMarginsPackage F} (C : FaultContainmentPackage M) where
  faultTypeClosed : C.faultType
  protectionSchemeClosed : C.protectionScheme
  isolationTimeClosed : C.isolationTime
  postFaultStateClosed : C.postFaultState

def FaultContainmentClosed {G : GridTopologyPackage} {F : PowerFlowPackage G} {M : StabilityMarginsPackage F} (C : FaultContainmentPackage M) : Prop :=
  C.faultType ∧ C.protectionScheme ∧ C.isolationTime ∧ C.postFaultState

theorem fault_containment_closed_from_evidence {G : GridTopologyPackage} {F : PowerFlowPackage G} {M : StabilityMarginsPackage F} (C : FaultContainmentPackage M) (E : FaultContainmentEvidence C) : FaultContainmentClosed C :=
  And.intro E.faultTypeClosed (And.intro E.protectionSchemeClosed (And.intro E.isolationTimeClosed E.postFaultStateClosed))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse