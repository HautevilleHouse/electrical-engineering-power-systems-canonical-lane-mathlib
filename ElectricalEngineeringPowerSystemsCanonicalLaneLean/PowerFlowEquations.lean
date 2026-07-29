import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerFlowPackage (A : AdmissibleClass) where
  busVoltages : List Complex
  powerInjections : List Complex
  admittanceMatrix : Matrix Complex
  mismatchEquations : Prop
  newtonRaphsonConvergence : Prop

structure PowerFlowEvidence {A : AdmissibleClass} (P : PowerFlowPackage A) where
  mismatchEquationsClosed : P.mismatchEquations
  newtonRaphsonConvergenceClosed : P.newtonRaphsonConvergence

def PowerFlowClosed {A : AdmissibleClass} (P : PowerFlowPackage A) : Prop :=
  P.mismatchEquations ∧ P.newtonRaphsonConvergence

theorem power_flow_closed_from_evidence {A : AdmissibleClass} (P : PowerFlowPackage A) (E : PowerFlowEvidence P) : PowerFlowClosed P :=
  And.intro E.mismatchEquationsClosed E.newtonRaphsonConvergenceClosed

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse