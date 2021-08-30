trigger EnviarMail on Opportunity (after insert) {
    HandlerEnviarMail.SendEmail(trigger.new);   
}