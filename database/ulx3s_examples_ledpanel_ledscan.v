// File ledscan.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 2001

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002-2017 Larry Doolittle
//     http://doolittle.icarus.com/~larry/vhd2vl/
//   Modifications (C) 2017 Rodrigo A. Melo
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

// (c)EMARD
// LICENSE=BSD
// for some info, see here
// http://www.benadorassociates.com/pz64f6ad8-cz57da853-64-x-64-pixels-p2-5-p3-p4-indoor-full-color-led-display-module-without-using-the-ribbon-cable.html
// driving sequence
// addrx -2: blank <= 1, addry <= addry + 1
// addrx -1: blank <= 0, if addry == 0 then bcm_counter <= bcm_counter + 1
// addrx 0-63: display bits
// addrx 62: latch <= 1
// addrx 63: latch <= 0
// during addrx = 0-63:
// convert addrx and addry with combinatorial logic to calculate RGB0 and RGB1
// RGB0 is pixel in upper half, RGB1 is pixel in lower half (32 pixels below)
// display clock is the same as clk
// if 8-bit color intensity > reversed bits of bcm_counter then LED=ON else LED=OFF
// when all 64x64 LEDs are illuminated (WHITE)
// then from 4V supply it draws 3.3A
// Each LED can be either ON or OFF,
// to display 24-bit color, LEDs need to be somehow
// flickered as fast as possible
// simple PWM will do visible flickering so we use
// a sort of BCM (binary coded modulation)
// using reverse bits of the frame counter
// Depending on intensity level, BCM will flicker
// in 1-6 kHz range, too fast to be visible.
// no timescale needed

module ledscan(
input wire clk,
input wire [C_bpc - 1:0] r0,
input wire [C_bpc - 1:0] g0,
input wire [C_bpc - 1:0] b0,
input wire [C_bpc - 1:0] r1,
input wire [C_bpc - 1:0] g1,
input wire [C_bpc - 1:0] b1,
output wire [2:0] rgb0,
output wire [2:0] rgb1,
output wire [C_bits_x:0] addrx,
output wire [C_bits_y - 2:0] addry,
output wire latch,
output wire blank
);

parameter [31:0] C_bpc=8;
parameter [31:0] C_bits_x=7;
parameter [31:0] C_bits_y=6;
// 2^n LEDs is actual panel height
// any clock, usually 25 MHz
// r0: red upper half, g1: green lower half (32 pixels below)
// RGB pixel inputs 0-upper and 1-lower half
// pixel outputs, antiflickered
// rgb0: upper half, rgb1: lower half
// X counter out (high bit set means H-blank, content not displayed)
// combinatorial logic from addrx and addry should generate RGB0 (upper half) and RGB1 (lower half)
// x addry it has 1 bit more
// following signals output to LED Panel
// y addry 0-31, 1 bit less
// latch: short pulse '1' transfers data from shift register
// to row drivers and illuminates LED rows addry+0 and addry+32 
// blank: short pulse '1' turns off illuminated row and
// allows switching to the next row of data.



// Internal X/Y counters
reg [C_bits_x:0] R_addrx;  // one bit more to have small H-blank area
reg [C_bits_y - 2:0] R_addry;  // one bit less, iterates over half of display
reg R_latch; reg R_blank;  // signal R_random: std_logic_vector(30 downto 0) := (others => '1'); -- 31-bit random (not used)
reg [C_bpc - 1:0] R_bcm_counter;  // frame counter for BCM
wire [C_bpc - 1:0] S_compare_val;  // output modulation comapersion value
parameter C_2pixels_b4_1st_x_pixel =  -2;  // -2
parameter C_1pixel_b4_1st_x_pixel =  -1;  // -1
parameter C_last_x_pixel = 2 ** C_bits_x - 1;  // 2**C_bits_x-1
parameter C_1pixel_b4_last_x_pixel = 2 ** C_bits_x - 2;  // 2**C_bits_x-2

  assign addrx = R_addrx;
  assign addry = R_addry;
  assign latch = R_latch;
  assign blank = R_blank;
  // main process that always runs
  always @(posedge clk) begin
    if(R_addrx == C_last_x_pixel) begin
      R_addrx <= C_2pixels_b4_1st_x_pixel;
    end
    else begin
      R_addrx <= R_addrx + 1;
      // x counter always runs
    end
    case(R_addrx)
    C_2pixels_b4_1st_x_pixel : begin
      // -2
      R_blank <= 1'b1;
      R_addry <= R_addry + 1;
      // increment during blank=1
    end
    C_1pixel_b4_1st_x_pixel : begin
      // -1
      R_blank <= 1'b0;
      if((R_addry) == 0) begin
        R_bcm_counter <= R_bcm_counter + 1;
      end
    end
    C_1pixel_b4_last_x_pixel : begin
      // 62
      R_latch <= 1'b1;
      // send latch 1-clock early
    end
    C_last_x_pixel : begin
      // 63
      R_latch <= 1'b0;
      // remove latch
    end
    default : begin
    end
    endcase
  end

  // simple pseudo random number generator, see
  // https://electronics.stackexchange.com/questions/30521/random-bit-sequence-using-verilog
  // https://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
  //process(clk)
  //begin
  //  if rising_edge(clk) then
  //    R_random(30 downto 0) <= R_random(29 downto 0) & (R_random(30) xor R_random(27));
  //  end if;
  //end process;
  //S_compare_val <= R_random(C_bpc-1 downto 0);
  // using RND panel won't flicker as whole, but pixels will have visible noise
  // https://www.sparkfun.com/sparkx/blog/2650
  // BCM (binary code modulation) output compare against reversed bits
  // this works best
  genvar i;
  generate for (i=0; i <= C_bpc - 1; i = i + 1) begin: F_reverse_bits
      assign S_compare_val[i] = R_bcm_counter[C_bpc - 1 - i];
  end
  endgenerate
  //S_compare_val <= R_bcm_counter; -- trust me, this will flicker :)
  // antiflickered modulated outputs generated by arithmetic comparison against S_compare_val
  assign rgb0[0] = (S_compare_val) < (r0) ? 1'b1 : 1'b0;
  assign rgb0[1] = (S_compare_val) < (g0) ? 1'b1 : 1'b0;
  assign rgb0[2] = (S_compare_val) < (b0) ? 1'b1 : 1'b0;
  assign rgb1[0] = (S_compare_val) < (r1) ? 1'b1 : 1'b0;
  assign rgb1[1] = (S_compare_val) < (g1) ? 1'b1 : 1'b0;
  assign rgb1[2] = (S_compare_val) < (b1) ? 1'b1 : 1'b0;

endmodule
