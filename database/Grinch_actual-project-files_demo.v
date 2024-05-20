// This program was cloned from: https://github.com/Fe1LDr/Grinch
// License: MIT License

module demo (
  //--------- Clock & Resets                     --------//
    input          btn_clk         ,  // Pixel clock 1MHz     
    input          vga_clk         ,  // VGA clock 25 MHz	 
    input          arst_n          ,  // Active low synchronous reset   
  //--------- JoyStick                           --------//
    input  [11:0]  joystick_data_x ,
    input  [11:0]  joystick_data_y ,
    input          js_button_a     ,
    input          js_button_b     ,
    input          js_button_c     ,
    input          js_button_d     ,
    input          js_button_f_d   ,
  //--------- Accelerometer                      --------//
    input  [15:0]  accel_data_x    ,
    input  [15:0]  accel_data_y    ,
  //--------- Pixcels Coordinates                --------//
    input  [9:0]   col             ,
    input  [8:0]   row             , 
  //--------- Data from memory with logo         --------//
    input  [15:0]  rom_data        ,
  //--------- VGA outputs                        --------//
    output [3:0]   red             ,  // 4-bit color output
    output [3:0]   green           ,  // 4-bit color output
    output [3:0]   blue            ,  // 4-bit color output
  //--------- Switches for background colour     --------//
    input  [2:0]   SW              ,
  //--------- Regime                             --------//
    output [1:0]   demo_regime_status    // Red led on the board which show REGIME
);
  
  //------------------------- Variables                    ----------------------------//
    //----------------------- Regime control               --------------------------// 
      wire         change_regime ;
      reg   [1:0]  regime_store  ;
    //----------------------- Coordinates regs             --------------------------//
      reg   [11:0] x_store_reg;
      reg   [11:0] y_store_reg;
      reg   [15:0] accel_x_store_reg;
      reg   [15:0] accel_y_store_reg;
    //----------------------- Counters                     --------------------------//
      reg   [18:0] accel_counter;
      reg   [20:0] regime_counter;
      wire         regime_overflow;
      wire         accel_overflow;
    //----------------------- Stick movement               --------------------------//
      parameter    stick_width  = 4; 
      parameter    stick_height = 10; 
      reg          stick_active;
      reg          indicator;
      reg  [9:0]   stick_border_hl_c;
      reg  [8:0]   stick_border_hl_r;
    //----------------------- Sber logo timer              --------------------------//
      reg [31:0]   sber_logo_counter; // 32 bit timer


  //------------------------- Coordinates regs             ----------------------------//
    always @ (posedge btn_clk) begin
      x_store_reg       <= joystick_data_x   ;
      y_store_reg       <= joystick_data_y   ;
      accel_x_store_reg <= accel_data_x ;
      accel_y_store_reg <= accel_data_y ;
    end

  //------------------------- Counters                     ----------------------------//
    always @ ( posedge btn_clk ) begin
      if (accel_counter == 19'd10000) 
        accel_counter <= 0; 
      else 
        accel_counter <= accel_counter + 1'b1;
    end
    //
    assign accel_overflow   = ( accel_counter  == 19'd10000   );

  //------------------------- Regime control               ----------------------------//
    always @ (posedge vga_clk or negedge arst_n) begin
    if ( !arst_n ) begin
      regime_store <= 2'b11;
    end
    else if ( change_regime && ( regime_store > 2'b00) ) begin
      regime_store <= regime_store - 1'b1;
    end
    else if (regime_store == 2'b00) 
      regime_store <= 2'b11;
    end
    assign change_regime      = js_button_f_d;
    assign demo_regime_status = regime_store;

  //------------------------- Stick movement in 3 regimes  ----------------------------//
    always @ (posedge btn_clk or negedge arst_n) begin
      if ( !arst_n ) begin
        stick_border_hl_c <= 320; 
        stick_border_hl_r <= 240;
      end 
      else begin
        if      (regime_store == 2'b11) begin  // Buttons regime
          if      ( (!js_button_d) && accel_overflow && (stick_border_hl_c != 0  ) ) begin
            stick_border_hl_c <= stick_border_hl_c - 1; 
          end
          else if ( (!js_button_b) && accel_overflow && (stick_border_hl_c != 639) ) begin
            stick_border_hl_c <= stick_border_hl_c + 1; 
          end
          //
          if      ( (!js_button_c) && accel_overflow && (stick_border_hl_r != 479) ) begin
            stick_border_hl_r <= stick_border_hl_r + 1; 
          end
          else if ( (!js_button_a) && accel_overflow && (stick_border_hl_r != 0  ) ) begin
            stick_border_hl_r <= stick_border_hl_r - 1; 
          end
        end
        else if (regime_store == 2'b10) begin  // Accelerometer regime
          if ( ( accel_x_store_reg[15:8] == 8'b0000_0000 ) && accel_overflow && ( stick_border_hl_c != 0   ) ) begin
            stick_border_hl_c <= stick_border_hl_c - 1; 
          end
          if ( ( accel_x_store_reg[15:8] == 8'b1111_1111 ) && accel_overflow && ( stick_border_hl_c != 639 ) ) begin
            stick_border_hl_c <= stick_border_hl_c + 1; 
          end
          if ( ( accel_y_store_reg[15:8] == 8'b0000_0000 ) && accel_overflow && ( stick_border_hl_r != 479 ) ) begin
            stick_border_hl_r <= stick_border_hl_r + 1; 
          end
          if ( ( accel_y_store_reg[15:8] == 8'b1111_1111 ) && accel_overflow && ( stick_border_hl_r != 0   ) ) begin
            stick_border_hl_r <= stick_border_hl_r - 1; 
          end
        end
        else if (regime_store == 2'b01) begin  // JoyStick regime
          if      ( ( x_store_reg[11:4] > 8'hf0 ) && accel_overflow && ( stick_border_hl_c != 639 ) ) begin
            stick_border_hl_c <= stick_border_hl_c + 1; 
          end
          else if ( ( x_store_reg[11:4] < 8'h1f   ) && accel_overflow && ( stick_border_hl_c != 0   ) ) begin
            stick_border_hl_c <= stick_border_hl_c - 1; 
          end
          else begin
            stick_border_hl_c <= stick_border_hl_c; 
          end
          //
          if      ( ( y_store_reg[11:4] > 8'hf0  ) && accel_overflow && ( stick_border_hl_r != 0   ) ) begin
            stick_border_hl_r <= stick_border_hl_r - 1; 
          end
          else if ( ( y_store_reg[11:4] < 8'h1f  ) && accel_overflow && ( stick_border_hl_r != 479 ) ) begin
            stick_border_hl_r <= stick_border_hl_r + 1; 
          end
          else begin
            stick_border_hl_r <= stick_border_hl_r; 
          end
        end
      end
    end

  //------------------------- Sber logo on start           ----------------------------//
    always @ ( posedge vga_clk or negedge arst_n) begin 
      if      ( !arst_n )  
        sber_logo_counter <= 32'b0;
      else if ( sber_logo_counter < 32'd1_00000000 )
        sber_logo_counter <= sber_logo_counter + 1'b1;
    end 

    always @ (posedge vga_clk or negedge arst_n) begin
      if (!arst_n) begin
        indicator         <= 0;
        stick_active      <= 0;
      end 
      else if (sber_logo_counter < 32'd1_00000000) begin
        stick_active      <= (col >= 10'd256) & (col <= 10'd384) & (row >= 9'd176) & (row <= 9'd304); // Logo size is 128x128 Pixcels
        indicator         <= 0;  
      end 
      else begin
        stick_active      <= (col >= stick_border_hl_c) & (col <= (stick_border_hl_c + stick_width)) & 
                             (row >= stick_border_hl_r) & (row <= (stick_border_hl_r + stick_height));  
        indicator         <= 1;      
      end
    end
   
  //------------------------ VGA outputs                   ----------------------------// 
    assign    red     = stick_active ? ( indicator ? 4'hf : rom_data[11:8]) : (SW[2] ? 4'h8 : 4'h0); 
    assign    green   = stick_active ? ( indicator ? 4'hf : rom_data[7:4] ) : (SW[1] ? 4'h8 : 4'h0);
    assign    blue    = stick_active ? ( indicator ? 4'hf : rom_data[3:0] ) : (SW[0] ? 4'h8 : 4'h0);

endmodule
