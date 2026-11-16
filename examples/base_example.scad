use <pipe-fitting-scad/pipeFitting.scad>;
use <threadlib/threadlib.scad>;

// ----------------------------
// -------- Parameters --------
// ----------------------------

// The input diameter for the pipe(s) being coupled
input_dia = 12.00;

selectedPart = "all"; // ["fitting", "nut", "gasket", "all"]

// show the pipe that the fitting is designed for
showInputPipe = true; // [true, false]

// show the cross section of the fitting
showXSection = true; // [true, false]

// The thread type to use for the fitting
thread_type_select = "UNC-7/8-ext";

// ----------------------------
// ------ End Parameters ------
// ----------------------------

// ----------------------------
// ----- Global Variables -----
// ----------------------------

// dummy module to stop cuztomizer
module dummy()
{
}

$fn = $preview ? 120 * 1 / 4 : 120 * 1;

// Design-preset dimensions used to place the parts in the assembled view.
turns = 5;
middle_length = 20;
transition_length = 15;
cap_thickness = 1;
lower_length = middle_length / 2;
mid_height = transition_length / 2;

thread_specs = thread_specs(thread_type_select);
thread_pitch = thread_specs[0];
thread_height = (turns + 1) * thread_pitch;

// ----------------------------
// --- End Global Variables ---
// ----------------------------

// ----------------------------
// -----      Design      -----
// ----------------------------

check_fitting(thread_type = thread_type_select, input_dia = input_dia, wall_thickness = 1.2,
              tol_pipe = 0.2, tol_gasket = 0.1, gasket_extra_length = 3);

if ((selectedPart == "fitting" || selectedPart == "all"))
{

    color("green") xSection(showXSection)
        generateFitting(thread_type = thread_type_select, input_dia = input_dia);

    if (showInputPipe)
    {
        color(c = "pink", alpha = 0.25) cylinder(
            h = (middle_length + transition_length * 2 + (turns + 1) * thread_specs(thread_type_select)[0] * 2) +
                input_dia * 4,
            d = input_dia, center = true);
    }
}

if ((selectedPart == "nut" || selectedPart == "all"))
{
    translate([ 0, 0.05, thread_height + cap_thickness / 2 + lower_length + mid_height * 2 ]) rotate([ 0, 180, 0 ])
        color("blue") xSection(showXSection) rotate([ 0, 0, 180 ])
            generateNut(thread_type = thread_type_select, input_dia = input_dia);
}

if ((selectedPart == "gasket" || selectedPart == "all"))
{
    translate([ 0, -0.05, lower_length + mid_height ]) color("orange") xSection(showXSection)
        generateGasket(thread_type = thread_type_select, input_dia = input_dia);
}

module xSection(showXSection)
{
    if (showXSection)
    {
        difference()
        {
            children();

            for (i = [0:1])
                mirror([ i, 1, 0 ]) translate([ 0, 0, -50 ]) cube([ 100, 100, 100 ]);
        }
    }
    else
    {
        children();
    }
}

// ----------------------------
// ---     End Design      ---
// ----------------------------
