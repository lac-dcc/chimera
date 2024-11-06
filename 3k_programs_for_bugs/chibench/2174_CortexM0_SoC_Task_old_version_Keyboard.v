// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module Keyboard(
    input       HCLK,
    input       HRESETn,
    input   [3:0]   col,
    output  wire    [3:0] key_interrupt
);


reg [11:0]  sreg0;
wire    [11:0]  sreg0_nxt;

reg [11:0]  sreg1;
wire    [11:0]  sreg1_nxt;

reg [11:0]  sreg2;
wire    [11:0]  sreg2_nxt;

reg [11:0]  sreg3;
wire    [11:0]  sreg3_nxt;

assign  sreg0_nxt   =   sreg0 + 1'b1;
assign  sreg1_nxt   =   sreg1 + 1'b1;
assign  sreg2_nxt   =   sreg2 + 1'b1;
assign  sreg3_nxt   =   sreg3 + 1'b1;

always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
        sreg0   <=  12'b0;
    end else if(col[0]) begin
        if(sreg0 != 12'hfff)
           sreg0   <=  sreg0_nxt;
    end else 
        sreg0   <=  12'b0;
end

always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
        sreg1   <=  12'b0;
    end else if(col[1]) begin
        if(sreg1 != 16'hfff)
           sreg1   <=  sreg1_nxt;
    end else 
        sreg1   <=  12'b0;
end

always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
        sreg2   <=  12'b0;
    end else if(col[2]) begin
        if(sreg2 != 12'hfff)
           sreg2   <=  sreg2_nxt;
    end else 
        sreg2   <=  12'b0;
end

always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
        sreg3   <=  12'b0;
    end else if(col[3]) begin
        if(sreg3 != 12'hfff)
           sreg3   <=  sreg3_nxt;
    end else 
        sreg3   <=  12'b0;
end

reg [3:0] key_reg;

assign key_interrupt[0] =   (sreg0 != 12'hfff) & (sreg0_nxt == 12'hfff);

assign key_interrupt[1] =   (sreg1 != 12'hfff) & (sreg1_nxt == 12'hfff);

assign key_interrupt[2] =   (sreg2 != 12'hfff) & (sreg2_nxt == 12'hfff);

assign key_interrupt[3] =   (sreg3 != 12'hfff) & (sreg3_nxt == 12'hfff);

endmodule