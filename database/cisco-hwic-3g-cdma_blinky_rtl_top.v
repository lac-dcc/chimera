
module top(
    input               clk25,

    output [3:0]        leds
);

    reg rst_ = 1'b0;
    always @(posedge clk25) begin
        rst_    <= 1'b1;
    end


    reg [24:0] cntr;

    always @(posedge clk25 or negedge rst_) begin
        if (!rst_) begin
            cntr    <= 25'd0;
        end
        else begin
            cntr    <= cntr + 1'b1;
        end
    end

    assign leds = cntr[24:21];
endmodule
