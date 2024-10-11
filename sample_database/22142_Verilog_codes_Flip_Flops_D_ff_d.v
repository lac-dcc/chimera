// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module d_flip_flop(
    input d,           
    input clk,     
    input reset,      
    output reg q  
);

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 1'b0;         
        else
            q <= d;         
    end

endmodule