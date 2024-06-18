// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_162mux;
    reg [15:0] data_in;
    reg [3:0] sel;
    
    wire data_out;

    mux162 uut (
        .data_in(data_in),
        .sel(sel),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("muxx.vcd");
        $dumpvars(0);
        $monitor($time, "data_out = %b", data_out);
        data_in = 16'b0000000000000001;
        sel = 4'b0000;
        #10;
        
        data_in = 16'b0000000000000101;
        sel = 4'b0101;
        #10;
        
        $finish;
    end
endmodule
