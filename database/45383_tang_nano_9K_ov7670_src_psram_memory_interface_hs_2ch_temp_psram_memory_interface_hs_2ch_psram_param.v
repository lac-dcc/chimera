// This program was cloned from: https://github.com/phoenix367/tang_nano_9K_ov7670
// License: MIT License

parameter C0_Reverse_Clk="false";
parameter C0_Diff_Clk="false";
parameter C1_Reverse_Clk="true";
parameter C1_Diff_Clk="true";
parameter Memory_Clock = 135;
parameter PSRAM_WIDTH = 8;
parameter DQ_WIDTH = 8;
parameter ADDR_WIDTH = 21;
parameter Burst_Length  = "32_Bytes";
parameter burst_num = 8;
parameter Fixed_Latency_Enable = "Fixed";
parameter Initial_Latency = 6;
parameter Drive_Strength = 50;
parameter Deep_Power_Down = "OFF";
parameter Hybrid_Sleep_Mode = "OFF";
parameter Refresh_Rate = "normal";
parameter PASR = "full";
parameter shift_delay = 152;
