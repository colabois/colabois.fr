pipeline {
    agent {
        dockerfile {
            args '-u root --net=host -v $HOME/docker_volumes/.cache/:/root/.cache/'
        }
    }
    environment {
        DEPLOY_HOST = 'webroot@colabois.fr'
        WEBSITE = 'https://colabois.fr'
        PROJECT_NAME = 'colabois.fr'
        DEPLOY_SITE_PATH = "www/${env.PROJECT_NAME}"
        TAG_NAME = """${TAG_NAME ?: ""}"""
        WEBHOOK_URL = credentials('webhook_colabois.fr')
    }
    stages {
        stage('Build sources') {
            steps {
                sh 'make build -j4'
            }
            post {
                failure {
                    sh 'ls -al'
                }
            }
        }

        stage('Deploy website') {
            when {
                anyOf {
                    branch 'main'
                    branch 'jenkins_tests'
                }
            }
            steps {
                sshagent(credentials: ['pk_webroot']) {
                    sh 'echo ${TAG_NAME:-${GIT_BRANCH#*/}}'
                    sh 'echo ${DEPLOY_HOST}:${DEPLOY_DOC_PATH}${TAG_NAME:-${GIT_BRANCH#*/}}/'
                    sh 'ssh -o StrictHostKeyChecking=no -o BatchMode=yes ${DEPLOY_HOST} mkdir -p ${DEPLOY_DOC_PATH}${TAG_NAME:-${GIT_BRANCH#*/}}/'
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
    }
    post {
        always {
            sh 'git clean -fxd'
            discordSend description: env.TAG_NAME ? "Le tag ${env.TAG_NAME} a fini d'exécuter :\n - [colabois.fr](${env.WEBSITE + '/'})" : env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'jenkins_tests' ? "La branche ${env.BRANCH_NAME} a fini d'exécuter :\n - [colabois.fr](${env.WEBSITE + '/'})" : '*pour plus de détail, voir lien au dessus.*', footer: currentBuild.durationString.replace(" and counting",""), link: env.RUN_DISPLAY_URL, result: currentBuild.currentResult, title:"[${currentBuild.currentResult}] ${currentBuild.fullDisplayName}", webhookURL: env.WEBHOOK_URL
        }
    }
}
