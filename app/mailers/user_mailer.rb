
class UserMailer < ApplicationMailer

  default from: 'thp@yopmail.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://cryptic-tor-59919.herokuapp.com'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Welcome to our community!')
  end

  def participate_event_email(event)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @event = event

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://cryptic-tor-59919.herokuapp.com'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @event.admin.email, subject: 'Welcome to the event')
  end
end
