// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_greytobin;
reg [3:0] grey;
wire [3:0] binary;

greytobin uut (
    .grey(grey), 
    .binary(binary)
);

initial begin
    $dumpfile("greytobin.vcd");
    $dumpvars(0, tb_greytobin);
    $monitor($time,"Input: %b, Output: %b", grey, binary);
    grey = 4'b0000;
    #10 grey = 4'b0001;
    #10 grey = 4'b0011;
    #10 grey = 4'b0111;
    #10 grey = 4'b1111;
    #10 $finish;
end
endmodule
