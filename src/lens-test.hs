import qualified Data.Text as T

data Address = Address
  { addressCity :: !T.Text
  , addressStreet :: !T.Text
  } deriving Show
data Person = Person
  { personAddress :: !Address
  , personName :: !T.Text
  } deriving Show

getPersonCity :: Person -> T.Text
getPersonCity = addressCity . personAddress

setPersonCity :: T.Text -> Person -> Person
setPersonCity city person = person
  { personAddress = (personAddress person)
      { addressCity = city
      }
  }

newtype Const a b = Const { getConst :: a } deriving Functor

type LensGetter s a = s -> Const a s

view :: LensGetter s a -> s -> a
view lens s = getConst (lens s)

personAddressL :: LensGetter Person Address
personAddressL person = Const (personAddress person)
