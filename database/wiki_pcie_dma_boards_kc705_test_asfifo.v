//==========================================
// Function : Asynchronous FIFO (w/ 2 asynchronous clocks).
// Coder    : Alex Claros F.
// Date     : 15/May/2005.
// Notes    : This implementation is based on the article 
//            'Asynchronous FIFO in Virtex-II FPGAs'
//            writen by Peter Alfke. This TechXclusive 
//            article can be downloaded from the
//            Xilinx website. It has some minor modifications.
//=========================================

`timescale 1ns / 1ps

module asfifo
  #(parameter    DATA_WIDTH    = 8,
                 ADDRESS_WIDTH = 4,
                 FIFO_DEPTH    = (1 << ADDRESS_WIDTH))
     //Reading port
    (output wire [DATA_WIDTH-1:0]        dout, 
     output reg                          empty,
     input wire                          rd_en,
     input wire                          rd_clk,        
     //Writing port.	 
     input wire  [DATA_WIDTH-1:0]        din,  
     output reg                          full,
     input wire                          wr_en,
     input wire                          wr_clk,
     
     input wire                          rst);

    /////Internal connections & variables//////
    reg   [DATA_WIDTH-1:0]              Mem [FIFO_DEPTH-1:0];
    wire  [ADDRESS_WIDTH-1:0]           pNextWordToWrite, pNextWordToRead;
    wire                                EqualAddresses;
    wire                                NextWriteAddressEn, NextReadAddressEn;
    wire                                Set_Status, Rst_Status;
    reg                                 Status;
    wire                                PresetFull, PresetEmpty;
    
    //////////////Code///////////////
    //Data ports logic:
    //(Uses a dual-port RAM).
    //'dout' logic:
    assign  dout = Mem[pNextWordToRead];
//    always @ (posedge rd_clk)
//        if (!PresetEmpty)
//            dout <= Mem[pNextWordToRead];
//        if (rd_en & !empty)
            
    //'din' logic:
    always @ (posedge wr_clk)
        if (wr_en & !full)
            Mem[pNextWordToWrite] <= din;

    //Fifo addresses support logic: 
    //'Next Addresses' enable logic:
    assign NextWriteAddressEn = wr_en & ~full;
    assign NextReadAddressEn  = rd_en  & ~empty;
           
    //Addreses (Gray counters) logic:
    graycounter #(
		.COUNTER_WIDTH( ADDRESS_WIDTH )
    ) GrayCounter_pWr (
        .GrayCount_out(pNextWordToWrite),
        .Enable_in(NextWriteAddressEn),
        .rst(rst),
        
        .Clk(wr_clk)
       );
       
    graycounter #(
		.COUNTER_WIDTH( ADDRESS_WIDTH )
    ) GrayCounter_pRd (
        .GrayCount_out(pNextWordToRead),
        .Enable_in(NextReadAddressEn),
        .rst(rst),
        .Clk(rd_clk)
       );
     

    //'EqualAddresses' logic:
    assign EqualAddresses = (pNextWordToWrite == pNextWordToRead);

    //'Quadrant selectors' logic:
    assign Set_Status = (pNextWordToWrite[ADDRESS_WIDTH-2] ~^ pNextWordToRead[ADDRESS_WIDTH-1]) &
                         (pNextWordToWrite[ADDRESS_WIDTH-1] ^  pNextWordToRead[ADDRESS_WIDTH-2]);
                            
    assign Rst_Status = (pNextWordToWrite[ADDRESS_WIDTH-2] ^  pNextWordToRead[ADDRESS_WIDTH-1]) &
                         (pNextWordToWrite[ADDRESS_WIDTH-1] ~^ pNextWordToRead[ADDRESS_WIDTH-2]);
                         
    //'Status' latch logic:
    always @ (Set_Status, Rst_Status, rst) //D Latch w/ Asynchronous Clear & Preset.
        if (Rst_Status | rst)
            Status = 0;  //Going 'Empty'.
        else if (Set_Status)
            Status = 1;  //Going 'Full'.
            
    //'full' logic for the writing port:
    assign PresetFull = Status & EqualAddresses;  //'Full' Fifo.
    
    always @ (posedge wr_clk, posedge PresetFull) //D Flip-Flop w/ Asynchronous Preset.
        if (PresetFull)
            full <= 1;
        else
            full <= 0;
            
    //'empty' logic for the reading port:
    assign PresetEmpty = ~Status & EqualAddresses;  //'Empty' Fifo.
    
    always @ (posedge rd_clk, posedge PresetEmpty)  //D Flip-Flop w/ Asynchronous Preset.
        if (PresetEmpty)
            empty <= 1;
        else
            empty <= 0;

endmodule
