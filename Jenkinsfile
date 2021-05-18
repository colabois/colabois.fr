pipeline {
    agent {
        dockerfile {
            args '-u root --net=host -v $HOME/docker_volumes/gem:/usr/gem  -v $HOME/docker_volumes/bundle/:/usr/local/bundle -v $HOME/docker_volumes/.cache/:/root/.cache/'
        }
    }
    environment {
        JEKYLL_UID = '1001'
        JEKYLL_GID = '1001'
        JEKYLL_ENV = 'production'
        DEPLOY_HOST = 'webroot@colabois.fr'
        PROJECT_NAME = 'colabois.fr'
        DOMAIN = 'colabois.fr'
        DEV_DOMAIN = "www-dev.${env.DOMAIN}"
        WEBSITE = "https://${env.DOMAIN}"
        DEV_WEBSITE = "https://${env.DEV_DOMAIN}"
        DEPLOY_SITE_PATH = "www/${env.PROJECT_NAME}"
        DEPLOY_DEV_PATH = "www/www-dev.${env.PROJECT_NAME}"
        TAG_NAME = """${TAG_NAME ?: ""}"""
        WEBHOOK_URL = credentials('webhook_colabois.fr')
    }
    stages {
        stage('Build sources') {
            steps {
                sh 'mkdir _site'
                sh 'chmod -R o+rwx .'
                sh 'bundle install --jobs $(nproc)'
                sh 'bundle exec jekyll build'
            }
            post {
                failure {
                    sh 'ls -al'
                }
            }
        }

        stage('Deploy website to production') {
            when {
                anyOf {
                    branch 'main'
                }
            }
            steps {
                sshagent(credentials: ['pk_webroot']) {
                    sh 'echo ${TAG_NAME:-${GIT_BRANCH#*/}}'
                    sh 'echo ${DEPLOY_HOST}:${DEPLOY_DOC_PATH}${TAG_NAME:-${GIT_BRANCH#*/}}/'
                    sh 'ssh -o StrictHostKeyChecking=no -o BatchMode=yes ${DEPLOY_HOST} mkdir -p ${DEPLOY_SITE_PATH}/'
                    sh '''rsync -aze 'ssh -o StrictHostKeyChecking=no -o BatchMode=yes' \
                    --log-file=rsync-doc.log \
                    --delete \
                    _site/ ${DEPLOY_HOST}:${DEPLOY_SITE_PATH}/'''
                }
            }
            post {
                failure {
                    sh 'cat rsync-doc.log'
                }
            }
        }

        stage('Deploy website to www-dev') {
            when {
                anyOf {
                    branch 'dev'
                }
            }
            steps {
                sshagent(credentials: ['pk_webroot']) {
                    sh 'echo ${TAG_NAME:-${GIT_BRANCH#*/}}'
                    sh 'echo ${DEPLOY_HOST}:${DEPLOY_DOC_PATH}${TAG_NAME:-${GIT_BRANCH#*/}}/'
                    sh 'ssh -o StrictHostKeyChecking=no -o BatchMode=yes ${DEPLOY_HOST} mkdir -p ${DEPLOY_DEV_PATH}/'
                    sh '''rsync -aze 'ssh -o StrictHostKeyChecking=no -o BatchMode=yes' \
                    --log-file=rsync-doc.log \
                    --delete \
                    _site/ ${DEPLOY_HOST}:${DEPLOY_DEV_PATH}/'''
                }
            }
            post {
                failure {
                    sh 'cat rsync-doc.log'
                }
            }
        }
    }
    post {
        always {
            sh 'rm -vrf *'
            discordSend description: env.TAG_NAME ? "Le tag ${env.TAG_NAME} a fini d'exécuter :\n - [${env.DOMAIN}](${env.WEBSITE + '/'})" : env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'jenkins_tests' ? "La branche ${env.BRANCH_NAME} a fini d'exécuter :\n - [${env.DOMAIN}](${env.WEBSITE + '/'})" : env.BRANCH_NAME == 'dev' ? "La branche ${env.BRANCH_NAME} a fini d'exécuter :\n - [${env.DEV_DOMAIN}](${env.DEV_WEBSITE + '/'})" : '*pour plus de détail, voir lien au dessus.*', footer: currentBuild.durationString.replace(" and counting",""), link: env.RUN_DISPLAY_URL, result: currentBuild.currentResult, title:"[${currentBuild.currentResult}] ${currentBuild.fullDisplayName}", webhookURL: env.WEBHOOK_URL
        }
    }
}
