// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module WaterLight(
    input [7:0] WaterLight_mode,
    input [31:0] WaterLight_speed,
    input clk,
    input RSTn,
    output reg [7:0] LED,
    output wire LEDclk
);

//------------------------------------------------------
//  PWM
//------------------------------------------------------

reg [31:0] pwm_cnt;

always@(posedge clk or negedge RSTn) begin
    if(~RSTn) pwm_cnt <= 32'b0;
    else if(pwm_cnt == WaterLight_speed) pwm_cnt <= 32'b0;
    else pwm_cnt <= pwm_cnt + 1'b1;
end

reg light_clk;

always@(posedge clk or negedge RSTn) begin
    if(~RSTn) light_clk <= 1'b0;
    else if(pwm_cnt == WaterLight_speed) light_clk <= ~light_clk;
end

assign LEDclk = light_clk;

//------------------------------------------------------
//  LEFT MODE
//------------------------------------------------------

reg [7:0] mode1;

always@(posedge light_clk or negedge RSTn) begin
    if(~RSTn) mode1 <= 8'h01;
    else begin
        case(mode1)
        8'h01 : mode1 <= 8'h02;
        8'h02 : mode1 <= 8'h04;
        8'h04 : mode1 <= 8'h08;
        8'h08 : mode1 <= 8'h10;
        8'h10 : mode1 <= 8'h20;
        8'h20 : mode1 <= 8'h40;
        8'h40 : mode1 <= 8'h80;
        default : mode1 <= 8'h01;
        endcase
    end
end

//------------------------------------------------------
//  RIGHT MODE
//------------------------------------------------------

reg [7:0] mode2;

always@(posedge light_clk or negedge RSTn) begin
    if(~RSTn) mode2 <= 8'h80;
    else begin
        case(mode2)
        8'h80 : mode2 <= 8'h40;
        8'h40 : mode2 <= 8'h20;
        8'h20 : mode2 <= 8'h10;
        8'h10 : mode2 <= 8'h08;
        8'h08 : mode2 <= 8'h04;
        8'h04 : mode2 <= 8'h02;
        8'h02 : mode2 <= 8'h01;
        default : mode2 <= 8'h80;
        endcase
    end
end

//------------------------------------------------------
//  FLASH MODE
//------------------------------------------------------

wire [7:0] mode3;

assign mode3 = (light_clk == 1'b0) ? 8'h00 : 8'hff;

//------------------------------------------------------
//  OUTPUT MUX
//------------------------------------------------------


endmodule
