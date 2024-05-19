// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    integer i;
    reg [2:0]both;
    reg [3:1]any;
    reg [3:0]different;
    always @(*) begin
        both = 0;
        any = 0;
        different = 0;
        for(i=0;i<3;i=i+1) begin
            if((in[i]&in[i+1]) == 1) begin
                both[i] = 1;
            end
        end
        for(i=1;i<4;i=i+1) begin
            if((in[i]|in[i-1]) == 1) begin
                any[i] = 1;
            end
        end
        for(i=0;i<4;i=i+1) begin
            if(i<3) begin
                if(in[i]^in[i+1]) begin
                    different[i] = 1;
                end
            end
            else begin 
                if(in[3]^in[0]) begin
                    different[3] = 1;
                end
            end
        end
    end
    assign out_both = both;
    assign out_any[3:1] = any[3:1];
    assign out_different = different;
endmodule

