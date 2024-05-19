// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

module CLK(
    input wire sysclk,
    input wire reset,
    output reg clk
);

reg [31:0] count;

initial begin
    count <= 0;
end

always@(posedge sysclk or posedge reset) begin
    if(reset) begin
        count <= 0;
        clk <= 0;
    end
    else if(count >= 2) begin
        clk <= ~clk;
        count <= 0;
    end
    else begin
        count <= count + 1;
    end
end

endmodule