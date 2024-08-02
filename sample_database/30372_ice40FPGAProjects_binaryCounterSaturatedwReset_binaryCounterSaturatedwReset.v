// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

//------------------------------------------------------------------
//-- Hello world example for the iCE40-HX8K board
//-- 8 bit binary counter
//------------------------------------------------------------------


module binaryCounter #(parameter MAX_COUNT = 100)(
            output reg [7:0] leds = 0,
            input clk,
            input rst);

//max is 8 bits which is 255
localparam maxCountLED = 8'hFF;

reg [31:0] count = 0;
always @(posedge clk) begin
    if (leds !=  maxCountLED) begin
        count = count + 1;
        if (count == MAX_COUNT) begin
            leds = leds + 1;
            count = 0;
        end
    end
end

always @(negedge rst) begin
    count  = 0;
    leds = 0;
end

endmodule