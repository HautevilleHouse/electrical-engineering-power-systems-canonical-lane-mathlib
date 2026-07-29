import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerSystemTopology

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerFlowPackage (T : PowerSystemTopology) where
  powerBalanceEquations : Prop
  newtonRaphsonIteration : Prop
  convergenceCriterion : Prop
  solutionExistence : Prop

structure PowerFlowEvidence {T : PowerSystemTopology} (P : PowerFlowPackage T) where
  powerBalanceEquationsClosed : P.powerBalanceEquations
  newtonRaphsonIterationClosed : P.newtonRaphsonIteration
  convergenceCriterionClosed : P.convergenceCriterion
  solutionExistenceClosed : P.solutionExistence

def PowerFlowClosed {T : PowerSystemTopology} (P : PowerFlowPackage T) : Prop :=
  P.powerBalanceEquations ∧ P.newtonRaphsonIteration ∧ P.convergenceCriterion ∧ P.solutionExistence

theorem powerFlow_closed_from_evidence {T : PowerSystemTopology} (P : PowerFlowPackage T) (E : PowerFlowEvidence P) : PowerFlowClosed P := by
  exact And.intro E.powerBalanceEquationsClosed (And.intro E.newtonRaphsonIterationClosed (And.intro E.convergenceCriterionClosed E.solutionExistenceClosed))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse