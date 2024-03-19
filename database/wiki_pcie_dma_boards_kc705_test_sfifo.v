//---------------------------------------------------------------------------
//##module FIFO
//---------------------------------------------------------------------------
module FIFO(
//  NAME            //I/O     Description
    CLK,            //in      System Clock
    nRST,           //in      Reset
    D,              //in      Data
    Q,              //out     Data
    WR,             //in      Write Request
    RD,             //in      Read Request
    FULL,           //out     Full Flag
    EMPTY           //out     Empty Flag
);
//---------------------------------------------------------------------------
//#parameter
//---------------------------------------------------------------------------
    parameter width       =8;               //Data bus width
    parameter widthad     =9;               //Address bus width
    parameter numwords    =512;             //Number of words  2^lpm_widthad

//---------------------------------------------------------------------------
//#port
//---------------------------------------------------------------------------
    input                   CLK;
    input                   nRST;
    input   [width-1:0]     D;
    output  [width-1:0]     Q;
    input                   WR;
    input                   RD;
    output                  FULL;
    output                  EMPTY;

//---------------------------------------------------------------------------
//#wire
//---------------------------------------------------------------------------
    wire    [width-1:0]    Q;
    wire    [widthad:0]    CNT;         //Num Of Used Buffer
    wire                   FULL;
    wire                   EMPTY;
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
    always  @( posedge CLK or negedge nRST ) begin
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
endmodule //End of FIFO
