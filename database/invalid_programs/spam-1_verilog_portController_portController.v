// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_PORTCTL
`define V_PORTCTL

`include "../lib/assertion.v"
`include "../74574/hct74574.v"
`include "../74154/hct74154.v"

`timescale 1ns/1ns

module portController (
    input  [7:0] data, 
    input  _portsel_in, 
    input  _port_wr, 
    input  _port_rd,
    output  [15:0] _port_sel_wr, // all lines high uless _port_wr is low
    output  [15:0] _port_sel_rd  // all lines high uless _port_rd is low
);

	logic [7:0] D, Q;
	logic CP, _EN;
    
	hct74574 port_sel_reg( .D(data), .Q, .CLK(_portsel_in), ._OE(1'b0));

    hct74154 portsel_decode_wr(._E0(_port_wr), ._E1(1'b0), .A(port_sel_reg.Q[3:0]), .Y(_port_sel_wr));
    hct74154 portsel_decode_rd(._E0(_port_rd), ._E1(1'b0), .A(port_sel_reg.Q[3:0]), .Y(_port_sel_rd));


endmodule

`endif

