module React.DocGen (parse, DocResult, PropInfo, PropType, FlowType) where

import Prelude
import Effect (Effect)
import Data.Maybe (Maybe)
import Foreign.Object (Object)
import Data.Undefinable (Undefinable, toMaybe)

foreign import parseImpl :: String -> Effect (DocResult PropInfo_)

parse :: String -> Effect (DocResult PropInfo)
parse s = (\x -> x { props = conv <$> x.props }) <$> parseImpl s
  where
  conv r@{ "type": t, flowType } = r { "type" = toMaybe r."type", flowType = toMaybe r.flowType }

type DocResult a
  = { props :: Object a
    , description :: String
    }

type PropType
  = { name :: String }

type FlowType
  = { name :: String }

type PropInfo
  = { type :: Maybe PropType
    , flowType :: Maybe FlowType
    , required :: Boolean
    , description :: String
    }

type PropInfo_
  = { type :: Undefinable PropType
    , flowType :: Undefinable FlowType
    , required :: Boolean
    , description :: String
    }
