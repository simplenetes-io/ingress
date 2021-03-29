FETCHER_RUN()
{
    SPACE_SIGNATURE=""
    SPACE_ENV="autoCertClusterPort=\${autoCertClusterPort:-} certDir=\${certDir:-/mnt/autocerts} "
    SPACE_DEP="PRINT FILE_CHECKSUM"

    if [ -z "${autoCertClusterPort}" ]; then
        PRINT "Missing env variable autoCertClusterPort" "error" 0
        return 1
    fi

    if [ ! -d "${certDir}" ]; then
        PRINT "Cert dir does not exist: ${certDir}" "error" 0
        return 1
    fi

    PRINT "Connect to cert-generator service to retrieve bundle of certs" "debug" 0

    local tarFile="/tmp/certs.tar.gz"

    if ! curl -Lso "${tarFile}" "http://proxy:${autoCertClusterPort}/certs.tar.gz"; then
        PRINT "Could not communicate with cert-generator on cluster port ${autoCertClusterPort}" "error" 0
        return 1
    fi

    local hashFile="/tmp/certs.tar.gz.hash"
    local hash="$(FILE_CHECKSUM "${tarFile}")"

    if [ -f "${hashFile}" ]; then
        if printf "%s\\n" "${hash}" | diff - "${hashFile}" 2>/dev/null >&2; then
            PRINT "No change in certs, not unpacking." "debug" 0
            return 0
        fi
    fi

    local tmpDir="/tmp/certs"

    rm -rf "${tmpDir}"
    mkdir -p "${tmpDir}"

    # Note: possibly we want to remove certificates which are not in the bundle anymore?
    # If stray certificates do no harm we can let them linger here, when the box is rebooted the ramdisk
    # will get wiped anyways.
    if tar -xvzf "${tarFile}" -C "${tmpDir}"; then
        printf "%s\\n" "${hash}" >"${hashFile}"
        if ! mv -v "${tmpDir}"/*.pem "${certDir}" 2>/dev/null; then
            PRINT "No .pem files present in archive." "debug" 0
        else
            PRINT "Unpacked certs" "ok" 0
        fi
    else
        PRINT "Could not untar file" "error" 0
        return 1
    fi
}
