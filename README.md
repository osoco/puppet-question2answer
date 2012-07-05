puppet-question2answer
======================

Puppet module to install question2answer Q&amp;A software. Depends on:

  * OSOCO apache2 puppet module: https://github.com/osoco/puppet-apache2
  * OSOCO apache2 PHP puppet module: https://github.com/osoco/puppet-apache2_php

Example of usage:

   class questions_question2answer($virtualhost_name = 'question2answer.myorg.com') {
      question2answer::config { "configure-question2answer-$virtualhost_name":
         virtualhost_name => "$virtualhost_name",
         server_admin_mail => "admin@myorg.com",
         db_name => 'question2answer',
         db_user => 'question2answer',
         db_passwd => 'question2answer'
      }
   }
