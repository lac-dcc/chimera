// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

module fpga #(
    parameter TRNG_WIDTH = 8
)(
    input CLK,
    input BTN_N, // user button, pressed = 0
    input RX,
    input CTS,
    input [TRNG_WIDTH-1:0] TRNG_WORD,
    input TRNG_VALID,
    output TRNG_REQ,
    output TX,
    output RTS
);

reg [1:0] power_on_resetn_ctr;

initial begin
    power_on_resetn_ctr = 2'b11;
end

always @(posedge CLK) begin
    if (power_on_resetn_ctr != 2'b00) begin
        power_on_resetn_ctr <= power_on_resetn_ctr - 1;
    end
end

wire btn_n_internal;
sync sync_btn(
    .clk (CLK),
    .ext (BTN_N),
    .int (btn_n_internal)
);

wire resetn = btn_n_internal & (power_on_resetn_ctr == 2'b00);

wire rx_internal;
sync sync_rx(
    .clk (CLK),
    .ext (RX),
    .int (rx_internal)
);

wire cts_internal;
sync sync_cts(
    .clk (CLK),
    .ext (CTS),
    .int (cts_internal)
);

pwhash #(
    .TRNG_WIDTH (TRNG_WIDTH)
) pwhash(
    .clk (CLK),
    .resetn (resetn),
    .rx (rx_internal),
    .cts (cts_internal),
    .tx (TX),
    .rts (RTS),
    .trng_req (TRNG_REQ), 
    .trng_word (TRNG_WORD),
    .trng_valid (TRNG_VALID)
);

endmodule
