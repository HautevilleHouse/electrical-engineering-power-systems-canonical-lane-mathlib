import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure OptimalPowerFlowPackage (A : AdmissibleClass) where
  objectiveFunction : Prop
  constraints : Prop
  solutionOptimality : Prop

structure OptimalPowerFlowEvidence {A : AdmissibleClass} (O : OptimalPowerFlowPackage A) where
  objectiveFunctionClosed : O.objectiveFunction
  constraintsClosed : O.constraints
  solutionOptimalityClosed : O.solutionOptimality

def OptimalPowerFlowClosed {A : AdmissibleClass} (O : OptimalPowerFlowPackage A) : Prop :=
  O.objectiveFunction ∧ O.constraints ∧ O.solutionOptimality

theorem optimal_power_flow_closed_from_evidence {A : AdmissibleClass} (O : OptimalPowerFlowPackage A) (Ev : OptimalPowerFlowEvidence O) : OptimalPowerFlowClosed O :=
  And.intro Ev.objectiveFunctionClosed (And.intro Ev.constraintsClosed Ev.solutionOptimalityClosed)

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse