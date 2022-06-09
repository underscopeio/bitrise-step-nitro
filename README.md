# Nitro build system

[![Step changelog](https://shields.io/github/v/release/underscopeio/bitrise-step-nitro?include_prereleases&label=changelog&color=blueviolet)](https://github.com/underscopeio/bitrise-step-nitro/releases)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://github.com/underscopeio/bitrise-step-nitro/)

Build React Native projects using Nitro build system

<details>
<summary>Description</summary>

This step allows you to easily run the Nitro builder by providing input parameters in a friendly way.

</details>

## 🧩 Get started

Add this step directly to your workflow in the [Bitrise Workflow Editor](https://devcenter.bitrise.io/steps-and-workflows/steps-and-workflows-index/).

You can also run this step directly with [Bitrise CLI](https://github.com/bitrise-io/bitrise).

## ⚙️ Configuration

<details>
<summary>Inputs</summary>

| Key                                  | Description                                                                                                                                                                                 | Flags     | Default                                            |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | -------------------------------------------------- |
| `platform`                           | The target platform you want to build.                                                                                                                                                      | required  | `ios`                                              |
| `debug`                              | Enable verbose logs                                                                                                                                                                         | required  | `no`                                               |
| `project_id`                         | A string to indetify the project                                                                                                                                                            |           | `$BITRISE_APP_URL`                                 |
| `build_id`                           | A string to indetify the build number                                                                                                                                                       |           | `$BITRISE_BUILD_SLUG`                              |
| `root_directory`                     | The directory within your project, in which your code is located. Leave this field empty if your code is not located in a subdirectory.                                                     |           | `$NITRO_ROOT_DIRECTORY`                            |
| `custom_ssh_key_url`                 | If provided will add a new key to the ssh agent.                                                                                                                                            |           |                                                    |
| `disable_cache`                      | When setting this option to `yes` build cache optimizations won't be performed.                                                                                                             |           | `no`                                               |
| `app_label`                          | The application label displayed in the mobile app. Defaults to the name field of the `package.json` file.                                                                                   |           |                                                    |
| `cache_provider`                     | Choose the provider where cache artifacts will be persisted: - `fs`: File system. - `s3`: Amazon - Simple Storage Service. - `azure`: Microsoft - Azure Blob Storage.                       |           | `s3`                                               |
| `log_provider`                       | Choose the provider where logs will be persisted: - `s3`: Amazon - Simple Storage Service. - `azure`: Microsoft - Azure Blob Storage.                                                       |           |                                                    |
| `tracking_provider`                  | Where the build output will be displayed: `console`: Console standard output. `nitro`: Undercope CI services.                                                                               |           | `nitro-on-premise`                                 |
| `app_envfile_path`                   | Where an envfile for certain environment is located.                                                                                                                                        |           |                                                    |
| `exclude-modified-files`             | If you modify or delete files right after cloning your repository those changes won't impact on your build.                                                                                 |           | `no`                                               |
| `env-var-lookup-keys`                | A list of env variable keys to lookup in order to determine whether the build should be cached or not.                                                                                      |           |                                                    |
| `android_flavor`                     | Flavor                                                                                                                                                                                      |           |                                                    |
| `android_app_identifier`             | App identifier                                                                                                                                                                              |           |                                                    |
| `android_keystore_url`               | Keystore url                                                                                                                                                                                |           | `$BITRISEIO_ANDROID_KEYSTORE_URL`                  |
| `android_keystore_password`          | Keystore password                                                                                                                                                                           | sensitive | `$BITRISEIO_ANDROID_KEYSTORE_PASSWORD`             |
| `android_keystore_key_alias`         | Keystore alias                                                                                                                                                                              |           | `$BITRISEIO_ANDROID_KEYSTORE_ALIAS`                |
| `android_keystore_key_password`      | Keystore key password                                                                                                                                                                       | sensitive | `$BITRISEIO_ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD` |
| `ios_certificate_url`                | Certificate url                                                                                                                                                                             |           | `$BITRISE_CERTIFICATE_URL`                         |
| `ios_certificate_passphrase`         | Certificate passphrase                                                                                                                                                                      | sensitive | `$BITRISE_CERTIFICATE_PASSPHRASE`                  |
| `ios_provisioning_profile_urls`      | A string containing a '\|' separated values where provisioning profiles are located e.g. url1\|url2\|url3                                                                                   |           |                                                    |
| `ios_provisioning_profile_url_map`   | A JSON value to define the define the provisioning profile url mapping: `{"identifier": "https://ios-provisioning-profile-url-1", "identifier2": "https://ios-provisioning-profile-url-2"}` |           |                                                    |
| `ios_provisioning_profile_specifier` | Not required if `Provisioning profile url map` is provided.                                                                                                                                 |           |                                                    |
| `ios_xcconfig_path`                  | The path relative to project root directory where the custom `.xcconfig` file is located                                                                                                    |           |                                                    |
| `ios_team_id`                        | Specify the Team ID you want to use for the Apple Developer Portal                                                                                                                          |           |                                                    |
| `aws_s3_access_key_id`               | Access Key Id                                                                                                                                                                               |           | `$NITRO_AWS_ACCESS_KEY_ID`                         |
| `aws_s3_secret_access_key`           | Secret Access Key                                                                                                                                                                           |           | `$NITRO_AWS_SECRET_ACCESS_KEY`                     |
| `aws_s3_region`                      | AWS Region                                                                                                                                                                                  |           | `$NITRO_AWS_S3_REGION`                             |
| `aws_s3_bucket`                      | Bucket name                                                                                                                                                                                 |           | `$NITRO_AWS_S3_BUCKET`                             |

</details>

<details>
<summary>Outputs</summary>

| Environment Variable | Description                                  |
| -------------------- | -------------------------------------------- |
| `NITRO_LOGS_PATH`    | The full path to access the build log.       |
| `NITRO_DEPLOY_PATH`  | The full path to access the build artifacts. |

</details>

## 🙋 Contributing

We welcome [pull requests](https://github.com/underscopeio/bitrise-step-nitro/pulls) and [issues](https://github.com/underscopeio/bitrise-step-nitro/issues) against this repository.

For pull requests, work on your changes in a forked repository and use the Bitrise CLI to [run step tests locally](https://devcenter.bitrise.io/bitrise-cli/run-your-first-build/).

Learn more about developing steps:

- [Create your own step](https://devcenter.bitrise.io/contributors/create-your-own-step/)
- [Testing your Step](https://devcenter.bitrise.io/contributors/testing-and-versioning-your-steps/)
