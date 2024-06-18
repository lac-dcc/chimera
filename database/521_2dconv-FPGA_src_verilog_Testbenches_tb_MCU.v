// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

module tb_MCU();

    parameter N = 2;
    parameter STATES = 3;
    parameter BITS_IMAGEN = 8;
    parameter BITS_DATA = 13;
    parameter BITS_ADDR = 10;
    
    reg [N*BITS_DATA-1:0]      i_DataConv;
    reg [BITS_IMAGEN-1:0]          i_Data;
    reg [(N+2)*BITS_DATA-1:0]  i_MemData;
    reg [BITS_ADDR-1:0]          i_WAddr, i_RAddr;
    reg                          i_chblk, i_sop, i_eop, rst, clk;

    wire [3*N*BITS_IMAGEN-1:0]   o_DataConv;
    wire [BITS_DATA-1:0]         o_Data;
    wire [N+1:0]                 o_we;
    wire [BITS_ADDR-1:0]         o_WAddr, o_RAddr;
    wire [(N+2)*BITS_DATA-1:0] o_MemData;
    
    
    initial begin
        
        i_Data     = {BITS_IMAGEN/2{1'b1,1'b0}};
        i_MemData  = {13'h3,13'h2,13'h1,13'h0};
        i_DataConv = {13'hc1,13'hc0};
        i_WAddr = 1;
        i_RAddr = 1;
        
        
        i_sop   = 1'b0;
        i_eop   = 1'b0;
        rst     = 1'b0;
        i_chblk = 1'b0;
        clk     = 1'b0;
        
        #10 rst = 1'b1;
        #20 rst = 1'b0;
        
        #100 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #200 i_sop = 1'b1;
        
        #300 i_sop = 1'b0;
        i_eop = 1'b1;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #100 i_sop = 1'b0;
        i_eop = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #200 i_sop = 1'b1;
        
        #300 i_sop = 1'b0;
        i_eop = 1'b1;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        
        #500 $finish;
    end
    
    always #2.5 clk = ~clk;

    MCU
        #(
          .N(N),
          .STATES(STATES),
          .BITS_IMAGEN(BITS_IMAGEN),
          .BITS_DATA(BITS_DATA),
          .BITS_ADDR(BITS_ADDR)
          )

    u_MCU
        (
         .i_DataConv(i_DataConv),
         .i_Data(i_Data),
         .i_MemData(i_MemData),
         .i_WAddr(i_WAddr),
         .i_RAddr(i_RAddr),
         .i_chblk(i_chblk),
         .i_sop(i_sop),
         .i_eop(i_eop),
         .rst(rst),
         .clk(clk),

         .o_DataConv(o_DataConv),
         .o_Data(o_Data),
         .o_we(o_we),
         .o_WAddr(o_WAddr),
         .o_RAddr(o_RAddr),
         .o_MemData(o_MemData)
         );
    
endmodule
