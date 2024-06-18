// This program was cloned from: https://github.com/ericsmi/tt06-weste-problem-4.11
// License: Apache License 2.0

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////

module and_pa_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = a[5]&a[4]&a[1]&a[0];
`else
wire x;
/*
 * Sky130A doesnt provide a 6 input nand for
 * good reason so we'll have to make due.
 */
sky130_fd_sc_hd__nand4_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[1]), .D(a[0]),
    .Y(x)
);
sky130_fd_sc_hd__inv_1 _1_(
    .A(x),
    .Y(y)
);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pa_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = a[5]&a[4]&a[1]&a[0];
`else
wire x;
sky130_fd_sc_hd__nand4_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[1]), .D(a[0]),
    .Y(x)
);
sky130_fd_sc_hd__inv_2 _1_(
    .A(x),
    .Y(y)
);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pa_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = a[5]&a[4]&a[1]&a[0];
`else
wire x;
sky130_fd_sc_hd__nand4_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[1]), .D(a[0]),
    .Y(x)
);
sky130_fd_sc_hd__inv_4 _1_(
    .A(x),
    .Y(y)
);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [1:0] x;
sky130_fd_sc_hd__nand3_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[3]),
    .Y(x[1]));
sky130_fd_sc_hd__nand3_1 _1_(
    .A(a[2]), .B(a[1]), .C(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__nor2_1 _2_(
    .A(x[0]),.B(x[1]),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [1:0] x;
sky130_fd_sc_hd__nand3_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[3]),
    .Y(x[1]));
sky130_fd_sc_hd__nand3_1 _1_(
    .A(a[2]), .B(a[1]), .C(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__nor2_2 _2_(
    .A(x[0]),.B(x[1]),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [1:0] x;
sky130_fd_sc_hd__nand3_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[3]),
    .Y(x[1]));
sky130_fd_sc_hd__nand3_1 _1_(
    .A(a[2]), .B(a[1]), .C(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__nor2_4 _2_(
    .A(x[0]),.B(x[1]),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [2:0] x;
sky130_fd_sc_hd__nand2_1 _0_(
    .A(a[5]), .B(a[4]),
    .Y(x[2]));
sky130_fd_sc_hd__nand2_1 _1_(
    .A(a[3]), .B(a[2]),
    .Y(x[1]));
sky130_fd_sc_hd__nand2_1 _2_(
    .A(a[1]), .B(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__nor3_1 _3_(
    .A(x[0]),.B(x[1]),.C(x[2]),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [2:0] x;
sky130_fd_sc_hd__nand2_1 _0_(
    .A(a[5]), .B(a[4]),
    .Y(x[2]));
sky130_fd_sc_hd__nand2_1 _1_(
    .A(a[3]), .B(a[2]),
    .Y(x[1]));
sky130_fd_sc_hd__nand2_1 _2_(
    .A(a[1]), .B(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__nor3_2 _3_(
    .A(x[0]),.B(x[1]),.C(x[2]),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [2:0] x;
sky130_fd_sc_hd__nand2_1 _0_(
    .A(a[5]), .B(a[4]),
    .Y(x[2]));
sky130_fd_sc_hd__nand2_1 _1_(
    .A(a[3]), .B(a[2]),
    .Y(x[1]));
sky130_fd_sc_hd__nand2_1 _2_(
    .A(a[1]), .B(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__nor3_4 _3_(
    .A(x[0]),.B(x[1]),.C(x[2]),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [1:0] x,s;
wire t;
sky130_fd_sc_hd__nand3_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[3]),
    .Y(x[1]));
sky130_fd_sc_hd__nand3_1 _1_(
    .A(a[2]), .B(a[1]), .C(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__inv_1 _2_(
    .A(x[1]),
    .Y(s[1]));
sky130_fd_sc_hd__inv_1 _3_(
    .A(x[0]),
    .Y(s[0]));
sky130_fd_sc_hd__nand2_1 _4_(
    .A(s[0]), .B(s[1]), 
    .Y(t));
sky130_fd_sc_hd__inv_1 _5_(
    .A(t),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [1:0] x,s;
wire t;
sky130_fd_sc_hd__nand3_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[3]),
    .Y(x[1]));
sky130_fd_sc_hd__nand3_1 _1_(
    .A(a[2]), .B(a[1]), .C(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__inv_1 _2_(
    .A(x[1]),
    .Y(s[1]));
sky130_fd_sc_hd__inv_1 _3_(
    .A(x[0]),
    .Y(s[0]));
sky130_fd_sc_hd__nand2_1 _4_(
    .A(s[0]), .B(s[1]), 
    .Y(t));
sky130_fd_sc_hd__inv_2 _5_(
    .A(t),
    .Y(y));
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
wire [1:0] x,s;
wire t;
sky130_fd_sc_hd__nand3_1 _0_(
    .A(a[5]), .B(a[4]), .C(a[3]),
    .Y(x[1]));
sky130_fd_sc_hd__nand3_1 _1_(
    .A(a[2]), .B(a[1]), .C(a[0]),
    .Y(x[0]));
sky130_fd_sc_hd__inv_1 _2_(
    .A(x[1]),
    .Y(s[1]));
sky130_fd_sc_hd__inv_1 _3_(
    .A(x[0]),
    .Y(s[0]));
sky130_fd_sc_hd__nand2_2 _4_(
    .A(s[0]), .B(s[1]), 
    .Y(t));
sky130_fd_sc_hd__inv_6 _5_(
    .A(t),
    .Y(y));
`endif
endmodule

