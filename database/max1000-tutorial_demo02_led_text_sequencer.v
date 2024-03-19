module sequencer (
	input wire clk_in,
	input wire nrst,
	
	output reg [31:0] spi_mosi_data,
	input wire [31:0] spi_miso_data,
	output reg [5:0] spi_nbits,
	
	output reg spi_request,
	input  wire spi_ready,
	
	output reg [7:0] led_out, // led_out is just for debugging purposes
	output reg direction
);

localparam 
	STATE_Whoami = 4'd0,
	STATE_Whoami_Wait = 4'd1,
	STATE_Init = 4'd2,
	STATE_Init_Wait = 4'd3,
	STATE_Init1 = 4'd4,
	STATE_Init1_Wait = 4'd5,
	STATE_Init2 = 4'd6,
	STATE_Init2_Wait = 4'd7,
	STATE_Read = 4'd8,
	STATE_Read_Wait = 4'd9,
	STATE_Compare = 4'd10;
	
reg [3:0] state;

reg signed [7:0] saved_acc;

always @(posedge clk_in or negedge nrst)
	if (nrst == 1'b0) begin		
		state <= 4'b0;
		
		spi_mosi_data <= 32'b0;
		spi_nbits <= 6'b0;
		spi_request <= 1'b0;
		led_out <= 8'b0;
		
		direction <= 1'b0;
		saved_acc <= 8'b0;
	end else begin
		case (state)
		
			// 1. Read WHO_AM_I register (Addr 0x0F)
			STATE_Whoami: begin
				state <= STATE_Whoami_Wait;
				
				spi_request <= 1'b1;
				spi_nbits <= 6'd15;
				spi_mosi_data <= 31'b10001111_00000000;
			end
			
			STATE_Whoami_Wait: begin
				if (spi_ready) begin
					state <= STATE_Init;
					led_out <= spi_miso_data[7:0];
				end 
				spi_request <= 1'b0;
			end
			
			// 2. Write ODR in CTRL_REG1 (Addr 0x20)
			STATE_Init: begin
				state <= STATE_Init_Wait;
				
				spi_request <= 1'b1;
				spi_nbits <= 6'd15;
				spi_mosi_data <= 31'b00100000_01110111;
			end
			
			STATE_Init_Wait: begin
				if (spi_ready) begin
					state <= STATE_Init1;
				end 
				spi_request <= 1'b0;
			end
			
			// 3. Enable temperature sensor (Addr 0x1F)
			STATE_Init1: begin
				state <= STATE_Init1_Wait;
				
				spi_request <= 1'b1;
				spi_nbits <= 6'd15;
				spi_mosi_data <= 31'b00011111_11000000;
			end
			
			STATE_Init1_Wait: begin
				if (spi_ready) begin
					state <= STATE_Init2;
				end 
				spi_request <= 1'b0;
			end
			
			// 4. Enable BDU, High resolution (Addr 0x23)
			STATE_Init2: begin
				state <= STATE_Init2_Wait;
				
				spi_request <= 1'b1;
				spi_nbits <= 6'd15;
				spi_mosi_data <= 31'b00100011_10001000;
			end
			
			STATE_Init2_Wait: begin
				if (spi_ready) begin
					state <= STATE_Read;
				end 
				spi_request <= 1'b0;
			end
			
			// 5. Read OUT_X_H (Addr 0x29)
			STATE_Read: begin
				state <= STATE_Read_Wait;
				
				spi_request <= 1'b1;
				spi_nbits <= 6'd23;
				spi_mosi_data <= 31'b11101000_00000000_00000000;
			end
			
			STATE_Read_Wait: begin
				if (spi_ready) begin
					state <= STATE_Compare;
					saved_acc <= spi_miso_data[7:0];
				end 
				spi_request <= 1'b0;
			end
			
			// 6. Compare X_OUT of the accelerometer to know the swipe direction
			// The acceleration is maximum at the edges of the swipe, detect that
			// and change direction accordingly.
			STATE_Compare: begin
				state <= STATE_Read;
				
				if (saved_acc < -8'Sb0010_0000) begin
					led_out <= 8'b1110_0000;
					direction <= 1'b0;
				end else if (saved_acc >  8'Sb0010_0000) begin
					led_out <= 8'b0000_0111;
					direction <= 1'b1;
				end else begin
					led_out <= 8'b0001_1000;
				end
			end
		endcase
	end

endmodule
