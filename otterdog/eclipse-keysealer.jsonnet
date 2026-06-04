local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.keysealer', 'eclipse-keysealer') {
  settings+: {
    description: "",
    name: "Eclipse KeySealer project",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}