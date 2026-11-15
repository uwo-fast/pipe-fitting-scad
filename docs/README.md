# Docs

The fittings were tested with water only. See [Performance Testing](../README.md#performance-testing) for what the tests do and do not establish.

## Threads

The candidate threads are the external (`-ext`) threads in `threadlib`'s [`THREAD_TABLE.scad`](https://github.com/adrianschlatter/threadlib/blob/0.5/THREAD_TABLE.scad). `pfDesigner.scad` keeps those whose support diameter is from `input_dia + gasket_thickness_lower / 2` to `input_dia + gasket_thickness_upper / 2`.

## Parameters

The parameters at the top of `pfDesigner.scad`, with their defaults. Lengths are in mm.

| Parameter | Default | What it does |
|---|---|---|
| `input_dia` | 12 | Outside diameter of the pipe being coupled. |
| `gasket_thickness_upper` | 15 | With `gasket_thickness_lower`, sets the support diameter range used to pick candidate threads. |
| `gasket_thickness_lower` | 13 | See `gasket_thickness_upper`. |
| `gasket_extra_length` | 3 | Length added to the gasket beyond the thread so the nut compresses it. Must be more than the thread pitch. |
| `tol_pipe` | 0.2 | Radial clearance between the pipe and the fitting and nut bores. |
| `tol_gasket` | 0.1 | Radial clearance between the pipe and the gasket bore. Must be less than `tol_pipe`. |
| `turns` | 5 | Thread turns on the fitting and nut. Also sets the gasket length with `gasket_extra_length`. |
| `wall_thickness` | 1.2 | Wall thickness of the fitting. The gasket fills the fitting's bore, so this also sets the gasket's outside diameter. |
| `middle_length` | 20 | Length of the fitting's centre tube; each half of the fitting gets `middle_length / 2`. |
| `transition_length` | 15 | Sets the section between the thread and the centre tube; the code uses `transition_length / 2`, which is also the length of the gasket's taper. |
| `cap_thickness` | 1 | Thickness of the nut's end cap. |
| `nut_wall_thickness` | 2.4 | Wall thickness of the nut. |
| `flat_gasket_thickness` | 2 | Thickness of the flat disc gasket used with the closed nut. |
| `entry_chamfer` | true | Chamfers the thread entry on the fitting and nut. |
| `style` | `"Hexagon"` | Outer shape of the fitting body and nut: `"Hexagon"`, `"Cone"` or `"Circular"`. |
| `selectedThread` | 5 | Index of the candidate thread to use, from 0 to one less than the number of candidates. |
| `export` | true | `true` renders only `selectedPart`. `false` shows every candidate thread with its gasket, and the selected fitting, nut and gasket, plus `closed_nut` or `flat_gasket` when one of those is selected. |
| `selectedPart` | `"all"` | `fitting`, `nut`, `gasket`, `closed_nut`, `flat_gasket`, or `all` (fitting, nut and gasket). |
| `showInputPipe` | false | Shows the pipe for reference, when the selected part includes the fitting. |
