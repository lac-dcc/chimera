// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_prior_enco_3to8();

reg [7:0] input_data;
wire [2:0] out;

prior_enco_3to8 dut (
    .input_data(input_data),
    .out(out)
);

initial begin
    $dumpfile("priority.vcd");
    $dumpvars(0);
    $monitor("Input: %b, Output Priority: %b", input_data, out);
    #10;
    input_data = 8'b00000000;
    #10;
    
    input_data = 8'b00000001;
    #10;
    
    input_data = 8'b00000100;
    #10;
    
    input_data = 8'b00000000;
    #10;
    $finish;
end

endmodule
