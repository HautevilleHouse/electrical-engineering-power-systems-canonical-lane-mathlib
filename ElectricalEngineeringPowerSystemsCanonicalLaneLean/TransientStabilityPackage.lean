import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerSystemTopology

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure TransientStabilityPackage (T : PowerSystemTopology) where
  swingEquation : Prop
  criticalClearingTime : Prop
  equalAreaCriterion : Prop
  stabilityMargin : Prop

structure TransientStabilityEvidence {T : PowerSystemTopology} (S : TransientStabilityPackage T) where
  swingEquationClosed : S.swingEquation
  criticalClearingTimeClosed : S.criticalClearingTime
  equalAreaCriterionClosed : S.equalAreaCriterion
  stabilityMarginClosed : S.stabilityMargin

def TransientStabilityClosed {T : PowerSystemTopology} (S : TransientStabilityPackage T) : Prop :=
  S.swingEquation ∧ S.criticalClearingTime ∧ S.equalAreaCriterion ∧ S.stabilityMargin

theorem transientStability_closed_from_evidence {T : PowerSystemTopology} (S : TransientStabilityPackage T) (E : TransientStabilityEvidence S) : TransientStabilityClosed S := by
  exact And.intro E.swingEquationClosed (And.intro E.criticalClearingTimeClosed (And.intro E.equalAreaCriterionClosed E.stabilityMarginClosed))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse