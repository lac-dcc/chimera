// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module sr_flip_flop(
    input s,       
    input r,       
    input clk,     
    output reg q,  
    output reg q_bar 
);

    always @(posedge clk)
    begin
        if (r)
        begin
            q <= 1'b0;     
            q_bar <= 1'b1; 
        end
        else if (s)
        begin
            q <= 1'b1;     
            q_bar <= 1'b0; 
        end
    end

endmodule