`default_nettype none
module two_port(/*autoport*/
//output
            rddata1,
            rddata2,
            ram_address,
            ram_data_o,
            ram_wr_n,
            ram_rd_n,
            dataenable,
//input
            rst_n,
            clk2x,
            address1,
            wrdata1,
            dataenable1,
            rd1,
            wr1,
            address2,
            wrdata2,
            dataenable2,
            rd2,
            wr2,
            ram_data_i);

input wire rst_n;
input wire clk2x;

input wire[31:0] address1;
input wire[31:0] wrdata1;
output reg[31:0] rddata1;
input wire[3:0] dataenable1;
input wire rd1;
input wire wr1;

input wire[31:0] address2;
input wire[31:0] wrdata2;
output reg[31:0] rddata2;
input wire[3:0] dataenable2;
input wire rd2;
input wire wr2;

output reg[31:0] ram_address;
input wire[31:0] ram_data_i;
output wire[31:0] ram_data_o;
output reg ram_wr_n;
output reg ram_rd_n;
output reg[3:0] dataenable;

reg[3:0] state;
reg[31:0] wrbuf;

assign ram_data_o = wrbuf;

always @(posedge clk2x or negedge rst_n) begin
    if (!rst_n) begin
        // reset
        state <= 4'b1;
        rddata1 <= 32'b0;
        ram_wr_n <= 1'b1;
        ram_rd_n <= 1'b1;
    end
    else begin
        state <= {state[2:0], state[3]};
        if (state[0]) begin
            ram_address <= address1;
            wrbuf <= wrdata1;
            ram_wr_n <= ~wr1;
            ram_rd_n <= ~rd1;
            dataenable <= dataenable1;
        end
        else if (state[1]) begin
            ram_address <= address2;
            wrbuf <= wrdata2;
            rddata1 <= ram_data_i;
            ram_wr_n <= ~wr2;
            ram_rd_n <= ~rd2;
            dataenable <= dataenable2;
        end
        else begin
            ram_wr_n <= 1'b1;
            ram_rd_n <= 1'b1;
            if (state[2]) begin
                rddata2 <= ram_data_i;
            end
        end
    end
end

endmodule
