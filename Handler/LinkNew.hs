module Handler.LinkNew where

import Import

-- data InputForm = InputForm
--           { email :: Text
--           }

newLinkForm :: AForm Handler Link
newLinkForm = Link
  <$> areq emailField "email" Nothing

getLinkNewR :: Handler Html
getLinkNewR = do
        (widget, enctype) <- generateFormPost $ renderDivs newLinkForm
        defaultLayout $ do
            $(widgetFile "forms/new")

postLinkNewR :: Handler Html
postLinkNewR = do
        ((res, widget), enctype) <- runFormPost $ renderDivs newLinkForm
        case res of
            FormSuccess link -> do
                _ <- runDB $ insert link
                error "todo"
            _ -> defaultLayout $(widgetFile "forms/new")
