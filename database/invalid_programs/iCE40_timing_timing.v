`include "element_carry.v"


module delay(
    input wire in,
    output wire out
    );
    parameter N = 1;

    wire [N:0] stage;

    genvar i;
    generate
        for(i=0; i<N; i=i+1)
        begin: add
            element my_el(stage[i], stage[i+1]);
        end
    endgenerate

    assign stage[0] = in;
    assign out = stage[N];

endmodule



module timing_top(
    input CLK_i /* synthesis syn_keep = 1 */,
    input RSTn_i,
    input B16_i,    // push button of rotary enc.
    input D14_i,    // rotary_1
    input D15_i,    // rotary_2
    // output [7:0] LED_o,
    output D16_o,   // clk output
    output E14_o,   // delayed clk output
    output F15_o    // second delayed output
);

wire out_1 /* synthesis syn_keep = 1 */;
delay #(1000) my_delay_1(CLK_i, out_1);
assign E14_o = out_1;
assign D16_o = CLK_i;

/////////////
wire x /* synthesis syn_keep = 1 */;
wire out /* synthesis syn_keep = 1 */;
delay #(1000) my_delay(x, out);
assign x = 1 & ~out;
assign F15_o = x;


endmodule // dac_top
