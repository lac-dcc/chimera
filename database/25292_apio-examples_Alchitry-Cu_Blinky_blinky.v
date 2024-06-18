// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//blink all 8 leds on Alchitry-Cu Board

module blinky (
    //inputs
    input clk, //100MHz

    //outputs
    output reg [0:7] led = 8'b11111111 //start with all on
);


//initialize counter and blink delay
integer count = 27'b0;
integer delay = 27'b101111101011110000100000000  >> 1; //half a second

//blink all leds
always @ (posedge clk) begin   
    if (count == delay) begin 
        if (led == 8'b0) begin  //if off
            led <= 8'b11111111; //turn on
        end
        else begin
            led <= 8'b0;
        end
        count = 27'b0;  //reset count
    end
    else begin
        count = count + 1'b1;
    end
end

endmodule
