// This program was cloned from: https://github.com/AugustinJose1221/FPGA-Build
// License: MIT License

module gaussian();
reg [7:0] s;
reg [7:0] size;
reg [7:0] G;

initial
begin
 size = 4*s + 1;
 G = 1/(2*3.1415);
 $display("%f", G);
end
endmodule
