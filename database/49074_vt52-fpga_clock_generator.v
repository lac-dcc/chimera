// This program was cloned from: https://github.com/AndresNavarro82/vt52-fpga
// License: GNU General Public License v3.0

module clock_generator
  (input  clk,
   output clk_usb,
   output reset_usb,
   output clk_vga,
   output reset_vga
   );

   wire locked;
   reg vga_clk_divider;

   pll pll(.clock_in(clk),
           .clock_out(clk_usb),
           .locked(locked)
           );

   // Generate reset signal
   reg [5:0] reset_cnt = 0;
   assign reset_usb = ~reset_cnt[5];

   always @(posedge clk_usb)
     if (locked) reset_cnt <= reset_cnt + reset_usb;

   // divide usb clock by by two to get vga clock
   always @(posedge clk_usb) begin
      if (reset_usb) vga_clk_divider <= 0;
      else vga_clk_divider <= ~vga_clk_divider;
   end

   assign clk_vga = vga_clk_divider;
   assign reset_vga = reset_usb;
endmodule
