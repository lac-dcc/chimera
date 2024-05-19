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

parameter addr_width = 15;
parameter data_width = 2;
reg [data_width-1:0] mem [(1<<addr_width)-1:0];

reg  [data_width-1:0] dout;
wire [addr_width-1:0] raddr;
reg  [addr_width-1:0] raddr_r = 0;
assign raddr = raddr_r;

input cs; // (not used)
input wclk;
input write_en;
reg   write_en_r;
input [data_width-1:0] din;
wire [addr_width-1:0] waddr;
reg  [addr_width-1:0] waddr_r = 0;
assign waddr = waddr_r;

always @(negedge wclk) // Write memory
begin
  if(write_en == 0 && write_en_r == 1) begin // VSYNC
    mem[0] <= din;
    waddr_r <= 1;
    write_en_r <= 0;
  end
  else begin
    mem[waddr] <= din;
    waddr_r <= waddr_r + 1; // Increment address
    if(write_en == 1) begin
      write_en_r <= 1;
    end
  end
end

input               CLK25MHz;   // Oscillator input 25MHz
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

reg     [7:0]       timer_t = 8'b0; //8-bit timer with 0 initialisation
reg                 reset = 1;
reg     [9:0]       c_row;      //visible frame register row
reg     [9:0]       c_col;      //visible frame register column
reg     [9:0]       c_hor;      //complete frame register horizontally
reg     [9:0]       c_ver;      //complete frame register vertically
reg     [9:0]       scale_col;  //counter for scaling horizontally
reg     [9:0]       scale_row;  //counter for scaling vertically

reg                 disp_en; //display enable flag

always @ (posedge CLK25MHz) begin

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
        scale_col <= 82;
        scale_row <= 27;
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

        dout <= mem[raddr]; // Read memory

        if(c_row == 0 && c_col == 0) begin //reset scaling
              scale_col <= 82;
              scale_row <= 27;
        end

        if(c_row == 23 && c_col == 639) begin //reset address
              raddr_r <= 0;
        end

        if(c_col == 0 && c_row > 21 && c_row < 453) begin //reset at the start of each line
              scale_col <= 82;
              if(c_row == scale_row) begin
                scale_row <= scale_row + 3;
              end
              else if(raddr_r != 0) begin
                //set pixel buffer address back to beginning of line
                raddr_r <= raddr_r - 160;
              end
        end

        if(c_col > 80 && c_col < 561 && c_row > 20 && c_row < 453) begin //centered 480 x 432 area

            if(c_col == scale_col && c_col < 560) begin
              scale_col <= scale_col + 3;
              //increment pixel buffer address horizontally
              raddr_r <= raddr_r + 1;
            end

            if(dout == 3) begin //check pixel buffer data
              vga_r_r <= 0;
              vga_g_r <= 0;
              vga_b_r <= 1; // BLUE
            end
            else if(dout == 2) begin
              vga_r_r <= 0;
              vga_g_r <= 1; // GREEN
              vga_b_r <= 0;
            end
            else if(dout == 1) begin
              vga_r_r <= 0;
              vga_g_r <= 1; //  GREEN
              vga_b_r <= 1; // + BLUE = CYAN
            end
            else begin
              vga_r_r <= 0; // BLACK
              vga_g_r <= 0;
              vga_b_r <= 0;
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