// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module vga_sync(
    input clk, //25.175 MHz

    output reg hsync,
    output reg vsync,
    output [9:0]xpos,
    output [9:0]ypos
);

parameter H_front_t = 16;
parameter H_sync_t = 96;
parameter H_back_t = 48;
parameter H_active_t = 640;
parameter H_blank_t = H_front_t + H_sync_t + H_back_t;
parameter H_total_t = H_blank_t + H_active_t;

parameter V_front_t = 10;
parameter V_sync_t = 2;
parameter V_back_t = 33;
parameter V_active_t = 480;
parameter V_blank_t = V_front_t + V_sync_t + V_back_t;
parameter V_total_t = V_blank_t + V_active_t;

reg [9:0]h_cnt = 10'h3FF;
reg [9:0]v_cnt = 10'h3FF;

initial hsync = 1;
initial vsync = 1;

assign xpos = h_cnt - H_blank_t;
assign ypos = v_cnt - V_blank_t;

always @(posedge clk) begin
    if (h_cnt == H_total_t - 1)
        h_cnt <= 0;
    else
        h_cnt <= h_cnt + 1;

    if (h_cnt == H_front_t - 1)
        hsync <= 0;
    else if (h_cnt == H_front_t + H_sync_t - 1) begin
        hsync <= 1;

        if (v_cnt == V_total_t - 1)
            v_cnt <= 0;
        else
            v_cnt <= v_cnt + 1;

        if (v_cnt == V_front_t - 1)
            vsync <= 0;
        else if (v_cnt == V_front_t + V_sync_t - 1)
            vsync <= 1;
    end
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module vga_sync(
    input clk, //25.175 MHz

    output reg hsync,
    output reg vsync,
    output [9:0]xpos,
    output [9:0]ypos
);

parameter H_front_t = 16;
parameter H_sync_t = 96;
parameter H_back_t = 48;
parameter H_active_t = 640;
parameter H_blank_t = H_front_t + H_sync_t + H_back_t;
parameter H_total_t = H_blank_t + H_active_t;

parameter V_front_t = 10;
parameter V_sync_t = 2;
parameter V_back_t = 33;
parameter V_active_t = 480;
parameter V_blank_t = V_front_t + V_sync_t + V_back_t;
parameter V_total_t = V_blank_t + V_active_t;

reg [9:0]h_cnt = 10'h3FF;
reg [9:0]v_cnt = 10'h3FF;

initial hsync = 1;
initial vsync = 1;

assign xpos = h_cnt - H_blank_t;
assign ypos = v_cnt - V_blank_t;

always @(posedge clk) begin
    if (h_cnt == H_total_t - 1)
        h_cnt <= 0;
    else
        h_cnt <= h_cnt + 1;

    if (h_cnt == H_front_t - 1)
        hsync <= 0;
    else if (h_cnt == H_front_t + H_sync_t - 1) begin
        hsync <= 1;

        if (v_cnt == V_total_t - 1)
            v_cnt <= 0;
        else
            v_cnt <= v_cnt + 1;

        if (v_cnt == V_front_t - 1)
            vsync <= 0;
        else if (v_cnt == V_front_t + V_sync_t - 1)
            vsync <= 1;
    end
end

endmodule
