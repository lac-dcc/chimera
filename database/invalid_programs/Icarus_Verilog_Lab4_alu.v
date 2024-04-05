`ifndef ALU
`define ALU
    `include "fulladder_32bit.v"       //(sum,cout,num1, num2,cin );
    `include "module_32bitAND.v"        //module_32bitAND( outp, in1, in2 );
    `include "module_32bitOR.v"         //module_32bitOR( outp, in1, in2 );
    `include "mux_2to1_32bit.v"     //mux_2to1_32bit( outp, inp1, inp2, sel );
    `include "mux_3to1_32bit.v"     //mux_3to1_32bit( outp, inp1, inp2, inp3, sel );

    module alu( input [31:0] a, input [31:0] b, input cin, input binv, input [1:0] oper, output [31:0] result, output cout );

        wire [31:0] bbar, b_sel_bbar, a_and_b, a_or_b, a_addsub_b;

        assign bbar = ~b;

        mux_2to1_32bit mux2to1_op(b_sel_bbar, b, bbar, binv );
        module_32bitAND and_op( a_and_b, a, b_sel_bbar );
        module_32bitOR or_op( a_or_b, a, b_sel_bbar );
        fulladder_32bit fa_outp( a_addsub_b, cout, a, b_sel_bbar, cin );
        mux_3to1_32bit mux3to1_op( result, a_and_b, a_or_b, a_addsub_b, oper );

    endmodule
`endif