// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module UART_RX(
    input clk,
    input clk_uart,
    input RSTn,
    input RXD,
    output reg [7:0] data,
    output wire interrupt,
    output wire bps_en
);

//shift register
reg [7:0] shift_reg;
always@(posedge clk) begin
    if(~RSTn) shift_reg <= 8'hff;
    else shift_reg <= {RXD,shift_reg[7:1]};
end

wire re_start;
assign re_start = (shift_reg == 8'h0f) ? 1'b1 : 1'b0;

// recive counter
reg counter_en;
reg [3:0] counter;

always@(posedge clk or negedge RSTn) begin
    if(~RSTn) counter_en <= 1'b0;
    else if(re_start&&(~counter_en)) counter_en <= 1'b1;
    else if(counter == 4'h9) counter_en <= 1'b0;
end

always@(posedge clk or negedge RSTn) begin
    if(~RSTn) counter <= 4'h0;
    else if(counter_en) begin 
        if(clk_uart) counter <= counter + 1'b1;
        else if(counter == 4'h9) counter <= 4'h0;
    end
end

assign bps_en = counter_en;

// RXD re
always@(posedge clk or negedge RSTn) begin
    if(~RSTn) data <= 8'h00;
    else if(counter_en) begin
        if(clk_uart && (counter <= 4'h8)) data[counter-1] <= RXD;
    end
end

//interrupt
assign interrupt = (counter == 4'h9) ? 1'b1 : 1'b0;


endmodule