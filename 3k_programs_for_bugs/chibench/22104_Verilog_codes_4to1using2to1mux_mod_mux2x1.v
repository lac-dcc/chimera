// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux2x1(a,b,s,y);
input a,b,s;
output reg y;

always @(*) begin
    if (s==0)
    y = a;
    else
    y = b;
end
endmodule