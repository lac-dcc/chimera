// Listing 13.7
module bitmap_gen
   (
    input wire clk, reset,
    input wire video_on,
    input [1:0] btn,
    input [2:0] sw,
    input wire [9:0] pix_x, pix_y,
    output reg [2:0] bit_rgb
   );

   // constant and signal declaration
   wire refr_tick, load_tick;
   //--------------------------------------------
   // video sram
   //--------------------------------------------
   wire we;
   wire [13:0] addr_r, addr_w;
   wire [2:0] din, dout;
   //--------------------------------------------
   // dot location and velocity
   //--------------------------------------------
   localparam MAX_X = 128;
   localparam MAX_Y = 128;
   // dot velocity can be pos or neg
   localparam DOT_V_P = 1;
   localparam DOT_V_N = -1;
   // reg to keep track of dot location
   reg [6:0] dot_x_reg, dot_y_reg;
   wire [6:0] dot_x_next, dot_y_next;
   // reg to keep track of dot velocity
   reg [6:0] v_x_reg, v_y_reg;
   wire [6:0] v_x_next, v_y_next;
   //--------------------------------------------
   // object output signals
   //--------------------------------------------
   wire bitmap_on;
   wire [2:0] bitmap_rgb;

   // body
   // instantiate debounce circuit for a button
   debounce deb_unit
      (.clk(clk), .reset(reset), .sw(btn[0]),
       .db_level(), .db_tick(load_tick));
   // instantiate dual-port video RAM (2^12-by-7)
   xilinx_dual_port_ram_sync
      #(.ADDR_WIDTH(14), .DATA_WIDTH(3)) video_ram
      (.clk(clk), .we(we), .addr_a(addr_w), .addr_b(addr_r),
       .din_a(din), .dout_a(), .dout_b(dout));
   // video ram interface
   assign addr_w = {dot_y_reg, dot_x_reg};
   assign addr_r = {pix_y[6:0], pix_x[6:0]};
   assign we = 1'b1;
   assign din = sw;
   assign bitmap_rgb = dout;
   // registers
   always @(posedge clk, posedge reset)
      if (reset)
         begin
            dot_x_reg <= 0;
            dot_y_reg <= 0;
            v_x_reg <= DOT_V_P;
            v_y_reg <= DOT_V_P;
         end
      else
         begin
            dot_x_reg <= dot_x_next;
            dot_y_reg <= dot_y_next;
            v_x_reg <= v_x_next;
            v_y_reg <= v_y_next;
         end

   // refr_tick: 1-clock tick asserted at start of v-sync
   assign refr_tick = (pix_y==481) && (pix_x==0);

   // pixel within bit map area
   assign bitmap_on =(pix_x<=127) & (pix_y<=127);
   // dot position
   // "randomly" load dot location when btn[0] pressed
   assign dot_x_next = (load_tick) ? pix_x[6:0] :
                       (refr_tick) ? dot_x_reg + v_x_reg :
                       dot_x_reg ;
   assign dot_y_next = (load_tick) ? pix_y[6:0] :
                       (refr_tick) ? dot_y_reg + v_y_reg :
                       dot_y_reg ;
   // dot x velocity
   assign v_x_next =
        (dot_x_reg==1) ? DOT_V_P :         // reach left
        (dot_x_reg==(MAX_X-2)) ? DOT_V_N : // reach right
         v_x_reg;
   // dot y velocity
   assign v_y_next =
        (dot_y_reg==1) ? DOT_V_P :         // reach top
        (dot_y_reg==(MAX_Y-2)) ? DOT_V_N : // reach bottom
         v_y_reg;
   //--------------------------------------------
   // rgb multiplexing circuit
   //--------------------------------------------
   always @*
      if (~video_on)
         bit_rgb = 3'b000; // blank
      else
         if (bitmap_on)
            bit_rgb = bitmap_rgb;
         else
            bit_rgb = 3'b110; // yellow background

endmodule
