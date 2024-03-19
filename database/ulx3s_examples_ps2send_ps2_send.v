module ps2_send (
  input            clk_25mhz,
  output reg       ps2_data,
  output reg       ps2_clk = 1,
  input            req,
  output reg       busy,
  input [7:0]      data,
  input            extended,
  input            shift,
  output reg [7:0] led
);

reg [3:0]  bit_count = 0;
reg [10:0] prescaler = 0;
reg        parity = 0;
reg [2:0]  byte_count = 0;
reg [11:0]  delay = 0;

wire [7:0] break_code  = 8'hf0;
wire [7:0] extend_code = 8'he0;
wire [7:0] shift_code = 8'h12;

wire data_bit = data[bit_count];
wire break_bit = break_code[bit_count];
wire extend_bit = extend_code[bit_count];
wire shift_bit = shift_code[bit_count];

wire send_bit = (shift ? ((byte_count == 0 || byte_count == 5) ? shift_bit
                       : ((byte_count == 2 || byte_count == 4) ? break_bit : data_bit)) :
	         (extended ? (byte_count == 3 ? break_bit : 
		             ((byte_count == 0 || byte_count == 2) ? extend_bit : data_bit))
	                   : (byte_count == 1 ? break_bit : data_bit)));

always @(posedge clk_25mhz) begin
  if (req) begin
    ps2_data <= 0; // Start bit
    busy <= 1;
    prescaler <= 0;
  end
 
  if (busy) begin
    prescaler <= prescaler + 1;

    if (prescaler == 1023) begin
      prescaler <= 0;
      if (delay > 0) delay <= delay - 1;
      else begin
        ps2_clk <= ~ps2_clk;

        if (!ps2_clk) begin // Rising  edge
          bit_count <= bit_count + 1;

          if (bit_count < 8) begin
            ps2_data <= send_bit;
            parity = parity ^ send_bit;
	    if (byte_count == 0) led[bit_count] <= send_bit;
          end else if (bit_count == 8) begin
            ps2_data <= ~parity;
          end else if (bit_count == 9) begin
            ps2_data <= 1; // Stop bit
          end else begin // End of byte
            bit_count <= 0;
	    parity <= 0;
	    if (byte_count < 2 + extended + extended + shift + shift + shift) begin // More bytes
              byte_count <= byte_count + 1;
	      if (byte_count == 1 + shift + extended) delay <= 12'h3ff;
	      ps2_data <= 0; // Start bit
            end else begin
              busy <= 0;
	      byte_count <= 0;
	    end
	  end
	end
      end
    end      
  end
end

endmodule

