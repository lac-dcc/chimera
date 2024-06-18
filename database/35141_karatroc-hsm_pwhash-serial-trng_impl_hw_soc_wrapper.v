// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

/* verilator lint_off PINMISSING */

module wrapper #(
    parameter FIRMWARE_FILE = "firmware.mem",
    parameter ROM_ADDR_BITS = 12,
    parameter RAM_ADDR_BITS = 17,
    parameter FRAM_ADDR_BITS = 20
) (
    input clk,
    input resetn,
    input uart_rx,
    input uart_cts,
    output uart_tx,
    output uart_rts,
    input trng_bit,
    output trng_req
);

localparam pwrmgr_state_embryo  = 2'b01;
localparam pwrmgr_state_running = 2'b10;

reg [1:0] pwrmgr_state;

wire soc_resetn;
assign soc_resetn = resetn && !(pwrmgr_state == pwrmgr_state_embryo) && !(pwrmgr_state == pwrmgr_state_running && poweroff_rq);
wire poweroff_rq;

always @(posedge clk) begin
    if (!resetn) begin
        pwrmgr_state <= pwrmgr_state_embryo;
    end else begin
        if (pwrmgr_state == pwrmgr_state_embryo) begin
            if (!uart_cts) begin
                pwrmgr_state <= pwrmgr_state_running;
            end
        end else if (pwrmgr_state == pwrmgr_state_running) begin
            if (poweroff_rq) begin
                pwrmgr_state <= pwrmgr_state_embryo;
            end
        end
    end
end

wire soc_tx;
wire soc_rts;
assign uart_tx = pwrmgr_state == pwrmgr_state_running ? soc_tx : 1;
assign uart_rts = pwrmgr_state == pwrmgr_state_running ? soc_rts : 1;

soc #(
    .FIRMWARE_FILE (FIRMWARE_FILE),
    .ROM_ADDR_BITS (ROM_ADDR_BITS),
    .RAM_ADDR_BITS (RAM_ADDR_BITS),
    .FRAM_ADDR_BITS (FRAM_ADDR_BITS)
) soc (
    .clk (clk),
    .resetn (soc_resetn),
    .uart_tx (soc_tx),
    .uart_rx (uart_rx),
    .uart_cts (uart_cts),
    .uart_rts (soc_rts),
    .spi_miso (1'b0),
    .poweroff_rq (poweroff_rq),
    .trng_bit (trng_bit),
    .trng_req (trng_req)
);

endmodule
