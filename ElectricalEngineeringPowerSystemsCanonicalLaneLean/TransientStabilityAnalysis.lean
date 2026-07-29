import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure TransientStabilityPackage (A : AdmissibleClass) where
  swingEquations : Prop
  criticalClearingTime : Prop
  energyFunctionExistence : Prop

structure TransientStabilityEvidence {A : AdmissibleClass} (T : TransientStabilityPackage A) where
  swingEquationsClosed : T.swingEquations
  criticalClearingTimeClosed : T.criticalClearingTime
  energyFunctionExistenceClosed : T.energyFunctionExistence

def TransientStabilityClosed {A : AdmissibleClass} (T : TransientStabilityPackage A) : Prop :=
  T.swingEquations ∧ T.criticalClearingTime ∧ T.energyFunctionExistence

theorem transient_stability_closed_from_evidence {A : AdmissibleClass} (T : TransientStabilityPackage A) (E : TransientStabilityEvidence T) : TransientStabilityClosed T :=
  And.intro E.swingEquationsClosed (And.intro E.criticalClearingTimeClosed E.energyFunctionExistenceClosed)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse