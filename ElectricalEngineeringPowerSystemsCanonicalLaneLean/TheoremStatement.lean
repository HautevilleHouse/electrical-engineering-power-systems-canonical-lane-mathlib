import HautevilleHouse.ElectricalEngineeringPowerSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerSystemsCanonicalLaneLean

structure PowerSystemsTheoremStatement where
  systemKey : String
  theoremName : String
  statement : Prop
  classicalBoundary : String
  carriedRemainder : String

def sourceTheoremStatement : PowerSystemsTheoremStatement :=
  { systemKey := "PowerSystems",
    theoremName := "PowerSystemsCanonicalTheorem",
    statement := ∀ A : AdmissibleClass, bridgeClosed A ∧ gateClosed A,
    classicalBoundary := "carried",
    carriedRemainder := "classical source boundary carried by formalization"
  }

end ElectricalEngineeringPowerSystemsCanonicalLaneLean
end HautevilleHouse
