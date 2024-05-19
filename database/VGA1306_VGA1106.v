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

reg        invert;
reg  [2:0] shiftCount;
reg  [7:0] shiftReg;
wire [7:0] shiftLeft = {shiftReg[6:0], din[0]};

always @(posedge wclk) // Write memory
begin
  if (cs == 1'b0) begin // chip select
    if (write_en) begin
      mem[waddr] <= din; // Using write address bus
      waddr_r <= waddr_r + 1'b1; // Increment address
    end
    else begin
      if (shiftCount == 3'b111) begin
        if(shiftLeft[7:1] == 'b1010011) invert <= shiftLeft[0]; // invert (A6/A7)
        if(shiftLeft[7:3] == 'b10110) waddr_r <= {shiftLeft[2:0], 10'd0}; // page 0-7 (B0-B7)
      end
      else shiftReg <= shiftLeft;
      shiftCount <= shiftCount + 1'b1;
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

always @ (posedge CLK25MHz)
begin
    dout <= mem[raddr]; // Read memory

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
        scale_col <= 3;
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

        if(c_col == 0 && c_row == 0) begin //pixel buffer address 0
          raddr_r <= 7;
          raddr_temp <= 7;
        end

        if(c_row > 80 && c_row < 401) begin
            if(dout == 1) begin //check pixel buffer data
              if(invert) begin
                vga_r_r <= 0;
                vga_g_r <= 0;
                vga_b_r <= 0;
              end
              else begin
                vga_r_r <= 1;
                vga_g_r <= 1;
                vga_b_r <= 1;
              end
            end
            else begin
              if(invert) begin
                vga_r_r <= 1;
                vga_g_r <= 1;
                vga_b_r <= 1;
              end
              else begin
                vga_r_r <= 0;
                vga_g_r <= 0;
                vga_b_r <= 0;
              end
            end

            if(c_col == scale_col) begin
              scale_col <= scale_col + 5;
              //and increment pixel buffer address horizontally (+8)
              raddr_r <= raddr_r + 8;
            end

            if(c_col == 639) begin //reset before the start of each line
              scale_col <= 3;
              //and set pixel buffer address back to beginning of line
              raddr_r <= raddr_temp;
            end

            if(c_col == 639 && c_row == 84) begin
              raddr_temp <= 6;
            end
            if(c_col == 639 && c_row == 89) begin
              raddr_temp <= 5;
            end
            if(c_col == 639 && c_row == 94) begin
              raddr_temp <= 4;
            end
            if(c_col == 639 && c_row == 99) begin
              raddr_temp <= 3;
            end
            if(c_col == 639 && c_row == 104) begin
              raddr_temp <= 2;
            end
            if(c_col == 639 && c_row == 109) begin
              raddr_temp <= 1;
            end
            if(c_col == 639 && c_row == 114) begin
              raddr_temp <= 0;
            end

            if(c_col == 639 && c_row == 119) begin
              raddr_temp <= 1031;
            end
            if(c_col == 639 && c_row == 124) begin
              raddr_temp <= 1030;
            end
            if(c_col == 639 && c_row == 129) begin
              raddr_temp <= 1029;
            end
            if(c_col == 639 && c_row == 134) begin
              raddr_temp <= 1028;
            end
            if(c_col == 639 && c_row == 139) begin
              raddr_temp <= 1027;
            end
            if(c_col == 639 && c_row == 144) begin
              raddr_temp <= 1026;
            end
            if(c_col == 639 && c_row == 149) begin
              raddr_temp <= 1025;
            end
            if(c_col == 639 && c_row == 154) begin
              raddr_temp <= 1024;
            end

            if(c_col == 639 && c_row == 159) begin
              raddr_temp <= 2055;
            end
            if(c_col == 639 && c_row == 164) begin
              raddr_temp <= 2054;
            end
            if(c_col == 639 && c_row == 169) begin
              raddr_temp <= 2053;
            end
            if(c_col == 639 && c_row == 174) begin
              raddr_temp <= 2052;
            end
            if(c_col == 639 && c_row == 179) begin
              raddr_temp <= 2051;
            end
            if(c_col == 639 && c_row == 184) begin
              raddr_temp <= 2050;
            end
            if(c_col == 639 && c_row == 189) begin
              raddr_temp <= 2049;
            end
            if(c_col == 639 && c_row == 194) begin
              raddr_temp <= 2048;
            end

            if(c_col == 639 && c_row == 199) begin
              raddr_temp <= 3079;
            end
            if(c_col == 639 && c_row == 204) begin
              raddr_temp <= 3078;
            end
            if(c_col == 639 && c_row == 209) begin
              raddr_temp <= 3077;
            end
            if(c_col == 639 && c_row == 214) begin
              raddr_temp <= 3076;
            end
            if(c_col == 639 && c_row == 219) begin
              raddr_temp <= 3075;
            end
            if(c_col == 639 && c_row == 224) begin
              raddr_temp <= 3074;
            end
            if(c_col == 639 && c_row == 229) begin
              raddr_temp <= 3073;
            end
            if(c_col == 639 && c_row == 234) begin
              raddr_temp <= 3072;
            end

            if(c_col == 639 && c_row == 239) begin
              raddr_temp <= 4103;
            end
            if(c_col == 639 && c_row == 244) begin
              raddr_temp <= 4102;
            end
            if(c_col == 639 && c_row == 249) begin
              raddr_temp <= 4101;
            end
            if(c_col == 639 && c_row == 254) begin
              raddr_temp <= 4100;
            end
            if(c_col == 639 && c_row == 259) begin
              raddr_temp <= 4099;
            end
            if(c_col == 639 && c_row == 264) begin
              raddr_temp <= 4098;
            end
            if(c_col == 639 && c_row == 269) begin
              raddr_temp <= 4097;
            end
            if(c_col == 639 && c_row == 274) begin
              raddr_temp <= 4096;
            end

            if(c_col == 639 && c_row == 279) begin
              raddr_temp <= 5127;
            end
            if(c_col == 639 && c_row == 284) begin
              raddr_temp <= 5126;
            end
            if(c_col == 639 && c_row == 289) begin
              raddr_temp <= 5125;
            end
            if(c_col == 639 && c_row == 294) begin
              raddr_temp <= 5124;
            end
            if(c_col == 639 && c_row == 299) begin
              raddr_temp <= 5123;
            end
            if(c_col == 639 && c_row == 304) begin
              raddr_temp <= 5122;
            end
            if(c_col == 639 && c_row == 309) begin
              raddr_temp <= 5121;
            end
            if(c_col == 639 && c_row == 314) begin
              raddr_temp <= 5120;
            end

            if(c_col == 639 && c_row == 319) begin
              raddr_temp <= 6151;
            end
            if(c_col == 639 && c_row == 324) begin
              raddr_temp <= 6150;
            end
            if(c_col == 639 && c_row == 329) begin
              raddr_temp <= 6149;
            end
            if(c_col == 639 && c_row == 334) begin
              raddr_temp <= 6148;
            end
            if(c_col == 639 && c_row == 339) begin
              raddr_temp <= 6147;
            end
            if(c_col == 639 && c_row == 344) begin
              raddr_temp <= 6146;
            end
            if(c_col == 639 && c_row == 349) begin
              raddr_temp <= 6145;
            end
            if(c_col == 639 && c_row == 354) begin
              raddr_temp <= 6144;
            end

            if(c_col == 639 && c_row == 359) begin
              raddr_temp <= 7175;
            end
            if(c_col == 639 && c_row == 364) begin
              raddr_temp <= 7174;
            end
            if(c_col == 639 && c_row == 369) begin
              raddr_temp <= 7173;
            end
            if(c_col == 639 && c_row == 374) begin
              raddr_temp <= 7172;
            end
            if(c_col == 639 && c_row == 379) begin
              raddr_temp <= 7171;
            end
            if(c_col == 639 && c_row == 384) begin
              raddr_temp <= 7170;
            end
            if(c_col == 639 && c_row == 389) begin
              raddr_temp <= 7169;
            end
            if(c_col == 639 && c_row == 394) begin
              raddr_temp <= 7168;
            end

        end
        else begin //everything else is black
            vga_r_r <= 0;
            vga_g_r <= 0;
            vga_b_r <= 0;
        end
    end
    else begin //when display is not enabled everything is black
        vga_r_r <= 0;
        vga_g_r <= 0;
        vga_b_r <= 0;
    end

end

endmodule
