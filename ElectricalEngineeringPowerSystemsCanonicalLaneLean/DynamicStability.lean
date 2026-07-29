import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerFlowEquations

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure DynamicStabilityPackage {P : PowerFlowEquationsPackage} where
  swingEquation : Prop
  lyapunovFunction : Prop
  transientStabilityMargin : Prop
  criticalClearingTime : Prop

structure DynamicStabilityEvidence {P : PowerFlowEquationsPackage}
    (D : DynamicStabilityPackage P) where
  swingEquationClosed : D.swingEquation
  lyapunovFunctionClosed : D.lyapunovFunction
  transientStabilityMarginClosed : D.transientStabilityMargin
  criticalClearingTimeClosed : D.criticalClearingTime

def DynamicStabilityClosed {P : PowerFlowEquationsPackage}
    (D : DynamicStabilityPackage P) : Prop :=
  D.swingEquation ∧ D.lyapunovFunction ∧ D.transientStabilityMargin ∧ D.criticalClearingTime

theorem dynamic_stability_closed_from_evidence {P : PowerFlowEquationsPackage}
    (D : DynamicStabilityPackage P) (E : DynamicStabilityEvidence D) :
    DynamicStabilityClosed D := by
  exact And.intro E.swingEquationClosed
    (And.intro E.lyapunovFunctionClosed
      (And.intro E.transientStabilityMarginClosed E.criticalClearingTimeClosed))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse
