{-
   Copyright 2020 Morgan Stanley
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
       http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-}


module Morphir.IR.SDK.Instant exposing (..)

import Dict
import Morphir.IR.Documented exposing (Documented)
import Morphir.IR.Module as Module exposing (ModuleName)
import Morphir.IR.Name as Name
import Morphir.IR.Path as Path exposing (Path)
import Morphir.IR.SDK.Common exposing (toFQName)
import Morphir.IR.Type exposing (Specification(..), Type(..))


moduleName : ModuleName
moduleName =
    Path.fromString "Instant"


moduleSpec : Module.Specification ()
moduleSpec =
    { types =
        Dict.fromList
            [ ( Name.fromString "Instant"
              , OpaqueTypeSpecification []
                    |> Documented "Type that represents a specific instantaneous point on the timeline."
              )
            ]
    , values =
        Dict.fromList
            []
    , doc = Just "Contains the Instant type (representing a specific instantaneous point in time), and it's associated functions."
    }


instantType : a -> Type a
instantType attributes =
    Reference attributes (toFQName moduleName "Instant") []
