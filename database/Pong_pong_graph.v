// Listing 14.7
module pong_graph 
   (
    input wire clk, reset,
    input wire [1:0] btn1,
    input wire [1:0] btn2,
    input wire ai_switch,
    input wire [9:0] pix_x, pix_y,
    input wire gra_still,
    output wire graph_on,
    output reg hit, miss,
    output reg [2:0] graph_rgb
   );

   // costant and signal declaration
   // x, y coordinates (0,0) to (639,479)
   localparam MAX_X = 640;
   localparam MAX_Y = 480;
   wire refr_tick;
   //--------------------------------------------
   // vertical strip as a wall
   //--------------------------------------------
   // wall left, right boundary
   //localparam WALL_X_L = 32;
   //localparam WALL_X_R = 35;
   //--------------------------------------------
   // right vertical bar
   //--------------------------------------------
   // bar left, right boundary
   localparam BARR_X_L = 600;
   localparam BARR_X_R = 603;
   // bar top, bottom boundary
   wire [9:0] barr_y_t, barr_y_b;
   localparam BARR_Y_SIZE = 72;
   // register to track top boundary  (x position is fixed)
   reg [9:0] barr_y_reg, barr_y_next;
   // bar moving velocity when the button are pressed
   localparam BARR_V = 4;
   //--------------------------------------------
   // left vertical bar
   //--------------------------------------------
   // bar left, right boundary
   localparam BARL_X_L = 40;
   localparam BARL_X_R = 43;
   // bar top, bottom boundary
   wire [9:0] barl_y_t, barl_y_b;
   localparam BARL_Y_SIZE = 72;
   // register to track top boundary  (x position is fixed)
   reg [9:0] barl_y_reg, barl_y_next;
   // bar moving velocity when the button are pressed
   localparam BARL_V = 4;
   //--------------------------------------------
   // square ball
   //--------------------------------------------
   localparam BALL_SIZE = 8;
   // ball left, right boundary
   wire [9:0] ball_x_l, ball_x_r;
   // ball top, bottom boundary
   wire [9:0] ball_y_t, ball_y_b;
   // reg to track left, top position
   reg [9:0] ball_x_reg, ball_y_reg;
   wire [9:0] ball_x_next, ball_y_next;
   // reg to track ball speed
   reg [9:0] x_delta_reg, x_delta_next;
   reg [9:0] y_delta_reg, y_delta_next;
   // ball velocity can be pos or neg)
   localparam BALL_V_P = 2;
   localparam BALL_V_N = -2;
   //--------------------------------------------
   // round ball 
   //--------------------------------------------
   wire [2:0] rom_addr, rom_col;
   reg [7:0] rom_data;
   wire rom_bit;
   //--------------------------------------------
   // object output signals
   //--------------------------------------------
   wire wall_on, barr_on, barl_on, sq_ball_on, rd_ball_on;
   wire [2:0] wall_rgb, barr_rgb, barl_rgb, ball_rgb;
   //--------------------------------------------
   // AI variables
   //--------------------------------------------
   reg [9:0] ball_center;
   reg [9:0] paddlel_center;
   reg [9:0] paddler_center;
   //--------------------------------------------
   // Angle varibles
   //--------------------------------------------
   reg [9:0] hit_point;
   // body 
   //--------------------------------------------
   // round ball image ROM
   //--------------------------------------------
   always @*
   case (rom_addr)
      3'h0: rom_data = 8'b00111100; //   ****
      3'h1: rom_data = 8'b01111110; //  ******
      3'h2: rom_data = 8'b11111111; // ********
      3'h3: rom_data = 8'b11111111; // ********
      3'h4: rom_data = 8'b11111111; // ********
      3'h5: rom_data = 8'b11111111; // ********
      3'h6: rom_data = 8'b01111110; //  ******
      3'h7: rom_data = 8'b00111100; //   ****
   endcase
   
   // registers
   always @(posedge clk, posedge reset)
      if (reset)
         begin
            barr_y_reg <= 0;
            barl_y_reg <= 0;
            ball_x_reg <= 0;
            ball_y_reg <= 0;
            x_delta_reg <= 10'h004;
            y_delta_reg <= 10'h004;
         end   
      else
         begin
            barr_y_reg <= barr_y_next;
            barl_y_reg <= barl_y_next;
            ball_x_reg <= ball_x_next;
            ball_y_reg <= ball_y_next;
            x_delta_reg <= x_delta_next;
            y_delta_reg <= y_delta_next;
         end   

   // refr_tick: 1-clock tick asserted at start of v-sync
   //       i.e., when the screen is refreshed (60 Hz)
   assign refr_tick = (pix_y==481) && (pix_x==0);
   
   // //--------------------------------------------
   // // (wall) left vertical strip
   // //--------------------------------------------
   // // pixel within wall
   // assign wall_on = (WALL_X_L<=pix_x) && (pix_x<=WALL_X_R);
   // // wall rgb output
   // assign wall_rgb = 3'b001; // blue

   //--------------------------------------------
   // right vertical bar
   //--------------------------------------------
   // boundary
   assign barr_y_t = barr_y_reg;
   assign barr_y_b = barr_y_t + BARR_Y_SIZE - 1;
   // pixel within bar
   assign barr_on = (BARR_X_L<=pix_x) && (pix_x<=BARR_X_R) &&
                   (barr_y_t<=pix_y) && (pix_y<=barr_y_b); 
   // bar rgb output
   assign barr_rgb = 3'b010; // green
   // new bar y-position
   always @*
   begin
      barr_y_next = barr_y_reg; // no move
      if (gra_still) // initial position of paddle
         barr_y_next = (MAX_Y-BARR_Y_SIZE)/2;
      else if (refr_tick)
         if (btn1[1] & (barr_y_b < (MAX_Y-1-BARR_V)))
            barr_y_next = barr_y_reg + BARR_V; // move down
         else if (btn1[0] & (barr_y_t > BARR_V)) 
            barr_y_next = barr_y_reg - BARR_V; // move up
   end  
   
   // //--------------------------------------------
   // // left vertical bar (HUMAN)
   // //--------------------------------------------
   // // boundary
   // assign barl_y_t = barl_y_reg;
   // assign barl_y_b = barl_y_t + BARL_Y_SIZE - 1;
   // // pixel within bar
   // assign barl_on = (BARL_X_L<=pix_x) && (pix_x<=BARL_X_R) &&
   //                 (barl_y_t<=pix_y) && (pix_y<=barl_y_b); 
   // // bar rgb output
   // assign barl_rgb = 3'b101; // purple
   // // new bar y-position
   // always @*
   // begin
   //    barl_y_next = barl_y_reg; // no move
   //    if (gra_still) // initial position of paddle
   //       barl_y_next = (MAX_Y-BARL_Y_SIZE)/2;
   //    else if (refr_tick)
   //       if (btn2[1] & (barl_y_b < (MAX_Y-1-BARL_V)))
   //          barl_y_next = barl_y_reg + BARL_V; // move down
   //       else if (btn2[0] & (barl_y_t > BARL_V)) 
   //          barl_y_next = barl_y_reg - BARL_V; // move up
   // end
   
   //--------------------------------------------
   // left vertical bar (AI/HUMAN)
   //--------------------------------------------
   // boundary
   assign barl_y_t = barl_y_reg;
   assign barl_y_b = barl_y_t + BARL_Y_SIZE - 1;
   // pixel within bar
   assign barl_on = (BARL_X_L<=pix_x) && (pix_x<=BARL_X_R) &&
                   (barl_y_t<=pix_y) && (pix_y<=barl_y_b); 
   // bar rgb output
   assign barl_rgb = 3'b101; // purple
   // new bar y-position
   always @*
   begin
      if (ai_switch)
         begin
            if (ball_x_l < 2*(MAX_X / 3) && refr_tick)
               begin
                  ball_center = ball_y_t + ((ball_y_b - ball_y_t) / 2);
                  paddlel_center = barl_y_t + ((barl_y_b - barl_y_t) / 2);
                  if (ball_center < paddlel_center)
                     begin
                        barl_y_next = barl_y_reg - 3; // move up
                        if (barl_y_next <= 5)
                           barl_y_next = 5;
                     end
                  else if (ball_center > paddlel_center)
                     begin
                        barl_y_next = barl_y_reg + 3; // move down
                        if (barl_y_next + BARL_Y_SIZE >= MAX_Y)
                           barl_y_next = MAX_Y - BARL_Y_SIZE;
                     end
                  else
                     barl_y_next = barl_y_reg; // no move
               end
            else
               barl_y_next = barl_y_reg; // no move
         end
      else
         begin
            barl_y_next = barl_y_reg; // no move
            if (gra_still) // initial position of paddle
               barl_y_next = (MAX_Y-BARL_Y_SIZE)/2;
            else if (refr_tick)
               if (btn2[1] && (barl_y_b < (MAX_Y-1-BARL_V)))
                  barl_y_next = barl_y_reg + BARL_V; // move down
               else if (btn2[0] && (barl_y_t > BARL_V)) 
                  barl_y_next = barl_y_reg - BARL_V; // move up
         end
   end
   
   //--------------------------------------------
   // square ball
   //--------------------------------------------
   // boundary
   assign ball_x_l = ball_x_reg;
   assign ball_y_t = ball_y_reg;
   assign ball_x_r = ball_x_l + BALL_SIZE - 1;
   assign ball_y_b = ball_y_t + BALL_SIZE - 1;
   // pixel within ball
   assign sq_ball_on =
            (ball_x_l<=pix_x) && (pix_x<=ball_x_r) &&
            (ball_y_t<=pix_y) && (pix_y<=ball_y_b);
   // map current pixel location to ROM addr/col
   assign rom_addr = pix_y[2:0] - ball_y_t[2:0];
   assign rom_col = pix_x[2:0] - ball_x_l[2:0];
   assign rom_bit = rom_data[rom_col];
   // pixel within ball
   assign rd_ball_on = sq_ball_on & rom_bit;
   // ball rgb output
   assign ball_rgb = 3'b100;   // black
  
   // new ball position
   assign ball_x_next = (gra_still) ? MAX_X/2 :
                        (refr_tick) ? ball_x_reg+x_delta_reg :
                        ball_x_reg ;
   assign ball_y_next = (gra_still) ? MAX_Y/2 :
                        (refr_tick) ? ball_y_reg+y_delta_reg :
                        ball_y_reg ;
   // new ball velocity
   always @*   
   begin
      hit = 1'b0;
      miss = 1'b0;
      x_delta_next = x_delta_reg;
      y_delta_next = y_delta_reg;
      
      ball_center = ball_y_t + ((ball_y_b - ball_y_t) / 2);
      
      if (gra_still)     // initial velocity
         begin
            x_delta_next = BALL_V_N;
            y_delta_next = BALL_V_P;
         end   
      else if (ball_y_t <= 1) // reach top
         y_delta_next = BALL_V_P;
      else if (ball_y_b >= (MAX_Y-1)) // reach bottom
         y_delta_next = BALL_V_N;
      else if ((BARR_X_L<=ball_x_r) && (ball_x_r<=BARR_X_R) &&
               (barr_y_t<=ball_y_b) && (ball_y_t<=barr_y_b))
         begin
            // reach x of right bar and hit, ball bounce back
            //x_delta_next = BALL_V_N;
            hit_point = ball_center - barr_y_t;
            if (hit_point < (BARR_Y_SIZE / 5))
               x_delta_next = -4;
            else if (hit_point < 2*(BARR_Y_SIZE / 5))
               x_delta_next = -3;
            else if (hit_point < 3*(BARR_Y_SIZE / 5))
               x_delta_next = -2;
            else if (hit_point < 4*(BARR_Y_SIZE / 5))
               x_delta_next = -3;
            else
               x_delta_next = -4;
               
            if (ai_switch)
               hit = 1'b0;
            else
               hit = 1'b1;
         end
      else if ((BARL_X_L<=ball_x_l) && (ball_x_l<=BARL_X_R) &&
               (barl_y_t<=ball_y_b) && (ball_y_t<=barl_y_b))
         begin
            // reach x of left bar and hit, ball bounce back
            //x_delta_next = BALL_V_P;
            hit_point = ball_center - barr_y_t;
            if (hit_point < (BARR_Y_SIZE / 5))
               x_delta_next = 4;
            else if (hit_point < 2*(BARR_Y_SIZE / 5))
               x_delta_next = 3;
            else if (hit_point < 3*(BARR_Y_SIZE / 5))
               x_delta_next = 2;
            else if (hit_point < 4*(BARR_Y_SIZE / 5))
               x_delta_next = 3;
            else
               x_delta_next = 4;
               
            if (ai_switch)
               hit = 1'b0;
            else
               hit = 1'b1;
         end
      else if (ball_x_r >= MAX_X - 10)   // reach right border
         miss = 1'b1;            // a miss
      else if (ball_x_r <= 10)   // reach left border
         begin
            if (ai_switch)
               hit = 1'b1;
            else
               miss = 1'b1;
         end
   end 

   //--------------------------------------------
   // rgb multiplexing circuit
   //--------------------------------------------
   always @* 
      if (wall_on)
         graph_rgb = wall_rgb;
      else if (barr_on)
         graph_rgb = barr_rgb;
      else if (barl_on)
         graph_rgb = barl_rgb;
      else if (rd_ball_on)
         graph_rgb = ball_rgb;
      else
         graph_rgb = 3'b000; // black background
   // new graphic_on signal
   //assign graph_on = wall_on | barr_on | barl_on | rd_ball_on;
   assign graph_on =  barr_on | barl_on | rd_ball_on;

endmodule 
