// This program was cloned from: https://github.com/EatFruitWang/Vivado_ip_teach
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:王俊雄
// 
// Create Date: 2024/05/11 13:52:42
// Design Name: 
// Module Name: FIR_filter_TB
// Project Name: 
// Target Devices: 
// Tool Versions: v1.0
// Description: 
// 
// Dependencies: 
// 
// Revision:
// V1.0 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIR_filter_TB( );
reg sys_clk;
reg rst;
initial begin
    sys_clk = 1'b1;
    rst     = 1'b1;
end
always #5 sys_clk = ~sys_clk;
always @(posedge sys_clk)
begin
    rst <= #10 1'b0;
end

// MMCM CLOCK
clk_wiz_0 MMCM_CLK(
    .clk(clk),
    .reset(rst),
    .rst_n(rst_n),
    .clk_100MHz(sys_clk));

//CLOCK 1MHz
reg [5:0] CLK_1M_CT;
reg CLK_1M;
always @(posedge clk,negedge rst_n)
begin
    if(!rst_n)
    begin
        CLK_1M_CT <=  'd0;
        CLK_1M    <= 1'b0;
    end
    else
    begin
        CLK_1M_CT <= (CLK_1M_CT == 'd49) ? 'd0 : CLK_1M_CT + 1'b1;
        CLK_1M    <= (CLK_1M_CT == 'd49) ? ~CLK_1M : CLK_1M;
    end
end

//DDS 140kHz (Fs == 1MHz)
wire DDS_140kHz_tvalid;
wire signed [15:0] DDS_140kHz_tdata_2_ADDER_A;
dds_compiler_0 DDS_140kHz(
    .aclk(CLK_1M),
    .aresetn(rst_n),
    .s_axis_phase_tvalid(1'b1),
    .s_axis_phase_tdata(16'b0010_0011_1101_0111),
    .m_axis_data_tvalid(DDS_140kHz_tvalid),
    .m_axis_data_tdata(DDS_140kHz_tdata_2_ADDER_A));

//DDS 10kHz (Fs == 1MHz)
wire DDS_10kHz_tvalid;
wire signed [15:0] DDS_10kHz_tdata_2_ADDER_B;
dds_compiler_0 DDS_10kHz(
    .aclk(CLK_1M),
    .aresetn(rst_n),
    .s_axis_phase_tvalid(1'b1),
    .s_axis_phase_tdata(16'b0000_0010_1000_1111),
    .m_axis_data_tvalid(DDS_10kHz_tvalid),
    .m_axis_data_tdata(DDS_10kHz_tdata_2_ADDER_B));

// ADDER
wire signed [16:0] ADDER_OUT_2_LOWPASS;
c_addsub_0 ADDER(
    .A(DDS_140kHz_tdata_2_ADDER_A),
    .B(DDS_10kHz_tdata_2_ADDER_B),
    .CLK(CLK_1M),
    .S(ADDER_OUT_2_LOWPASS));

//LOW PASS Filter Fs = 1000000 Fpass = 21000 Fstop = 170000 order = 16 Apass = 1dB Astop = -80dB
wire LOWPASS_m_tvalid;
wire signed [33:0] LOWPASS_OUT;
fir_compiler_0 LOWPASS(
    .aresetn(rst_n),
    .aclk(CLK_1M),
    .s_axis_data_tvalid(1'b1),
    .s_axis_data_tready(LOWPASS_s_tready),
    .s_axis_data_tdata(ADDER_OUT_2_LOWPASS),
    .m_axis_data_tvalid(LOWPASS_m_tvalid),
    .m_axis_data_tdata(LOWPASS_OUT));

endmodule
