`include "../rotary_enc/rotary_enc.v"
`include "dac.v"
`include "dac_top_pll.v"

module dac_top(
    input CLK_i,
    input RSTn_i,
    input B16_i,    // push button of rotary enc.
    input D14_i,    // rotary_1
    input D15_i,    // rotary_2
    output [7:0] LED_o,
    output D16_o    // dac output
);

wire [7:0] dac_in;
wire dac_out;

reg [7:0] dac = 0;

wire PLL_CLK;

dac_top_pll pll (CLK_i,  // REFERENCECLK
            PLL_CLK, //PLLOUTCORE
            , // PLLOUTGLOBAL
            RSTn_i //RESET
            );

dac #(.MSBI( 7 )) my_dac (
    PLL_CLK,          // master clock for this component
    RSTn_i,         // reset
    dac_out,
    dac_in
    );

wire rot_dir, rot_event;

rotary_decoder my_rotary_decoder(
    .CLK_i(CLK_i),
    .rot_1_i(~D14_i),
    .rot_2_i(~D15_i),
    .rot_dir_o(rot_dir),
    .rot_event_o(rot_event)
    );

always @ ( posedge CLK_i ) begin
    if(~RSTn_i | ~B16_i) begin
        dac <= 8'b0;
    end
    else begin
        if(rot_event)
            dac <= rot_dir ? dac + 1 : dac - 1;
    end
end

assign dac_in = dac;

assign LED_o[7:0] = dac[7:0];
assign D16_o = dac_out;

endmodule // dac_top
