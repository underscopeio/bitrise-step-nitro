# Nitro build system

[![Step changelog](https://shields.io/github/v/release/underscopeio/bitrise-step-nitro?include_prereleases&label=changelog&color=blueviolet)](https://github.com/underscopeio/bitrise-step-nitro/releases)

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

| Key | Description | Flags | Default |
| --- | --- | --- | --- |
| `platform` | The target platform you want to build. | required | `ios` |
| `debug` | Enable verbose logs | required | `no` |
| `project_id` | A string to indetify the project | required | `$BITRISE_APP_URL` |
| `build_id` | A string to indetify the build number | required | `$BITRISE_BUILD_SLUG` |
| `root_directory` | The directory within your project, in which your code is located. Leave this field empty if your code is not located in a subdirectory. |  | `$NITRO_ROOT_DIRECTORY` |
| `entry_file` | The entry file for bundle generation |  | `$ENTRY_FILE` |
| `custom_ssh_key_url` | If provided will add a new key to the ssh agent. |  |  |
| `disable_cache` | When setting this option to `yes` build cache optimizations won't be performed. |  | `no` |
| `app_label` | The application label displayed in the mobile app. Defaults to the name field of the `package.json` file. |  |  |
| `cache_provider` | Choose the provider where cache artifacts will be persisted: - `fs`: File system. - `s3`: Amazon - Simple Storage Service. - `azure`: Microsoft - Azure Blob Storage. |  | `s3` |
| `exclude_modified_files` | If you modify or delete files right after cloning your repository those changes won't impact on your build. |  | `no` |
| `env_var_lookup_keys` | A list of env variable keys to lookup in order to determine whether the build should be cached or not. |  |  |
| `cache_env_var_lookup_keys` | A list of env variable keys to lookup in order to determine whether the build should be cached or not. |  |  |
| `cache_file_lookup_paths` | A list of paths (relative to the root of the repo or absolute) to lookup in order to determine whether the build should be cached or not. |  |  |
| `experimental_metro_cache_enabled` | When enabling this the build will try to take advantage of the React Native Metro cache. |  |  |
| `android_flavor` | Flavor |  |  |
| `android_app_identifier` | App identifier |  |  |
| `android_keystore_url` | Keystore url |  | `$BITRISEIO_ANDROID_KEYSTORE_URL` |
| `android_keystore_password` | Keystore password | sensitive | `$BITRISEIO_ANDROID_KEYSTORE_PASSWORD` |
| `android_keystore_key_alias` | Keystore alias |  | `$BITRISEIO_ANDROID_KEYSTORE_ALIAS` |
| `android_keystore_key_password` | Keystore key password | sensitive | `$BITRISEIO_ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD` |
| `ios_scheme` | The name of the ios scheme |  |  |
| `ios_certificate_url` | The url to download and install the certificate |  |  |
| `ios_certificate_passphrase` | Certificate passphrase | sensitive |  |
| `ios_codesigning_identity` | Codesigning identity |  |  |
| `ios_provisioning_profile_urls` | A string containing a '\|' separated values where provisioning profiles are located e.g. url1\|url2\|url3 |  |  |
| `ios_provisioning_profile_specifier` | The name of the provisioning profile when using a single one |  |  |
| `ios_xcconfig_path` | The path relative to project root directory where the custom `.xcconfig` file is located |  |  |
| `ios_team_id` | Specify the Team ID you want to use for the Apple Developer Portal |  |  |
| `ios_export_method` | The export method used to generate the IPA |  | `ad-hoc` |
| `aws_s3_access_key_id` | Access Key Id |  | `$NITRO_AWS_ACCESS_KEY_ID` |
| `aws_s3_secret_access_key` | Secret Access Key |  | `$NITRO_AWS_SECRET_ACCESS_KEY` |
| `aws_s3_region` | AWS Region |  | `$NITRO_AWS_S3_REGION` |
| `aws_s3_bucket` | Bucket name |  | `$NITRO_AWS_S3_BUCKET` |
| `nitro_bin_file_path` | Nitro binary location (by default it downloads the binary matching with the step version) |  |  |
</details>

<details>
<summary>Outputs</summary>

| Environment Variable | Description |
| --- | --- |
| `NITRO_LOGS_PATH` | The full path to access the build log. |
| `NITRO_DEPLOY_PATH` | The full path to access the build artifacts. |
</details>

## 🙋 Contributing

We welcome [pull requests](https://github.com/underscopeio/bitrise-step-nitro/pulls) and [issues](https://github.com/underscopeio/bitrise-step-nitro/issues) against this repository.

For pull requests, work on your changes in a forked repository and use the Bitrise CLI to [run step tests locally](https://devcenter.bitrise.io/bitrise-cli/run-your-first-build/).

Learn more about developing steps:

- [Create your own step](https://devcenter.bitrise.io/contributors/create-your-own-step/)
- [Testing your Step](https://devcenter.bitrise.io/contributors/testing-and-versioning-your-steps/)
