// This program was cloned from: https://github.com/shuji-oh/PLI_TDC_for_CAN
// License: MIT License

//---------------------------------------------------------------------------
//##module FIFO
//---------------------------------------------------------------------------
module fifo(
    input CLK,            //in      System Clock
    input nRST,           //in      Reset
    input [33:0] D,              //in      Data
    output [33:0] Q,              //out     Data
    input WR,             //in      Write Request
    input RD,             //in      Read Request
    output FULL,           //out     Full Flag
    output EMPTY           //out     Empty Flag
);
//---------------------------------------------------------------------------
//#parameter
//---------------------------------------------------------------------------
    parameter width       =34;               //Data bus width
    parameter widthad     =9;               //Address bus width
    parameter numwords    =1156;             //Number of words  2^lpm_widthad

//---------------------------------------------------------------------------
//#wire
//---------------------------------------------------------------------------
    wire    [widthad:0]    CNT;         //Num Of Used Buffer
    wire    [widthad-1:0]  WP;          //Write Pointer
    wire    [widthad-1:0]  RP;          //Read Pointer

//---------------------------------------------------------------------------
//#reg
//---------------------------------------------------------------------------
    reg     [widthad:0]    WCNT;
    reg     [widthad:0]    RCNT;
    reg     [width-1:0]    DATA    [numwords-1:0];

//---------------------------------------------------------------------------
//#assign
//---------------------------------------------------------------------------
    assign  Q = DATA[RP];
    assign  CNT = WCNT - RCNT;
    assign  FULL  = CNT[widthad];
    assign  EMPTY = (CNT==0);
    assign  WP[widthad-1:0] = WCNT[widthad-1:0];
    assign  RP[widthad-1:0] = RCNT[widthad-1:0];

//---------------------------------------------------------------------------
//#always
//---------------------------------------------------------------------------
    always  @( negedge CLK or negedge nRST ) begin
        if ( !nRST ) begin
            WCNT      <= 0;
            RCNT      <= 0;
        end
        else begin
            if(WR & ~FULL)begin
                DATA[WP] <= D;
                WCNT <= WCNT + 1;
            end
            if(RD & ~EMPTY)begin
                RCNT <= RCNT + 1;
            end
        end
    end
endmodule 
