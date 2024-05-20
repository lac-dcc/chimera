// This program was cloned from: https://github.com/rupin-r/CollegeProjects
// License: MIT License

module UART_Receiver (
    input wire clk,       // Clock signal
    input wire rst_n,     // Active-low reset signal
    input wire rx,        // UART receive data line
    output reg [7:0] data, // Received data
	 output reg clkout
);

    // Internal state variables
    reg [2:0] state;
    reg [10:0] bit_count;
    reg [7:0] shift_reg;
	 reg [7:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= 3'b000;
            bit_count <= 11'b0;
            shift_reg <= 8'b0;
				clkout <= 1;
        end else begin
            case (state)
                3'b000: begin  // Wait for start bit
                    if (!rx) begin
								counter <= 0;	//reset counter and bit count
                        state <= 3'b001; // Move to next state
                        bit_count <= 11'b0;
                    end
                end

                3'b001: begin  // Receive data bits
                    if (shift_reg != 126) begin
								shift_reg = shift_reg << 1;
                        shift_reg[0] = rx;
                    end else begin
                        state <= 3'b010; // Move to next state (stop bit)
                    end
                end

                3'b010: begin  // Wait for stop bit
                    if (rx) begin
								state <= 3'b011; // Move to next state
                    end
                end

                3'b011: begin  // Wait for idle (start bit of next byte)
                    if (!rx) begin
								bit_count <= 11'b0; //reset bit count
								state <= 3'b100;
                    end
                end

                3'b100: begin  // Receive data bits
						  clkout <= 0;	//set the clkout to 0
                    if (bit_count < 8) begin
                        shift_reg[bit_count] <= rx;
                        bit_count <= bit_count + 1'b1;
                    end else begin
                        state <= 3'b101; // Move to next state (stop bit)
                    end
                end

                3'b101: begin  // Wait for stop bit
                    if (rx) begin
                        data <= shift_reg;
                        state <= 3'b110; // Move to next state
                    end
                end

                3'b110: begin  // Wait for idle (start bit of next byte)
						  bit_count = 11'b0;
						  clkout <= 1;	//finished receiving data, set the clkout to 1
                    if (!rx) begin
								if(counter == 8'b1111111) begin
									state <= 3'b000;
								end else begin
									counter <= counter + 1; //increment phase received by 1
									state <= 3'b100; // Move back to data reception
								end
                    end
                end
                default: begin
                    state <= 3'b000; //just restart if something happens
                end
            endcase
        end
    end
endmodule
