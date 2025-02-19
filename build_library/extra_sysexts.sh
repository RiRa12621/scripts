EXTRA_SYSEXTS=(
  zfs:sys-fs/zfs
  podman:app-containers/podman,net-misc/passt
  python:dev-lang/python,dev-python/pip
)

_get_unversioned_sysext_packages_unsorted() {
  for sysext in "${EXTRA_SYSEXTS[@]}"; do
    IFS=":" read SYSEXT_NAME PACKAGE_ATOMS USEFLAGS < <(echo "$sysext");

    IFS=, read -ra atoms <<< "$PACKAGE_ATOMS"
    for atom in "${atoms[@]}"
    do
       qatom $atom -F "%{CATEGORY}/%{PN}"
    done
  done
}

get_unversioned_sysext_packages() {
  _get_package_excludes_unsorted | sort | uniq
}
