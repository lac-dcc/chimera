// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module quadencoderz
    #(
         parameter BITS = 32,
         parameter QUAD_TYPE = 0
     )
     (
         input clk,
         input a,
         input b,
         input z,
         input indexenable,
         output reg indexout = 0,
         output signed [BITS-1:0] position
     );
    reg [2:0] quadA_delayed = 0;
    reg [2:0] quadB_delayed = 0;
    reg [2:0] quadZ_delayed = 0;
    always @(posedge clk) quadA_delayed <= {quadA_delayed[1:0], a};
    always @(posedge clk) quadB_delayed <= {quadB_delayed[1:0], b};
    always @(posedge clk) quadZ_delayed <= {quadZ_delayed[1:0], z};
    wire count_enable = quadA_delayed[1] ^ quadA_delayed[2] ^ quadB_delayed[1] ^ quadB_delayed[2];
    wire count_direction = quadA_delayed[1] ^ quadB_delayed[2];
    reg signed [BITS-1:0] count = 0;
    reg indexwait = 0;
    assign position = $signed(count>>>QUAD_TYPE);
    always @(posedge clk) begin
        if (indexenable == 1 && indexout == 1 && quadZ_delayed == 1) begin
            indexout <= 0;
            count <= 0;
            indexwait <= 1;
        end else begin
            if (indexenable == 1 && indexwait == 0 && indexout == 0 && quadZ_delayed == 0) begin
                indexout <= 1;
            end else if (indexenable == 0 && indexwait == 1) begin
                indexwait <= 0;
            end
            if (count_enable) begin
                if(count_direction) begin
                    count <= count + 1;
                end else begin
                    count <= count - 1;
                end
            end
        end

    end
endmodule
