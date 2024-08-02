// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


module dualPortMemory(clock,rw,enable,addr1,addr2,data_in1,data_in2,data_out1,data_out2);

parameter n = 4;
parameter word_size = 25;
input clock;
input rw;       //rw = 1 --> read, rw = 0 --> write, provided enable = 1
input enable;
input [word_size-1:0] data_in1;
input [word_size-1:0] data_in2;
input [n:0] addr1;
input [n:0] addr2;

output reg [word_size-1:0] data_out1;
output reg [word_size-1:0] data_out2;

reg [word_size-1:0] NTT_RAM[7:0]; //memory with 8 locations,each having word size 25 bit

initial
begin
    NTT_RAM[0] <= 25'b0000_0000_0000_0000_1111_1010_1;      //501
    NTT_RAM[1] <= 25'b0000_0000_0000_0000_1011_1010_1;      //373
    NTT_RAM[2] <= 25'b0000_0000_0000_0000_0011_0010_1;      //101
    NTT_RAM[3] <= 25'b0000_0000_0000_0000_1001_1000_1;      //305
    NTT_RAM[4] <= 25'b0000_0000_0000_0000_1111_1110_0;      //508
    NTT_RAM[5] <= 25'b0000_0000_0000_0000_0000_1100_0;      //24
    NTT_RAM[6] <= 25'b0000_0000_0000_0000_0011_1010_0;      //116
    NTT_RAM[7] <= 25'b0000_0000_0000_0000_1001_0011_0;      //294
end

always @(posedge clock)
begin
    if(enable)
    begin
        if(rw == 1)  //read enabled
            begin
                data_out1 <= NTT_RAM[addr1];
                data_out2 <= NTT_RAM[addr2];
            end
        else        //write enabled
            begin
                NTT_RAM[addr1] <= data_in1;
                NTT_RAM[addr2] <= data_in2;
            end
    end
    else
        //hold the data at the outputs
        begin
        data_out1 <= data_out1;
        data_out2 <= data_out2;
        end
end

endmodule