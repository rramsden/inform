module Handler.Docs where

import Import

getDocsR :: Handler Html
getDocsR = do
        defaultLayout $ do
            setTitle "Inform - Docs"
            $(widgetFile "docs")
