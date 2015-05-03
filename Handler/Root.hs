module Handler.Root where

import Import

getRootR :: Handler Html
getRootR = do
        defaultLayout $ do
            setTitle "Inform"
            $(widgetFile "root")
