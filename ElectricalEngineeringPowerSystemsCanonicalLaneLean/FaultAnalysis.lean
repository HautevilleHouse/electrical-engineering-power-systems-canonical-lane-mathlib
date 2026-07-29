import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure FaultAnalysisPackage (A : AdmissibleClass) where
  faultType : String
  faultLocation : Float
  symmetricalComponents : Prop
  faultCurrentCalculation : Prop

structure FaultAnalysisEvidence {A : AdmissibleClass} (F : FaultAnalysisPackage A) where
  symmetricalComponentsClosed : F.symmetricalComponents
  faultCurrentCalculationClosed : F.faultCurrentCalculation

def FaultAnalysisClosed {A : AdmissibleClass} (F : FaultAnalysisPackage A) : Prop :=
  F.symmetricalComponents ∧ F.faultCurrentCalculation

theorem fault_analysis_closed_from_evidence {A : AdmissibleClass} (F : FaultAnalysisPackage A) (Ev : FaultAnalysisEvidence F) : FaultAnalysisClosed F :=
  And.intro Ev.symmetricalComponentsClosed Ev.faultCurrentCalculationClosed

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse