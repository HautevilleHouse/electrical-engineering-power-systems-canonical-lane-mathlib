import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerFlowSolution

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure TransientStabilityPackage where
  generators : List Generator
  loads : List Load
  criticalClearingTime : Float
  swingCurve : List (Float × Float)

define Generator where
  name : String
  inertia : Float
  damping : Float

define Load where
  busIndex : Nat
  activePower : Float
  reactivePower : Float

structure TransientStabilityEvidence (T : TransientStabilityPackage) where
  allGeneratorsHavePositiveInertia : ∀ g : T.generators, g.inertia > 0
  allLoadsOnValidBuses : ∀ l : T.loads, l.busIndex < length T.generators
  criticalClearingTimePositive : T.criticalClearingTime > 0

def TransientStabilityClosed (T : TransientStabilityPackage) : Prop :=
  (∀ g : T.generators, g.inertia > 0) ∧
  (∀ l : T.loads, l.busIndex < length T.generators) ∧
  T.criticalClearingTime > 0

theorem transient_stability_closed_from_evidence (T : TransientStabilityPackage) (E : TransientStabilityEvidence T) : TransientStabilityClosed T := by
  exact And.intro E.allGeneratorsHavePositiveInertia (And.intro E.allLoadsOnValidBuses E.criticalClearingTimePositive)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse