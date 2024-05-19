// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module quadencoder
    #(
         parameter BITS = 32,
         parameter QUAD_TYPE = 0
     )
     (
         input clk,
         input a,
         input b,
         output signed [BITS-1:0] position
     );
    reg [2:0] a_delayed = 0;
    reg [2:0] b_delayed = 0;
    always @(posedge clk) a_delayed <= {a_delayed[1:0], a};
    always @(posedge clk) b_delayed <= {b_delayed[1:0], b};
    wire count_enable = a_delayed[1] ^ a_delayed[2] ^ b_delayed[1] ^ b_delayed[2];
    wire count_direction = a_delayed[1] ^ b_delayed[2];
    reg signed [BITS-1:0] count = 0;
    assign position = $signed(count>>>QUAD_TYPE);
    always @(posedge clk) begin
        if (count_enable) begin
            if(count_direction) begin
                count <= count + 1;
            end else begin
                count <= count - 1;
            end
        end
    end
endmodule
