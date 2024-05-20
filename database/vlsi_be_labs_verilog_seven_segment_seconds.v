// This program was cloned from: https://github.com/korotaevyua/vlsi_be_labs
// License: MIT License

`default_nettype none

module seven_segment_seconds (
	input wire clk,
    input wire reset,
    input wire [23:0] compare_in,
    input wire update_compare,
	output wire [6:0] led_out
);

    // external clock is 16MHz, so need 24 bit counter
    reg [23:0] second_counter;
    reg [3:0] digit;
    reg [23:0] compare;

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile ("seven_segment_seconds.vcd");
            $dumpvars (0, seven_segment_seconds);
            #1;
        end
        localparam MAX_COUNT = 100;
    `else
        localparam MAX_COUNT = 16_000_000;
    `endif


    always @(posedge clk) begin
        // if reset, set counter to 0
        if (reset) begin
            second_counter <= 0;
            digit <= 0;
            compare <= MAX_COUNT;
        end else if (update_compare) begin
            compare <= compare_in;
            second_counter <= 0;
            digit <= 0;
        end else begin
            // if up to 16e6
            if (second_counter == compare - 1) begin
                // reset
                second_counter <= 0;

                // increment digit
                digit <= digit + 1'b1;

                // only count from 0 to 9
                if (digit == 9)
                    digit <= 0;

            end else
                // increment counter
                second_counter <= second_counter + 1'b1;
        end
    end

    // instantiate segment display
    seg7 seg7(.counter(digit), .segments(led_out));

endmodule

/*
      -- 1 --
     |       |
     6       2
     |       |
      -- 7 --
     |       |
     5       3
     |       |
      -- 4 --
*/

module seg7 (
    input wire [3:0] counter,
    output reg [6:0] segments
);

	always @(*) begin
        case(counter)
            //                7654321
            0:  segments = 7'b0111111;
            1:  segments = 7'b0000110;
            2:  segments = 7'b1011011;
            3:  segments = 7'b1001111;
            4:  segments = 7'b1100110;
            5:  segments = 7'b1101101;
            6:  segments = 7'b1111100;
            7:  segments = 7'b0000111;
            8:  segments = 7'b1111111;
            9:  segments = 7'b1100111;
            default:    
                segments = 7'b0000000;
        endcase
    end

endmodule
`default_nettype wire
