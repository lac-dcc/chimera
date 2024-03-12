module mem(/*autoport*/
//output
         data_o,
//input
         address,
         data_i,
         rd,
         wr,
         byte_enable);

input wire [29:0] address;
input wire [31:0] data_i;
output reg [31:0] data_o;
input wire rd;
input wire wr;
input wire [3:0] byte_enable;

reg[31:0] ram[0:(1024*1024-1)];

parameter MEM_ADDR_WIDTH = 10;

genvar i,j;
always @(*) begin
    data_o <= 32'hzzzzzzzz;
    if(wr) begin
        if(byte_enable[0])
            ram[address][7:0] <= data_i[7:0];
        if(byte_enable[1])
            ram[address][15:8] <= data_i[15:8];
        if(byte_enable[2])
            ram[address][23:16] <= data_i[23:16];
        if(byte_enable[3])
            ram[address][31:24] <= data_i[31:24];
    end
    else if (rd) begin
        data_o[7:0] <= byte_enable[0] ? ram[address][7:0] : 8'hzz;
        data_o[15:8] <= byte_enable[1] ? ram[address][15:8] : 8'hzz;
        data_o[23:16] <= byte_enable[2] ? ram[address][23:16] : 8'hzz;
        data_o[31:24] <= byte_enable[3] ? ram[address][31:24] : 8'hzz;
    end
end

endmodule
