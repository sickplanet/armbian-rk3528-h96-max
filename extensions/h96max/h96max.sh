# SPDX-License-Identifier: MIT
# H96 Max RK3528 kernel configuration fragment.

function custom_kernel_config__h96max() {
    local fragment="${EXTENSION_DIR}/kernel.config"
    local fragment_hash

    [[ -f "$fragment" ]] || exit_with_error "Missing H96 kernel config: ${fragment}"
    [[ -f .config ]] || return 0

    fragment_hash="$(sha256sum "$fragment" | awk '{print $1}')"
    kernel_config_modifying_hashes+=("${fragment_hash}")

    scripts/kconfig/merge_config.sh -m .config "$fragment"
    run_kernel_make olddefconfig
}
