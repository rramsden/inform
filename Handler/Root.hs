module Handler.Root where

import Import

getRootR :: Handler Html
getRootR = do
        defaultLayout $ do
            setTitle "Inform - Easy Contact Forms"
            $(widgetFile "root")
