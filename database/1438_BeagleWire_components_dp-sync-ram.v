// This program was cloned from: https://github.com/pmezydlo/BeagleWire
// License: GNU General Public License v2.0

module dp_sync_ram(input                    rst,
                   input                    clk,
                   // PORT 0
                   input                    cs_0,
                   input                    we_0,
                   input                    oe_0,
                   input [ADDR_WIDTH-1:0]   addr_0,
                   input [DATA_WIDTH-1:0]   data_in_0,
                   output [DATA_WIDTH-1:0]  data_out_0,
                   // PORT 1
                   input                    cs_1,
                   input                    we_1,
                   input                    oe_1,
                   input [ADDR_WIDTH-1:0]   addr_1,
                   input [DATA_WIDTH-1:0]   data_in_1,
                   output [DATA_WIDTH-1:0]  data_out_1);

parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 16;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH];
reg [DATA_WIDTH-1:0] data_out_0;
reg [DATA_WIDTH-1:0] data_out_1;
integer i;

always @ (posedge clk or posedge rst)
begin : MEM_WRITE
    if (rst) begin
        for (i = 0; i < RAM_DEPTH-1; i++)
            mem[i] <= 16'h0000;
    end else begin
        if (!cs_0 && !we_0 && oe_0) begin
            mem[addr_0] <= data_in_0;
        end else if (!cs_1 && !we_1 && oe_1) begin
            mem[addr_1] <= data_in_1;
        end
    end
end

always @ (posedge clk or posedge rst)
begin : MEM_READ_0
    if (rst) begin
        data_out_0 <= 0;
    end else begin
        if (!cs_0 && we_0 && !oe_0) begin
            data_out_0 <= mem[addr_0];
        end else begin
            data_out_0 <= 0;
        end
    end
end

always @ (posedge clk or posedge rst)
begin : MEM_READ_1
    if (rst) begin
        data_out_1 <= 0;
    end else begin
        if (!cs_1 && we_1 && !oe_1) begin
            data_out_1 <= mem[addr_1];
        end else begin
            data_out_1 <= 0;
        end
    end
end

endmodule
