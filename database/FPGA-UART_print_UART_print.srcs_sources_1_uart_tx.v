// This program was cloned from: https://github.com/MoonGrt/FPGA-UART_print
// License: MIT License

module uart_tx #(
    parameter CLK_FRE = 50,       // clock frequency (Mhz)
	parameter BAUD_RATE = 115200  // serial baud rate
)(
    input  wire       clk,       // clock input
    input  wire       rst,       // reset input, high active 
    input  wire [7:0] din,       // data to send
    input  wire       tx_vaild,  // sent enable
    output wire       tx_ready,  // send ready
    output reg        tx_p       // serial data output
);

// calculates the clock cycle for baud rate 
localparam CYCLE = CLK_FRE * 1000000 / BAUD_RATE;
// state machine code
localparam STATE_IDLE  = 2'b00;
localparam STATE_START = 2'b01;  // start bit
localparam STATE_DATA  = 2'b10;  // data bits
localparam STATE_STOP  = 2'b11;  // stop bit
reg  [1:0] state = STATE_IDLE;

reg  [7:0] data = 8'h0;
reg  [2:0] bitpos = 3'h0;
reg  [$clog2(CYCLE)+1:0] tx_clkcnt = 0;

wire tx_clk;
assign tx_clk = (tx_clkcnt == 0);
assign tx_ready = (state == STATE_IDLE);

always @(posedge clk or posedge rst) begin
    if (rst)
        tx_clkcnt <= 0;
    else if (tx_clkcnt >= CYCLE - 1)
        tx_clkcnt <= 0;
    else
        tx_clkcnt <= tx_clkcnt + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= STATE_IDLE;
        data <= din;
        bitpos <= 3'h0;
        tx_p <= 1'b1;
    end
    else
        case (state)
        STATE_IDLE:
            if (tx_vaild) begin
                state <= STATE_START;
                data <= din;
                bitpos <= 3'h0;
            end
        STATE_START:
            if (tx_clk) begin
                tx_p <= 1'b0;
                state <= STATE_DATA;
            end
        STATE_DATA:
            if (tx_clk) begin
                if (bitpos == 3'h7)
                    state <= STATE_STOP;
                else
                    bitpos <= bitpos + 3'h1;
                tx_p <= data[bitpos];
            end
        STATE_STOP:
            if (tx_clk) begin
                tx_p <= 1'b1;
                state <= STATE_IDLE;
            end
        default:
           state <= STATE_IDLE;
        endcase
end

endmodule
