// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_lt2;

reg [1:0] A, B;
reg cin;
wire [1:0] sum;
wire cout;

lt2 uut(
    .A(A),
    .B(B),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    $dumpfile("lt2.vcd");
    $dumpvars(0);
    $monitor("Time=%0t A=%b B=%b cin=%b sum=%b cout=%b", $time, A, B, cin, sum, cout);
    
    A = 2'b00; B = 2'b00; cin = 0; #10;
    A = 2'b01; B = 2'b00; cin = 0; #10;
    A = 2'b01; B = 2'b01; cin = 0; #10;
    A = 2'b11; B = 2'b01; cin = 0; #10;
    A = 2'b10; B = 2'b10; cin = 1; #10;
    A = 2'b11; B = 2'b11; cin = 1; #10;
    $finish;
end

endmodule
