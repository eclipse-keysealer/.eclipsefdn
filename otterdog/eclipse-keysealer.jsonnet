local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.keysealer', 'eclipse-keysealer') {
  settings+: {
    description: "",
    name: "Eclipse KeySealer project",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('k8s-kms-plugin') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "gRPC service that leverages a remote or local HSM/TPM to encrypt Kubernetes data at-rest with KMS v2.",
      homepage: "https://github.com/eclipse-keysealer/k8s-kms-plugin",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "aes-encryption",
        "cryptography",
        "golang",
        "hsm",
        "kms",
        "kubernetes",
        "ml-kem",
        "pkcs11",
        "pqc",
        "pqcrypto",
        "rsa-cryptography",
        "tpm"
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_commit_signatures: true,
          requires_strict_status_checks: true,
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/eclipsefdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}