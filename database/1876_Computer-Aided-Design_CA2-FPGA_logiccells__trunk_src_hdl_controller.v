// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module controller (
    input clk,rst,s,
    output input_en, load_in, sel_old_or_new, mul_en, sum_en, done
);

wire d2,d1,d0,not_d0,not_d1,not_d2,not_s,dff0,dff1,dff2,sel, not_sel,
     o1,o2,o3,o4,o5,o6,o7,o8,l1,l2;

Not N0(.A(sel), .out(not_sel));

Not N1(.A(d0), .out(not_d0));
Not N2(.A(d1), .out(not_d1));
Not N3(.A(d2), .out(not_d2));
Not N4(.A(s), .out(not_s));

And3 and1_d2(.A(s), .B(d2), .C(not_d0), .out(o1));
And and2_d2(.A(d0), .B(d2), .out(o2));
And and3_d2(.A(d0), .B(d1), .out(o3));
Or3 or_d2(.A(o1), .B(o2), .C(o3), .out(dff2));
DFF df2(.D(dff2), .clk(clk), .rst(rst), .Q(d2));

And3 and1_d1(.A(not_s), .B(d2), .C(not_d0), .out(o4));
And3 and2_d1(.A(not_d1), .B(not_d2), .C(d0), .out(o5));
And and3_d1(.A(d1), .B(not_d0), .out(o6));
Or3 or_d1(.A(o4), .B(o5), .C(o6), .out(dff1));
DFF df1(.D(dff1), .clk(clk), .rst(rst), .Q(d1));

And and1_d0(.A(not_d0), .B(not_d2), .out(o7));
And and2_d0(.A(d0), .B(d2), .out(o8));
Or or_d0(.A(o7), .B(o8), .out(dff0));
DFF df0(.D(dff0), .clk(clk), .rst(rst), .Q(d0));

And3 cs1(.A(not_d2), .B(not_d1), .C(not_d0), .out(input_en));

And3 cs2(.A(d2), .B(not_d1), .C(not_d0), .out(l1));
And3 cs3(.A(not_d2), .B(not_d1), .C(d0), .out(l2));
Or or_cs23(.A(l1), .B(l2), .out(load_in));

And3 cs4(.A(not_d2), .B(not_d1), .C(d0), .out(sel_old_or_new));

And3 cs5(.A(not_d2), .B(d1), .C(not_d0), .out(sel));
//assign sel_old_or_new = not_sel;

And3 cs6(.A(not_d2), .B(d1), .C(not_d0), .out(mul_en));

And3 cs7(.A(not_d2), .B(d1), .C(d0), .out(sum_en));

And3 cs8(.A(d2), .B(not_d1), .C(d0), .out(done));

endmodule