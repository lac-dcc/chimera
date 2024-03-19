// SPI ST7735 display video XY scan core
// AUTHORS=EMARD,MMICKO and Lawrie Griffiths
// LICENSE=BSD

module oled_video #(
  // file name is relative to directory path in which verilog compiler is running
  // screen can be also XY flipped and/or rotated from this init file
  parameter C_init_file = "st7735_init.mem",
  parameter C_init_size = 110 // bytes in init file
) (
  input  wire clk, // SPI display clock rate will be half of this clock rate
  
  output reg  [C_x_bits-1:0] x,
  output reg  [C_y_bits-1:0] y,
  output reg  next_pixel, // 1 when x/y changes
  input  wire [C_color_bits-1:0] color, 

  output wire oled_csn,
  output wire oled_clk,
  output wire oled_mosi,
  output wire oled_dc,
  output wire oled_resn
);
  localparam C_color_bits = 16;
  localparam C_x_size = 128;  // pixel X screen size
  localparam C_y_size = 160;  // pixel Y screen size
  localparam C_x_bits = $clog2(C_x_size); 
  localparam C_y_bits = $clog2(C_y_size);

  localparam ms_cycles = 25000;

  reg [7:0] C_oled_init[0:C_init_size-1];
  initial begin
    $readmemh(C_init_file, C_oled_init);
  end

  reg [1:0]  reset_cnt;
  reg [10:0] init_cnt;
  reg [7:0]  data;
  reg dc;
  reg byte_toggle; // alternates data byte for 16-bit mode
  reg init = 1;
  reg [4:0] num_args;
  reg [24:0] delay_cnt;
  reg [5:0] arg;
  reg delay_set = 0;
  reg [7:0] last_cmd;
  
  assign oled_resn = ~reset_cnt[0]; // Reset is High, Low, High for first 3 cycles
  assign oled_csn = reset_cnt[0];
  assign oled_dc = dc;              // 0 for commands, 1 for command parameters and data
  assign oled_clk = init_cnt[0];    // SPI Mode 0
  assign oled_mosi = data[7];       // Shift out data

  // The next byte in the initialisation sequence
  wire [7:0] next_byte = C_oled_init[init_cnt[10:4]];

  // Do the initialisation sequence and then start sending pixels
  always @(posedge clk) begin
    if (reset_cnt != 2) begin // Reset
      reset_cnt <= reset_cnt+1;
    end else if (delay_cnt > 0) begin // Delay
      delay_cnt <= delay_cnt - 1;
    end else if (init_cnt[10:4] != C_init_size) begin
      init_cnt <= init_cnt + 1;
      if (init_cnt[3:0] == 0) begin // Start of byte
        if (init) begin // Still initialisation
          dc <= 0;
          arg <= arg + 1;
          if (arg == 0) begin // New command
            data <=  0; // No NOP
            last_cmd <= next_byte;
          end else if (arg == 1) begin // numArgs and delay_set
            num_args <= next_byte[4:0];
            delay_set <= next_byte[7];
            if (next_byte == 0) arg <= 0; // No args or delay
            data <= last_cmd;
          end else if (arg <= num_args + 1) begin // argument
            data <= next_byte;
            dc <= 1;
            if (arg == num_args + 1 && !delay_set) arg <= 0;
          end else if (delay_set) begin // delay
            if (next_byte != 8'hff) begin
              delay_cnt <= next_byte * ms_cycles;
            end else begin // Long delay
              delay_cnt <= 500 * ms_cycles;
            end
            data <= 0;
            delay_set <= 0;
            arg <= 0;
          end
        end else begin // Send pixels and set x,y and next_pixel
          byte_toggle <= ~byte_toggle;
          dc <= 1;
          data <= byte_toggle ? color[7:0] : color[15:8];
          if (byte_toggle == 0) begin
            next_pixel <= 1;
            if (x == C_x_size-1) begin
              x <= 0;
              if (y == C_y_size-1) begin
                y <= 0;
              end else begin
                y <= y + 1;
              end
            end else x <= x + 1;
          end
        end
      end else begin // Shift out byte
        next_pixel <= 0;
        if (init_cnt[0] == 0) data <= { data[6:0], 1'b0 };
      end
    end else begin // Initialisation done, start sending pixels
      init <= 0;
      init_cnt[10:4] <= C_init_size - 1;
    end
  end

endmodule
