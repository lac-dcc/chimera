// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    integer i;
    reg [7:0] in_tmp;
    always @(posedge clk) begin
        for(i = 0; i < 8; i = i + 1) begin
            if(in_tmp[i] != in[i]) begin
                anyedge[i] = 1;
            end
            else begin
                anyedge[i] = 0;
            end
            in_tmp[i] = in[i];
        end
    end

endmodule

/*  A Better Solution:
*
*   module top_module (
*         input clk,
*         input [7:0] in,
*         output [7:0] anyedge
*   );
*        reg [7:0] temp;
*        always @(posedge clk) begin
*            temp <= in;
*            anyedge <= temp ^ in;
*        end
*   endmodule
*/
