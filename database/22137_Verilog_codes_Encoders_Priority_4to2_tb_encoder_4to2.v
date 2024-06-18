// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_prior_enco_4to2();

reg [3:0] input_data;
wire [1:0] out;

prior_enco_4to2 dut (
    .input_data(input_data),
    .out(out)
);

initial begin
    $dumpfile("priority.vcd");
    $dumpvars(0);
    $monitor("Input: %b, Output Priority: %b", input_data, out);
    #10;
    input_data = 4'b0000;
    #10;
    
    input_data = 4'b0001;
    #10;
    
    input_data = 4'b0100;
    #10;
    
    input_data = 4'b0000;
    #10;
    $finish;
end

endmodule
