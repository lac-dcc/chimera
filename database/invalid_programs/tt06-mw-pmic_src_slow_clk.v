// This program was cloned from: https://github.com/wongmatthew73/tt06-mw-pmic
// License: Apache License 2.0

`default_nettype none

module slow_clk(
    input reset,
    input original_clk,
    output slow_clk
    );
    
    parameter CLOCKCOUNT = 2;
    reg [36:0] counter;

    always @(posedge original_clk or posedge reset) begin
    	if(reset == 1) begin
    	    counter <= 0;
        end
    	else begin
    	    if(counter >= CLOCKCOUNT) begin
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
    	end

    end
    assign slow_clk = (counter == CLOCKCOUNT) ? 1 : 0;
    
endmodule
