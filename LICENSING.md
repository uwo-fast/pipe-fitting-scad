# Licensing

Everything in this repository is licensed under the GNU General Public License,
version 3 only (`GPL-3.0-only`), except the third-party portions listed below. The
full text is in [`LICENSE`](LICENSE).

## Why GPL-3.0-only

These are the licences declared for the design's
[OSHWA certification CA000069](https://certification.oshwa.org/ca000069.html)
(6 November 2025): `GPL-3.0-only` for hardware, software and documentation alike.
The paper and its OSF repository say "GPL 3.0" as well.

This differs from the FAST
[licensing policy](https://github.com/uwo-fast/.github/blob/main/LICENSING.md),
which would license the parametric CAD `GPL-3.0-or-later` and `CERN-OHL-S-2.0`.
The certified terms take precedence here.

The parametric OpenSCAD source is both the software and the hardware design source,
so the generated geometry (STL and other exports) is under `GPL-3.0-only` too.

## Third-party portions

| Path | Origin | Licence |
| --- | --- | --- |
| `adaptersMod/` | Adapted from [Makrokaba's universal thread and pipe joint generator](https://www.thingiverse.com/thing:4323468), versions 0.0–0.3 (2020) | Makrokaba's versions: BSD 3-Clause, the terms in each file's header. FAST's version 0.4 changes: `GPL-3.0-only`. |

The design also uses [threadlib](https://github.com/adrianschlatter/threadlib) by
Adrian Schlatter (`BSD-3-Clause`). It is installed separately as an OpenSCAD
library and is not included in this repository.

## Warranty and liability

GPL-3.0 sections 15–17 disclaim warranty and limit liability. See also
[`docs/DISCLAIMER.md`](docs/DISCLAIMER.md): a printed fitting may fail, and its
use is entirely at your own risk.

## Contributions

Contributions are licensed under the terms of the files they touch, as set out
above, with no additional terms.
