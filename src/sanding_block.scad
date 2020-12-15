sanding_block_width = 15;
sanding_block_length = 60;
sanding_block_wedge_angle = 60;
sanding_block_diameter = 15;
sanding_block_with_wedges = true;

module __sanding_block_body()
{
    hull() {
        circle(d = sanding_block_diameter);
        translate([sanding_block_length, 0, 0]) {
            circle(d = sanding_block_diameter);
        }
    }
}

module __sanding_block_wedge()
{
    width_long = sanding_block_width / 3;
    width_short = width_long / 3;
    length = sanding_block_diameter * 1.2;

    polygon(
        points = [
            [0, width_short / 2],
            [0, width_short / -2],
            [length, width_long / -2],
            [length, width_long / 2]
        ]
    );
}

module sanding_block()
{
    linear_extrude(height = sanding_block_width) {
        difference() {
            __sanding_block_body();
            rotate(sanding_block_wedge_angle) {
                __sanding_block_wedge();
            }
            translate([sanding_block_length, 0, 0]) {
                rotate(180 - sanding_block_wedge_angle) {
                    __sanding_block_wedge();
                }
            }
        }
    }
}

module sanding_block_wedges()
{
    linear_extrude(height = sanding_block_width) {
        translate([0, sanding_block_width, 0]) {
            __sanding_block_wedge();
            translate([sanding_block_width + 10, 0, 0]) {
                __sanding_block_wedge();
            }
        }
    }
}

sanding_block();
if (sanding_block_with_wedges) {
    sanding_block_wedges();
}
