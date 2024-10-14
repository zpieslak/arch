import pluginJs from '@eslint/js'
import prettierConfig from 'eslint-config-prettier'
import eslintPluginPrettierRecommended from 'eslint-plugin-prettier/recommended'

export default [
  pluginJs.configs.recommended,
  prettierConfig,
  eslintPluginPrettierRecommended,
]
