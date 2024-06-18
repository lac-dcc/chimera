// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module dummy();

wire a = 1;

initial begin
    $dumpvars;
    $display("Hello, World!");
    #10 $finish;
end

endmodule
