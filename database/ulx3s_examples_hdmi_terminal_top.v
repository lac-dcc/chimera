module top
(
	input clk_25mhz,
	output [3:0] gpdi_dp, gpdi_dn,
	output wifi_gpio0,
  input wire ftdi_txd
);
	assign wifi_gpio0 = 1'b1;

	wire [23:0] color;
	wire [9:0] x;
	wire [9:0] y;

  reg [7:0] mem [0:2400];

  integer k;

  initial
  begin
    for (k = 0; k < 2400; k = k + 1)
      mem[k] <= 32;
  end


  wire rx_valid;
  wire locked;

  wire [7:0] uart_out;
  
  uart_rx uart(
      .clk(clk_25mhz),
      .resetn(locked),

      .ser_rx(ftdi_txd),

      .cfg_divider(25000000/115200),

      .data(uart_out),
      .valid(rx_valid)
  );

  wire [11:0] pos;
  reg [6:0] p_x;
  reg [4:0] p_y;

  reg valid;
  reg [7:0] display_char;
  reg [7:0] display_data;

  assign pos = p_x + p_y*80;
  always @(posedge clk_25mhz) begin
      if (valid) begin
          mem[pos] <= display_char;
      end
      display_data <= mem[(y >> 4) * 80 + (x>>3)];
  end


  reg state;

  always @(posedge clk_25mhz) 
  begin
      if (!locked)     
      begin        
          state <= 0;
          p_x <= 0;
          p_y <= 0;
          valid <= 0;
      end
      else
      begin
          case (state)
              0: begin  // receiving char
                  if (rx_valid) 
                  begin                
                      valid <= 1;
                      display_char <= uart_out;
                      state <= 1;
                  end
                  end
              1: begin  // display char
                  if (p_x < 79)
                      p_x <= p_x + 1;
                  else
                  begin
                      if (p_y < 29)
                        p_y <= p_y + 1;
                      else
                        p_y <= 0;
                      p_x <= 0;
                  end
                  valid <= 0;
                  state <= 0;
                  end
          endcase  
      end
  end

  wire [7:0] data_out;

  font_rom vga_font(
      .clk(clk_25mhz),
      .addr({display_data, y[3:0] }),
      .data_out(data_out)
  );

  assign color = data_out[7-x[2:0]+1] ? 24'hffffff : 24'h000000; // +1 for sync

	hdmi_video hdmi_video
	(
		.clk_25mhz(clk_25mhz),
		.x(x),
		.y(y),
		.color(color),
		.gpdi_dp(gpdi_dp),
		.gpdi_dn(gpdi_dn),
    .clk_locked(locked)
	);
endmodule
