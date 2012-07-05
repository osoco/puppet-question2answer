class question2answer ($question2answer_parent_path = '/var/www', 
                       $question2answer_url = 'https://github.com/q2a/question2answer') {

    include apache2
    include apache2_php

    $question2answer_home = "$question2answer_parent_path/question2answer"
    $git_clone_name = 'git-clone-question2answer'
    $exec_grant_name = "grant-apache-user-access-$question2answer_home"
    
    if !defined(File["$question2answer_parent_path"]) {
        file { "$question2answer_parent_path":
            ensure => 'directory',
            owner => "$apache2::apache2_user",
            group => "$apache2::apache2_user",
        }
    }

    git::clone { "$git_clone_name":
       username => 'anybody',
       password => 'anything',
       url => "$question2answer_url",
       path => "$question2answer_home",
       notify => Exec["$exec_grant_name"]
    }

    exec { "$exec_grant_name":
       command => "chown -R ${apache2::apache2_user}:${apache2::apache2_user} $question2answer_home",
       refreshonly => true
    }

    if !defined(Apache2::Module["rewrite"]) {
        apache2::module { "rewrite":
            modname => "rewrite"
        }
    }
}
