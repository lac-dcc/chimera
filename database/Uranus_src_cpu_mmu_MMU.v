// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`define IN_RANGE(v, l, u) v[31:28] >= (l) && v[31:28] <= (u)

module MMU(
    input rst,
    input [31:0] read_addr_in,
    input [31:0] write_addr_in,
    output reg[31:0] read_addr_out,
    output reg[31:0] write_addr_out
);

    always @(*) begin
        if (!rst) begin
            read_addr_out <= 0;
        end
        else begin
            if (`IN_RANGE(read_addr_in, 4'h0, 4'h7)) begin
                read_addr_out <= read_addr_in;
            end
            else if (`IN_RANGE(read_addr_in, 4'h8, 4'h9)) begin
                read_addr_out <= {read_addr_in[31:28] - 4'h8, read_addr_in[27:0]};
            end
            else if (`IN_RANGE(read_addr_in, 4'ha, 4'hb)) begin
                read_addr_out <= {read_addr_in[31:28] - 4'ha, read_addr_in[27:0]};
            end
            else if (`IN_RANGE(read_addr_in, 4'hc, 4'hd)) begin
                read_addr_out <= read_addr_in;
            end
            else begin   // 32'he000_0000, 32'hffff_ffff
                read_addr_out <= read_addr_in;
            end
        end
    end

    always @(*) begin
        if (!rst) begin
            write_addr_out <= 0;
        end
        else begin
            if (`IN_RANGE(write_addr_in, 4'h0, 4'h7)) begin
                write_addr_out <= write_addr_in;
            end
            else if (`IN_RANGE(write_addr_in, 4'h8, 4'h9)) begin
                write_addr_out <= {write_addr_in[31:28] - 4'h8, write_addr_in[27:0]};
            end
            else if (`IN_RANGE(write_addr_in, 4'ha, 4'hb)) begin
                write_addr_out <= {write_addr_in[31:28] - 4'ha, write_addr_in[27:0]};
            end
            else if (`IN_RANGE(write_addr_in, 4'hc, 4'hd)) begin
                write_addr_out <= write_addr_in;
            end
            else begin   // 32'he000_0000, 32'hffff_ffff
                write_addr_out <= write_addr_in;
            end
        end
    end

endmodule // MMU
