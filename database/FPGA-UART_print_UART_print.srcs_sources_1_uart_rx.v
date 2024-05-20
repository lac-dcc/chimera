// This program was cloned from: https://github.com/MoonGrt/FPGA-UART_print
// License: MIT License

module uart_rx #(
    parameter CLK_FRE = 50,       // clock frequency(Mhz)
    parameter BAUD_RATE = 115200  // serial baud rate
)(
    input  wire       clk,       // clock input
    input  wire       rst,       // asynchronous reset input, high active 
    input  wire       rx_pin,    // serial data input
    input  wire       rx_ready,   // data receiver module ready
    output reg        rx_valid,  // received serial data is valid
    output reg  [7:0] rx_data    // received serial data
);

// calculates the clock cycle for baud rate 
localparam CYCLE = CLK_FRE * 1000000 / BAUD_RATE;
// state machine code
localparam STATE_IDLE  = 2'b00;
localparam STATE_START = 2'b01;  // start bit
localparam STATE_DATA  = 2'b10;  // data bits
localparam STATE_STOP  = 2'b11;  // stop bit
reg  [1:0]  state;

reg  [7:0]  rx_bits;     // temporary storage of received data
reg  [15:0] cycle_cnt;   // baud counter
reg  [2:0]  bit_cnt;     // bit counter
reg         rx_d0;       // delay 1 clock for rx_pin
reg         rx_d1;       // delay 1 clock for rx_d0
wire        rx_negedge;  // negedge of rx_pin

assign rx_negedge = rx_d1 && ~rx_d0;

// synchronize asynchronous signals
always @(posedge clk or posedge rst) begin
    if (rst) begin
        rx_d0 <= 1'b0;
        rx_d1 <= 1'b0;	
    end
    else begin
        rx_d0 <= rx_pin;
        rx_d1 <= rx_d0;
    end
end

always @(posedge clk or posedge rst) begin
    if (rst)
        cycle_cnt <= 16'd0;
    else if((cycle_cnt == CYCLE - 1) || state == STATE_IDLE)
        cycle_cnt <= 16'd0;
    else
        cycle_cnt <= cycle_cnt + 16'd1;	
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
       state <= STATE_IDLE;
       rx_valid <= 1'b0;
       rx_data <= 8'd0;
       bit_cnt <= 3'd0;
       rx_bits <= 8'd0;
    end
    else
        case (state)
        STATE_IDLE:begin
            if(rx_negedge)
                state <= STATE_START;
            rx_valid <= 1'b0;
        end
        STATE_START:
            if (cycle_cnt == CYCLE - 1)  // one data cycle 
                state <= STATE_DATA;
        STATE_DATA: begin
            if (cycle_cnt == CYCLE - 1 && bit_cnt == 3'd7)  // receive 8bit data
                state <= STATE_STOP;
            if (cycle_cnt == CYCLE - 1)
                bit_cnt <= bit_cnt + 3'd1;
            else
                bit_cnt <= bit_cnt;
            if (cycle_cnt == CYCLE/2 - 1)
                rx_bits[bit_cnt] <= rx_pin;
        end
        STATE_STOP: begin
            state <= STATE_IDLE;  // avoid missing the next byte receiver, skip stop bit
            rx_valid <= 1'b1;
            rx_data <= rx_bits;
        end
        default: 
            state <= STATE_IDLE;
        endcase
end

endmodule
