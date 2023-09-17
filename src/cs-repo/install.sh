#!/bin/sh
set -e

echo "Activating feature 'cs-repo'"
echo "The provided URIs are: ${URIS}"
echo "The provided suites are: ${SUITES}"


# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

[ -d /etc/ssl/certs ] || mkdir -p /etc/ssl/certs 
cat >/etc/ssl/certs/ca-certificates.crt.add <<EOF
-----BEGIN CERTIFICATE-----
MIIDjDCCAnSgAwIBAgIBATANBgkqhkiG9w0BAQUFADAxMRQwEgYDVQQDEwtMVk0g
Um9vdCBDQTELMAkGA1UEBhMCREUxDDAKBgNVBAoTA0xWTTAeFw0wNzA4MjIwOTA4
MThaFw0zMDA4MjQxMjAwMDBaMDExFDASBgNVBAMTC0xWTSBSb290IENBMQswCQYD
VQQGEwJERTEMMAoGA1UEChMDTFZNMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAt5lN4NsEyccJfDC9ATJLCGf5p/FX6vlk5M20wML/BKn9PieQa/+2LJFu
mMJCcoF6IMfB6D4gi5DVOGlZRb0vvs+/zEgWwUgvsVKhEx2Q0gPLc1SpsJfTnmiR
VqKdrrbr6sH3940ZZHwZsjBGTBYG2JU6VDtnGPeWYjUtNHgnLn+58I5EJXSN+enf
pmMV1ZYEScctkQQOU8m2a51CWDZeuU0y7I4HXp6hKrH1gNBZjVNVx9gUafh+BlZa
lhI13Qa6QbaALDXjDu5KJHrLYsmfe8sQrmOXRtAJYiTMe/JjbjemGA9OYDL1GFL3
U1SvK38mY+7NYdnDMGn2jcOf8jpBNQIDAQABo4GuMIGrMA8GA1UdEwEB/wQFMAMB
Af8wHQYDVR0OBBYEFODqWL5vn4xmTQqNQMB57R04UsoCMFkGA1UdIwRSMFCAFODq
WL5vn4xmTQqNQMB57R04UsoCoTWkMzAxMRQwEgYDVQQDEwtMVk0gUm9vdCBDQTEL
MAkGA1UEBhMCREUxDDAKBgNVBAoTA0xWTYIBATALBgNVHQ8EBAMCAQYwEQYJYIZI
AYb4QgEBBAQDAgAHMA0GCSqGSIb3DQEBBQUAA4IBAQCX8dpkvmnVGecZENTBrITA
BF9h1yvckK3QtILhryFbE0hCUrhOqoVzz5aaTtm3zQTl99gsO9czRtmtiKa+GDjh
pWItXRfH15PqDg4fGUvxn/VrjvETyUPDQt+Zuyw+1dR0uo6gZ6fJyPoH3AK5Juku
cQP3Bg/Y9JJknXZMukKGyrXhCAiQ8Tb2qKo8DZiuTHt+mprND6AOIoz6TVAHgRTw
H+kxs0BLyC8vxVdjjK9EDjEogM+VIfB+a3B2cf8ydeosZMOG6MCKzyk4kIaMy+QS
A8zie+nAD425J3gjmdEkzhNVpmQ/0eiaBPaWWBapM5r1jly2ZxUJpuXu14wXk346
-----END CERTIFICATE-----
EOF

cat >/etc/apt/sources.list.d/cs-repo.sources <<EOF
Types: deb
URIs: ${URIS}
Suites: ${SUITES}
Components: main
Architectures: amd64
Enabled: true
Arch: amd64
Allow-Downgrade-To-Insecure: no
PDiffs: yes
Languages: en de
Check-Valid-Until: yes
By-Hash: yes
Signed-By:
 -----BEGIN PGP PUBLIC KEY BLOCK-----
 .
 mQGiBEqnlLgRBACRPnIXAA+UQJEIyYX78aYr4NbK9QQtEvD9D6ryIS/TetSaTT/D
 me7uPiEPs4m8ilVARbpN7PLORGc2a2RfIQQTQW9QuUWGdjZb5mI03BmvIypMVRln
 1Ke06WyUKadzileF3IsbduKqQn/uZo38UeiRtgjKO0LsBjyqfqrqcZ6fXwCg5ahx
 ydicp3h3A0i9NXmvA9CkLpcD/ilJ6+NfnA3eOQlzTFr+5OLk2td4ecPP1C2PhN5q
 uFZV38F35mZvr5y67fhWsPVE//7lOj2pejTWlIBpWAZx0AewwKJh+I9758UZ3oIV
 FKfxfBUbNIRZkGvSOuuI0CgYqYLUban+4ebso4VCqZNlcCKxP+8vRRlWXc0jGl8c
 QRAMA/4jIcak/DCpK08BNTm9GRcflV0t9pI00DUZvNifBEGTZkudQDzX4d5JUTGN
 cbBbJpjcMs305qtfVGymBYQperv9CdvXQIV6gXGein3QHy63/OqvbP5S/i+FIv1+
 f0QS0nGjyxRXYvOY8B2sg0LwBpOUDoUzauqF94hVFBCkC7OrXrQjTFZNIEFyYmVp
 dHNwbGF0eiAoTFZNKSA8bGFwQGx2bS5kZT6IYAQTEQIAIAUCSqeUuAIbAwYLCQgH
 AwIEFQIIAwQWAgMBAh4BAheAAAoJECAUSjFXjzq8egcAoLX4EZ+0V+/isIhCumMy
 5h0/Hiv+AKC/dPOpqwZzazoWP8PrweBM/CnY17kCDQRKp5S4EAgAjNyy9SCGuoQW
 M9BIhgwhRbsD0iW9vzDz8UENow5W6dsWHzocEpNSRAFsvD1LOeYpSWFC5y8yIYe+
 S0xwNbN9rN5NhwFz4MCqKlwX2V3u00GMHeVTRvn169wr7VPGyun63iCdlJtm/Kbl
 qu8/qek4y8EwS+bDh0f+bjNbqOmNIDvR2d9vV9pzK++WToQjAwmKH7yWwMBz4TYT
 Qc55jtB5DoChKA2E+xE8vEpwizQ6ZoMp7VpyNos0YezfThcNZ9eIDXW+O2zNIWNM
 f3GAad/VwRxfTAv/maW6ItLgGH493kHlR99yv3036vxZ93/N99wDB/FtFrqzFHv6
 mBhNOFWLGwADBgf8D9nx9UuiRf3OwS+0GT2mrXXOFzoKCxQmZ6kaojcMERX46PQF
 tQ1dzwK2qDvhzHhHewXGqZOIgZJpNsyEreolbpdMkvtJZtJFor/5niHbnfOu7VOC
 HaXSBlobK2CU33nulnvk3tVEaGhhNx+4CuMyrenmXFxwdRP3uMhERZWGtkgqIdej
 B9CG+VjIy85FxPVacGfMAsep/wDbSxRLyBAfNhIKkjBdT7UqMJAOCDWerbq+/BbT
 v+YXu8dQe5HyHGkRMDd3ow7ylItvJPigLGLaD5Eu3A5GvGqMe782CclH44I5Hurj
 rZYpo93Azri+hbuYNOyoyJbJlQgY1v/W0eYV+YhJBBgRAgAJBQJKp5S4AhsMAAoJ
 ECAUSjFXjzq8FW0An2wfWCAn/h1siI6OBWsesIilC+wyAKCnI84v1GrumVCWmpcv
 RfOQVvfkOw==
 =ZXjV
 -----END PGP PUBLIC KEY BLOCK-----
EOF
