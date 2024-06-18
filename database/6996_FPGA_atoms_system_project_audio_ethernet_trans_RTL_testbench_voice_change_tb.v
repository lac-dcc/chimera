// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

`timescale  1ns/1ns
module voice_change_tb (
    
);

reg           clk;
reg           rst;
reg           sck;
reg    [15:0] ldata_in;
integer    i;
reg grs_n;
GTP_GRS GRS_INST(
.GRS_N (grs_n)
);
initial begin
 grs_n = 1'b0;
 #50000;
 grs_n = 1'b1;
 end

initial begin
    
    clk = 1'b1;
    sck = 1'b1;
    rst <= 1'b0;
    #2000
    rst <= 1'b1;

    // for(i = 0; i < 5000; i = i + 1)
    // begin
    //     ldata_in <= i;
    //     #(2000);
    // end
end


always #10 clk = ~clk;
always #1000 sck = ~sck;


voice_change  voice_change_inst
(   
   .clk(clk),
   .sck(sck),
   .rst_n(rst)/*synthesis PAP_MARK_DEBUG="1"*/

);


endmodule