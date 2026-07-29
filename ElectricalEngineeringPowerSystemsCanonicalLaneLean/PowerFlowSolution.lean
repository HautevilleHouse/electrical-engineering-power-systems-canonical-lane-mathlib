import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerSystemBus

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerFlowPackage where
  buses : List PowerSystemBus
  admittanceMatrix : List (List Complex)
  slackBusIndex : Nat
  tolerance : Float
  maxIterations : Nat

structure PowerFlowEvidence (P : PowerFlowPackage) where
  admittanceMatrixSquare : P.admittanceMatrix.length = P.buses.length
  slackBusIndexValid : P.slackBusIndex < P.buses.length
  tolerancePositive : P.tolerance > 0
  maxIterationsPositive : P.maxIterations > 0

def PowerFlowClosed (P : PowerFlowPackage) : Prop :=
  P.admittanceMatrix.length = P.buses.length ∧
  P.slackBusIndex < P.buses.length ∧
  P.tolerance > 0 ∧
  P.maxIterations > 0

theorem power_flow_closed_from_evidence (P : PowerFlowPackage) (E : PowerFlowEvidence P) : PowerFlowClosed P := by
  exact And.intro E.admittanceMatrixSquare (And.intro E.slackBusIndexValid (And.intro E.tolerancePositive E.maxIterationsPositive))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse