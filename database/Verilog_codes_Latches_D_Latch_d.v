// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module d_latch(input d, input enable, output reg q);
    always @(d,enable)
        if(enable)
            q <= d;
        
endmodule