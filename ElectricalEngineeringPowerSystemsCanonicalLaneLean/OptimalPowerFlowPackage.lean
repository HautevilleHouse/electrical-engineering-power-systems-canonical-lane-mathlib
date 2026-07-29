import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerFlowPackage

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure OptimalPowerFlowPackage {T : PowerSystemTopology} {P : PowerFlowPackage T} where
  objectiveFunction : Prop
  generatorConstraints : Prop
  voltageLimits : Prop
  lineFlowLimits : Prop
  optimalSolution : Prop

structure OptimalPowerFlowEvidence {T : PowerSystemTopology} {P : PowerFlowPackage T} (O : OptimalPowerFlowPackage P) where
  objectiveFunctionClosed : O.objectiveFunction
  generatorConstraintsClosed : O.generatorConstraints
  voltageLimitsClosed : O.voltageLimits
  lineFlowLimitsClosed : O.lineFlowLimits
  optimalSolutionClosed : O.optimalSolution

def OptimalPowerFlowClosed {T : PowerSystemTopology} {P : PowerFlowPackage T} (O : OptimalPowerFlowPackage P) : Prop :=
  O.objectiveFunction ∧ O.generatorConstraints ∧ O.voltageLimits ∧ O.lineFlowLimits ∧ O.optimalSolution

theorem optimalPowerFlow_closed_from_evidence {T : PowerSystemTopology} {P : PowerFlowPackage T} (O : OptimalPowerFlowPackage P) (E : OptimalPowerFlowEvidence O) : OptimalPowerFlowClosed O := by
  exact And.intro E.objectiveFunctionClosed (And.intro E.generatorConstraintsClosed (And.intro E.voltageLimitsClosed (And.intro E.lineFlowLimitsClosed E.optimalSolutionClosed)))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse