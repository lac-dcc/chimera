// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module uart_tx #(
    parameter CLK_FREQ = 50000000, 
    parameter BAUDRATE = 9600, 
    parameter DATA_WIDTH = 8, 
    parameter STOP_BIT_SIZE = 1) 
(
    /* Clocking signal */
    input wire clk,

    /* Start transmission signal */
    input wire start,
    
    /* Input data */
    input wire [DATA_WIDTH - 1:0]transmit_data,
    
    /* TX line */
    output reg line = 1'b1,

    /* Transmitter ready to work */
    output wire ready
);

/*
 * Data read from input that 
 * is saved for transmission
 */
reg [DATA_WIDTH - 1:0]data = 0;

`define IDLE_BIT_NUM 2 * (DATA_WIDTH + 1 + STOP_BIT_SIZE)

/* Current bit number in data */
reg [$clog2(`IDLE_BIT_NUM):0]bit_num = `IDLE_BIT_NUM;

/* Transmitter ready to work */
assign ready = bit_num == `IDLE_BIT_NUM;

/* Reset signal for divider */
reg reset = 0;

/* Clock divider */
clock_div #(.X(CLK_FREQ / (2 * BAUDRATE))) clk_div(
    .clk(clk), 
    .clk_divided(clk_divided),
    .reset(reset)
);

always @(posedge clk) begin
    
    /* 
     * We start if: 
     * - start == 1: input signal indicating there is data to transmit 
     * - ready == 1: transmitter is not busy
     */
    if (start && ready) begin 
        
        /* Save up data */
        data <= transmit_data;

        /* Reset divider counter */
        reset <= 1'b1;
        
        /* Start from the 0 bit of bata*/
        bit_num <= 4'h0;
        
        /* Start bit */
        line <= 1'b0;
    end else 

        /* No need to reset */
        reset <= 1'b0;
end

always @(posedge clk_divided) begin
    
    if (!bit_num)
        line <= 1'b0;
    else 
        line <= (bit_num - 1 <  2 * DATA_WIDTH)? data[(bit_num - 1) >> 1] : 1'b1;
    
    bit_num <= (bit_num == `IDLE_BIT_NUM)? bit_num : bit_num + 4'h1;
end

endmodule
