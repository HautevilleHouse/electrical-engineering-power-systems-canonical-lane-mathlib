import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerSystemsCanonicalLaneLean.PowerSystemTopology

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure FaultAnalysisPackage (T : PowerSystemTopology) where
  faultType : Prop
  symmetricalComponents : Prop
  shortCircuitCurrent : Prop
  faultClearing : Prop

structure FaultAnalysisEvidence {T : PowerSystemTopology} (F : FaultAnalysisPackage T) where
  faultTypeClosed : F.faultType
  symmetricalComponentsClosed : F.symmetricalComponents
  shortCircuitCurrentClosed : F.shortCircuitCurrent
  faultClearingClosed : F.faultClearing

def FaultAnalysisClosed {T : PowerSystemTopology} (F : FaultAnalysisPackage T) : Prop :=
  F.faultType ∧ F.symmetricalComponents ∧ F.shortCircuitCurrent ∧ F.faultClearing

theorem faultAnalysis_closed_from_evidence {T : PowerSystemTopology} (F : FaultAnalysisPackage T) (E : FaultAnalysisEvidence F) : FaultAnalysisClosed F := by
  exact And.intro E.faultTypeClosed (And.intro E.symmetricalComponentsClosed (And.intro E.shortCircuitCurrentClosed E.faultClearingClosed))

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse