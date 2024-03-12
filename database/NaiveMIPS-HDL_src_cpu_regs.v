module regs(/*autoport*/
//output
            rdata1,
            rdata2,
            rdata3,
//input
            clk,
            rst_n,
            we,
            waddr,
            wdata,
            raddr1,
            raddr2,
            raddr3);

input wire clk;
input wire rst_n;

input wire we;
input wire[4:0] waddr;
input wire[31:0] wdata;

input wire[4:0] raddr1;
output reg[31:0] rdata1;

input wire[4:0] raddr2;
output reg[31:0] rdata2;

input wire[4:0] raddr3;
output reg[31:0] rdata3;

reg[31:0] registers[0:31];

always @(posedge clk) begin
    if(!rst_n) begin
        registers[0] <= 32'b0;
        registers[1] <= 32'b0;
        registers[2] <= 32'b0;
        registers[3] <= 32'b0;
        registers[4] <= 32'b0;
        registers[5] <= 32'b0;
        registers[6] <= 32'b0;
        registers[7] <= 32'b0;
        registers[8] <= 32'b0;
        registers[9] <= 32'b0;
        registers[10] <= 32'b0;
        registers[11] <= 32'b0;
        registers[12] <= 32'b0;
        registers[13] <= 32'b0;
        registers[14] <= 32'b0;
        registers[15] <= 32'b0;
        registers[16] <= 32'b0;
        registers[17] <= 32'b0;
        registers[18] <= 32'b0;
        registers[19] <= 32'b0;
        registers[20] <= 32'b0;
        registers[21] <= 32'b0;
        registers[22] <= 32'b0;
        registers[23] <= 32'b0;
        registers[24] <= 32'b0;
        registers[25] <= 32'b0;
        registers[26] <= 32'b0;
        registers[27] <= 32'b0;
        registers[28] <= 32'b0;
        registers[29] <= 32'b0;
        registers[30] <= 32'b0;
        registers[31] <= 32'b0;
    end
    else if(we && waddr!=5'h0) begin
        registers[waddr] <= wdata;
    end
end

always @(*) begin
    if(raddr1 == 32'b0)
        rdata1 <= 32'b0;
    else if(raddr1 == waddr && we)
        rdata1 <= wdata;
    else
        rdata1 <= registers[raddr1];
end

always @(*) begin
    if(raddr2 == 32'b0)
        rdata2 <= 32'b0;
    else if(raddr2 == waddr && we)
        rdata2 <= wdata;
    else
        rdata2 <= registers[raddr2];
end

always @(*) begin
    if(raddr3 == 32'b0)
        rdata3 <= 32'b0;
    else if(raddr3 == waddr && we)
        rdata3 <= wdata;
    else
        rdata3 <= registers[raddr3];
end

endmodule
