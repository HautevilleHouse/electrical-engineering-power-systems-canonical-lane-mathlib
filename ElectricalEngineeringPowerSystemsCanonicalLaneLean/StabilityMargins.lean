import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerFlowBridge

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure StabilityMarginsPackage {G : GridTopologyPackage} {F : PowerFlowPackage G} where
  smallSignalStability : Prop
  transientStability : Prop
  voltageStability : Prop
  frequencyStability : Prop

structure StabilityMarginsEvidence {G : GridTopologyPackage} {F : PowerFlowPackage G} (M : StabilityMarginsPackage F) where
  smallSignalStabilityClosed : M.smallSignalStability
  transientStabilityClosed : M.transientStability
  voltageStabilityClosed : M.voltageStability
  frequencyStabilityClosed : M.frequencyStability

def StabilityMarginsClosed {G : GridTopologyPackage} {F : PowerFlowPackage G} (M : StabilityMarginsPackage F) : Prop :=
  M.smallSignalStability ∧ M.transientStability ∧ M.voltageStability ∧ M.frequencyStability

theorem stability_margins_closed_from_evidence {G : GridTopologyPackage} {F : PowerFlowPackage G} (M : StabilityMarginsPackage F) (E : StabilityMarginsEvidence M) : StabilityMarginsClosed M :=
  And.intro E.smallSignalStabilityClosed (And.intro E.transientStabilityClosed (And.intro E.voltageStabilityClosed E.frequencyStabilityClosed))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse