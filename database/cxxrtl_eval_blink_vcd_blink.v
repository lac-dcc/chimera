
module blink(input clk, output led);

    reg [7:0] counter = 0;

    always @(posedge clk) 
        counter <= counter + 1'b1;

    assign led = counter[7];

endmodule

