// This program was cloned from: https://github.com/SySS-Research/icestick-lpc-tpm-sniffer
// License: GNU General Public License v3.0

/*
 * iCEstick LPC TPM Sniffer (ftdi.v)
 * 
 * FTDI Fast Opto-Isolated Serial Interface Mode
 */

module ftdi(
	input wire clk,                         // clock
	input wire reset,                       // reset, active low   
	input wire [7:0] read_data,             // read data
	input wire read_clk_enable,             // read clock enable
	input wire fscts,                       // fast serial clear to send
	output reg ready,                       // ready to read new data
	output reg fsdi                         // fast serial data input
);

    // registers
	reg [9:0] data;                         // data
	reg new_data;                           // new data flag
	reg [3:0] bit_pos;                      // which is the next bit to transmit

    // state machine
	localparam[1:0] STATE_IDLE = 2'd0;
    localparam[1:0] STATE_WAIT_CTS = 2'd1;
    localparam[1:0] STATE_DATA = 2'd2;
    reg [1:0] state;

    // synchronous logic
	always @(posedge clk or negedge reset)
    begin
		if (~reset)
        begin
			ready <= 1'b0;
			new_data <= 1'b0;
		end
	    else begin
			if (state == STATE_IDLE)
            begin
				if (~new_data)
					if (~ready)
						ready <= 1'b1;
					else if (read_clk_enable)
                    begin
						/* start bit */
						data[0] <= 1'b0;
						data[8:1] <= read_data;
						/* channel bit */
						data[9] <= 1'b1;
						new_data <= 1'b1;
						ready <= 1'b0;
					end
			end
			else
			    new_data <= 1'b0;
		end
	end

	always @(posedge clk or negedge reset)
    begin
		if (~reset)
        begin
			state <= STATE_IDLE;
		end
		else begin
			case (state)
				STATE_IDLE:
                begin
					fsdi <= 1'b1;
					if (new_data)
                    begin
						bit_pos <= 1'b0;
						if (fscts)
							state <= STATE_DATA;
						else
							state <= STATE_WAIT_CTS;
					end
				end

				STATE_WAIT_CTS:
                begin
					if (fscts)
						state <= STATE_DATA;
				end

				STATE_DATA:
                begin
					fsdi <= data[bit_pos];
					if (bit_pos == 4'd9)
						state <= STATE_IDLE;
					else
						bit_pos <= bit_pos + 1'b1;
				end
			endcase
		end
	end

endmodule
