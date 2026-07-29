import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure EconomicDispatchPackage where
  generatorCosts : Type
  loadDemand : Prop
  optimalDispatchSolved : Prop
  equalityConstraint : Prop

structure EconomicDispatchEvidence (E : EconomicDispatchPackage) where
  loadDemandClosed : E.loadDemand
  optimalDispatchSolvedClosed : E.optimalDispatchSolved
  equalityConstraintClosed : E.equalityConstraint

def EconomicDispatchClosed (E : EconomicDispatchPackage) : Prop :=
  E.loadDemand ∧ E.optimalDispatchSolved ∧ E.equalityConstraint

theorem economic_dispatch_closed_from_evidence (E : EconomicDispatchPackage) (Ev : EconomicDispatchEvidence E) :
    EconomicDispatchClosed E := by
  exact And.intro Ev.loadDemandClosed
    (And.intro Ev.optimalDispatchSolvedClosed Ev.equalityConstraintClosed)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse