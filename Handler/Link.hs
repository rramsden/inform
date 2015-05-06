module Handler.Link where

import Import

-- data InputForm = InputForm
--           { email :: Text
--           }

newLinkForm :: AForm Handler Link
newLinkForm = Link
  <$> areq emailField "email" Nothing

getLinkR :: Handler Html
getLinkR = do
        (widget, enctype) <- generateFormPost $ renderDivs newLinkForm
        defaultLayout $ do
            $(widgetFile "links/new")

postLinkR :: Handler Html
postLinkR = do
        ((res, widget), enctype) <- runFormPost $ renderDivs newLinkForm
        case res of
            FormSuccess link -> do
                linkId <- runDB $ insert link
                redirect $ LinkDetailsR linkId
            _ -> defaultLayout $(widgetFile "links/new")

getLinkDetailsR :: LinkId -> Handler Html
getLinkDetailsR linkId = do
        link <- runDB $ get404 linkId
        defaultLayout $ do
            $(widgetFile "links/show")
