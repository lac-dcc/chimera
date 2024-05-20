// This program was cloned from: https://github.com/Fe1LDr/Grinch
// License: MIT License

module vga_controller #(
   parameter h_pixels   = 640    ,  // horizontal display
   parameter h_fp       = 16     ,  // horizontal Front Porch
   parameter h_pulse    = 96     ,  // horizontal sync pulse
   parameter h_bp       = 48     ,  // horizontal back porch
   parameter h_pol      = 1'b0   ,  // horizontal sync polarity (1 = positive, 0 = negative)
   parameter v_pixels   = 480    ,  // vertical display
   parameter v_fp       = 10     ,  // vertical front porch
   parameter v_pulse    = 2      ,  // vertical pulse
   parameter v_bp       = 33     ,  // vertical back porch
   parameter v_pol      = 1'b0      // vertical sync polarity (1 = positive, 0 = negative)
)( 
   input             pixel_clk   ,  // Pixel clock
   input             reset_n     ,  // Active low synchronous reset
   output reg        h_sync      ,  // horizontal sync signal
   output reg        v_sync      ,  // vertical sync signal
   output reg        disp_ena    ,  // display enable (0 = all colors must be blank)
   output reg [31:0] column      ,  // horizontal pixel coordinate
   output reg [31:0] row            // vertical pixel coordinate
);

   // Get total number of row and column pixel clocks
   localparam h_period = h_pulse + h_bp + h_pixels + h_fp;
   localparam v_period = v_pulse + v_bp + v_pixels + v_fp;

   // Full range counters
   reg [$clog2(h_period)-1:0] h_count;
   reg [$clog2(v_period)-1:0] v_count;

   always @( posedge pixel_clk ) begin
      // Perform reset operations if needed
      if (reset_n == 1'b0) begin
         h_count  <= 0;
         v_count  <= 0;
         h_sync   <= ~ h_pol;
         v_sync   <= ~ v_pol;
         disp_ena <= 1'b0;
         column   <= 0;
         row      <= 0;
      end else begin

         // Pixel Counters
         if (h_count < h_period - 1) begin
            h_count <= h_count + 1;
         end else begin
            h_count <= 0;
            if (v_count < v_period - 1) begin
               v_count <= v_count + 1;
            end else begin
               v_count <= 0;
            end
         end

         // Horizontal Sync Signal
         if ( (h_count < h_pixels + h_fp) || (h_count > h_pixels + h_fp + h_pulse) ) begin
            h_sync <= ~ h_pol;
         end else begin
            h_sync <= h_pol;
         end

         // Vertical Sync Signal
         if ( (v_count < v_pixels + v_fp) || (v_count > v_pixels + v_fp + v_pulse) ) begin
            v_sync <= ~ v_pol;
         end else begin
            v_sync <= v_pol;
         end

         // Update Pixel Coordinates
         if (h_count < h_pixels) begin
            column <= h_count;
         end

         if (v_count < v_pixels) begin
            row <= v_count;
         end

         // Set display enable output
         if (h_count < h_pixels && v_count < v_pixels) begin
            disp_ena <= 1'b1;
         end else begin
            disp_ena <= 1'b0;
         end
      end
   end

endmodule
