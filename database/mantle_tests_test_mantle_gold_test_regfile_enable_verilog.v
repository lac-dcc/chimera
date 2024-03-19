module my_regfile (
    input ASYNCRESET,
    input CLK,
    input [1:0] read_0_addr,
    output [3:0] read_0_data,
    input [1:0] write_0_addr,
    input [3:0] write_0_data,
    input write_0_en
);

reg [3:0] data [3:0];
always @(posedge CLK) begin
    if (write_0_en) begin
        data[write_0_addr] <= write_0_data;
    end
end
assign read_0_data = write_0_addr == read_0_addr & write_0_en ? write_0_data : data[read_0_addr];


endmodule

module test_regfile_enable_verilog (
    input [1:0] write_addr,
    input [3:0] write_data,
    input write_enable,
    input [1:0] read_addr,
    output [3:0] read_data,
    input CLK,
    input ASYNCRESET
);
wire [3:0] my_regfile_read_0_data;
my_regfile my_regfile (
    .ASYNCRESET(ASYNCRESET),
    .CLK(CLK),
    .read_0_addr(read_addr),
    .read_0_data(my_regfile_read_0_data),
    .write_0_addr(write_addr),
    .write_0_data(write_data),
    .write_0_en(write_enable)
);
assign read_data = my_regfile_read_0_data;
endmodule

