// This program was cloned from: https://github.com/uXeBoy/VGA1306
// License: GNU General Public License v3.0

//partially based on the VGA demo code at http://github.com/OLIMEX/iCE40HX1K-EVB

`default_nettype none //disable implicit definitions by Verilog

module top( //top module and signals wired to FPGA pins
    CLK25MHz,
    vga_r,
    vga_g,
    vga_b,
    vga_hs,
    vga_vs,

    wclk,
    write_en,
    din,
    cs,
);

parameter addr_width = 13;
parameter data_width = 2;
reg [data_width-1:0] mem [(1<<addr_width)-1:0];

reg  [data_width-1:0] dout;
wire [addr_width-1:0] raddr;
reg  [addr_width-1:0] raddr_r = 0;
reg  [addr_width-1:0] raddr_temp = 0;
assign raddr = raddr_r;

input cs;
input wclk;
input write_en; // DC
input [data_width-1:0] din;
wire [addr_width-1:0] waddr;
reg  [addr_width-1:0] waddr_r = 0;
assign waddr = waddr_r;

always @(posedge wclk) // Write memory
begin
  if (cs == 0) begin // chip select
    if (write_en) begin
      mem[waddr] <= din; // Using write address bus
      waddr_r <= waddr_r + 1; // Increment address
    end
    else begin
      waddr_r <= 0; // 'VSYNC'
    end
  end
end

input               CLK25MHz;   // Oscillator input 25Mhz
output              vga_r;      // VGA Red 1 bit
output              vga_g;      // VGA Green 1 bit
output              vga_b;      // VGA Blue 1 bit
output              vga_hs;     // H-sync pulse
output              vga_vs;     // V-sync pulse

parameter h_pulse   = 96;   //H-SYNC pulse width 96 * 40 ns (25 Mhz) = 3.84 uS
parameter h_bp      = 48;   //H-BP back porch pulse width
parameter h_pixels  = 640;  //H-PIX Number of pixels horizontally
parameter h_fp      = 16;   //H-FP front porch pulse width
parameter h_pol     = 1'b0; //H-SYNC polarity
parameter h_frame   = 800;  //800 = 96 (H-SYNC) + 48 (H-BP) + 640 (H-PIX) + 16 (H-FP)
parameter v_pulse   = 2;    //V-SYNC pulse width
parameter v_bp      = 33;   //V-BP back porch pulse width
parameter v_pixels  = 480;  //V-PIX Number of pixels vertically
parameter v_fp      = 10;   //V-FP front porch pulse width
parameter v_pol     = 1'b1; //V-SYNC polarity
parameter v_frame   = 525;  //525 = 2 (V-SYNC) + 33 (V-BP) + 480 (V-PIX) + 10 (V-FP)

reg                 vga_r_r;  //VGA colour registers R,G,B x 1 bit
reg                 vga_g_r;
reg                 vga_b_r;
reg                 vga_hs_r; //H-SYNC register
reg                 vga_vs_r; //V-SYNC register

assign  vga_r       = vga_r_r; //assign the output signals for VGA to the VGA registers
assign  vga_g       = vga_g_r;
assign  vga_b       = vga_b_r;
assign  vga_hs      = vga_hs_r;
assign  vga_vs      = vga_vs_r;

reg     [7:0]       timer_t = 8'b0; //8-bit timer with 0 initialization
reg                 reset = 1;
reg     [9:0]       c_row;      //visible frame register row
reg     [9:0]       c_col;      //visible frame register column
reg     [9:0]       c_hor;      //complete frame register horizontally
reg     [9:0]       c_ver;      //complete frame register vertically
reg     [9:0]       scale_col;  //counter for scaling horizontally

reg                 disp_en; //display enable flag

always @ (posedge CLK25MHz) begin

begin
  dout <= mem[raddr]; // Read memory
end

    if(timer_t > 250) begin //generate 10 uS RESET signal
        reset <= 0;
    end
    else begin
        reset <= 1;              //while in reset display is disabled
        timer_t <= timer_t + 1;
        disp_en <= 0;
    end

    if(reset == 1) begin         //while RESET is high init counters
        c_hor <= 0;
        c_ver <= 0;
        vga_hs_r <= 1;
        vga_vs_r <= 0;
        c_row <= 0;
        c_col <= 0;
        scale_col <= 67;
    end
    else begin //update current beam position
        if(c_hor < h_frame - 1) begin
            c_hor <= c_hor + 1;
        end
        else begin
            c_hor <= 0;
            if(c_ver < v_frame - 1) begin
                c_ver <= c_ver + 1;
            end
            else begin
                c_ver <= 0;
            end
        end
    end
    if(c_hor < h_pixels + h_fp + 1 || c_hor > h_pixels + h_fp + h_pulse) begin //H-SYNC generator
        vga_hs_r <= ~h_pol;
    end
    else begin
        vga_hs_r <= h_pol;
    end
    if(c_ver < v_pixels + v_fp || c_ver > v_pixels + v_fp + v_pulse) begin     //V-SYNC generator
        vga_vs_r <= ~v_pol;
    end
    else begin
        vga_vs_r <= v_pol;
    end
    if(c_hor < h_pixels) begin //c_col and c_row counters are updated only in the visible time-frame
        c_col <= c_hor;
    end
    if(c_ver < v_pixels) begin
        c_row <= c_ver;
    end
    if(c_hor < h_pixels && c_ver < v_pixels) begin //VGA colour signals are enabled only in the visible time frame
        disp_en <= 1;
    end
    else begin
        disp_en <= 0;
    end
    if(disp_en == 1 && reset == 0) begin
        if(c_col > 64 && c_col < 577 && c_row > 111 && c_row < 368) begin //centered 512 x 256 area
            if(dout == 1) begin //check pixel buffer data
              vga_r_r <= 1;
              vga_g_r <= 1;
              vga_b_r <= 1;
            end
            else begin
              vga_r_r <= 0;
              vga_g_r <= 0;
              vga_b_r <= 0;
            end
            if(c_col == scale_col) begin
              scale_col <= scale_col + 4;
              //and increment pixel buffer address horizontally (+64)
              raddr_r <= raddr_r + 64;
            end
        end
        else begin //everything else is black
            vga_r_r <= 0;
            vga_g_r <= 0;
            vga_b_r <= 0;

            if(c_col == 62 && c_row > 111 && c_row < 368) begin //reset at the start of each line
              scale_col <= 67;
              //and set pixel buffer address back to beginning of line
              raddr_r <= raddr_temp;
            end

            if(c_col == 63 && c_row == 111) begin
              raddr_temp <= 7;
            end
            if(c_col == 63 && c_row == 115) begin
              raddr_temp <= 6;
            end
            if(c_col == 63 && c_row == 119) begin
              raddr_temp <= 5;
            end
            if(c_col == 63 && c_row == 123) begin
              raddr_temp <= 4;
            end
            if(c_col == 63 && c_row == 127) begin
              raddr_temp <= 3;
            end
            if(c_col == 63 && c_row == 131) begin
              raddr_temp <= 2;
            end
            if(c_col == 63 && c_row == 135) begin
              raddr_temp <= 1;
            end
            if(c_col == 63 && c_row == 139) begin
              raddr_temp <= 0;
            end

            if(c_col == 63 && c_row == 143) begin
              raddr_temp <= 15;
            end
            if(c_col == 63 && c_row == 147) begin
              raddr_temp <= 14;
            end
            if(c_col == 63 && c_row == 151) begin
              raddr_temp <= 13;
            end
            if(c_col == 63 && c_row == 155) begin
              raddr_temp <= 12;
            end
            if(c_col == 63 && c_row == 159) begin
              raddr_temp <= 11;
            end
            if(c_col == 63 && c_row == 163) begin
              raddr_temp <= 10;
            end
            if(c_col == 63 && c_row == 167) begin
              raddr_temp <= 9;
            end
            if(c_col == 63 && c_row == 171) begin
              raddr_temp <= 8;
            end

            if(c_col == 63 && c_row == 175) begin
              raddr_temp <= 23;
            end
            if(c_col == 63 && c_row == 179) begin
              raddr_temp <= 22;
            end
            if(c_col == 63 && c_row == 183) begin
              raddr_temp <= 21;
            end
            if(c_col == 63 && c_row == 187) begin
              raddr_temp <= 20;
            end
            if(c_col == 63 && c_row == 191) begin
              raddr_temp <= 19;
            end
            if(c_col == 63 && c_row == 195) begin
              raddr_temp <= 18;
            end
            if(c_col == 63 && c_row == 199) begin
              raddr_temp <= 17;
            end
            if(c_col == 63 && c_row == 203) begin
              raddr_temp <= 16;
            end

            if(c_col == 63 && c_row == 207) begin
              raddr_temp <= 31;
            end
            if(c_col == 63 && c_row == 211) begin
              raddr_temp <= 30;
            end
            if(c_col == 63 && c_row == 215) begin
              raddr_temp <= 29;
            end
            if(c_col == 63 && c_row == 219) begin
              raddr_temp <= 28;
            end
            if(c_col == 63 && c_row == 223) begin
              raddr_temp <= 27;
            end
            if(c_col == 63 && c_row == 227) begin
              raddr_temp <= 26;
            end
            if(c_col == 63 && c_row == 231) begin
              raddr_temp <= 25;
            end
            if(c_col == 63 && c_row == 235) begin
              raddr_temp <= 24;
            end

            if(c_col == 63 && c_row == 239) begin
              raddr_temp <= 39;
            end
            if(c_col == 63 && c_row == 243) begin
              raddr_temp <= 38;
            end
            if(c_col == 63 && c_row == 247) begin
              raddr_temp <= 37;
            end
            if(c_col == 63 && c_row == 251) begin
              raddr_temp <= 36;
            end
            if(c_col == 63 && c_row == 255) begin
              raddr_temp <= 35;
            end
            if(c_col == 63 && c_row == 259) begin
              raddr_temp <= 34;
            end
            if(c_col == 63 && c_row == 263) begin
              raddr_temp <= 33;
            end
            if(c_col == 63 && c_row == 267) begin
              raddr_temp <= 32;
            end

            if(c_col == 63 && c_row == 271) begin
              raddr_temp <= 47;
            end
            if(c_col == 63 && c_row == 275) begin
              raddr_temp <= 46;
            end
            if(c_col == 63 && c_row == 279) begin
              raddr_temp <= 45;
            end
            if(c_col == 63 && c_row == 283) begin
              raddr_temp <= 44;
            end
            if(c_col == 63 && c_row == 287) begin
              raddr_temp <= 43;
            end
            if(c_col == 63 && c_row == 291) begin
              raddr_temp <= 42;
            end
            if(c_col == 63 && c_row == 295) begin
              raddr_temp <= 41;
            end
            if(c_col == 63 && c_row == 299) begin
              raddr_temp <= 40;
            end

            if(c_col == 63 && c_row == 303) begin
              raddr_temp <= 55;
            end
            if(c_col == 63 && c_row == 307) begin
              raddr_temp <= 54;
            end
            if(c_col == 63 && c_row == 311) begin
              raddr_temp <= 53;
            end
            if(c_col == 63 && c_row == 315) begin
              raddr_temp <= 52;
            end
            if(c_col == 63 && c_row == 319) begin
              raddr_temp <= 51;
            end
            if(c_col == 63 && c_row == 323) begin
              raddr_temp <= 50;
            end
            if(c_col == 63 && c_row == 327) begin
              raddr_temp <= 49;
            end
            if(c_col == 63 && c_row == 331) begin
              raddr_temp <= 48;
            end

            if(c_col == 63 && c_row == 335) begin
              raddr_temp <= 63;
            end
            if(c_col == 63 && c_row == 339) begin
              raddr_temp <= 62;
            end
            if(c_col == 63 && c_row == 343) begin
              raddr_temp <= 61;
            end
            if(c_col == 63 && c_row == 347) begin
              raddr_temp <= 60;
            end
            if(c_col == 63 && c_row == 351) begin
              raddr_temp <= 59;
            end
            if(c_col == 63 && c_row == 355) begin
              raddr_temp <= 58;
            end
            if(c_col == 63 && c_row == 359) begin
              raddr_temp <= 57;
            end
            if(c_col == 63 && c_row == 363) begin
              raddr_temp <= 56;
            end

        end
    end
    else begin //when display is not enabled everything is black
        vga_r_r <= 0;
        vga_g_r <= 0;
        vga_b_r <= 0;
    end

end

endmodule