
module blink(input clk, output led);

    reg [63:0] counter = 0;
    reg [43:11] non_zero_lsb = 1;

    always @(posedge clk) 
        counter <= counter + 1'b1;

    assign led = counter[7];


endmodule

module top(input clk, output led);

    reg [39:0] mem[10:0];

    initial begin
        mem[0]  = 0;
        mem[4]  = 3;
        mem[7] = (1<<33);
    end

    blink u_blink(
        .clk(clk),
        .led(led)
    );

endmodule
