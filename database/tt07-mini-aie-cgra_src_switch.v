// This program was cloned from: https://github.com/vrteee/tt07-mini-aie-cgra
// License: Apache License 2.0




module switch 
#(parameter rank = 0)
(
    input wire clk, rst_n,
    input [7:0] switch_fifo_in, 
    output reg [7:0] switch_fifo_out,
    input [7:0] pe_fifo_in,
    output reg [7:0] pe_fifo_out,
    output wire rd_en,
    output wire wr_en
);

reg [7:0] prev_switch_fifo_in;
reg [7:0] prev_pe_fifo_in;

wire pe_rd, fifo_rd;
assign pe_rd = pe_fifo_in != prev_pe_fifo_in;
assign fifo_rd = switch_fifo_in != prev_switch_fifo_in;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        switch_fifo_out <= 8'b00000000;
        pe_fifo_out <= 8'b00000000;
        prev_pe_fifo_in <= 8'b00000000;
        prev_switch_fifo_in <= 8'b00000001;

    end else begin
        if (pe_rd) begin
            prev_pe_fifo_in <= pe_fifo_in;
            switch_fifo_out <= {4'b1111, pe_fifo_in[3:0]};
            
        end else if (fifo_rd) begin
            prev_switch_fifo_in <= switch_fifo_in;
            if (switch_fifo_in[5:4] == rank) begin
                pe_fifo_out <= switch_fifo_in;
            end else begin
                switch_fifo_out <= switch_fifo_in;
            end
        end 
    end
end

assign rd_en = 1'b1;
assign wr_en = 1'b1;

endmodule
