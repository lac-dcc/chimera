`timescale 1ns / 1ps

module CP0(clk,reset,CP0We,EXL_Clr,IP,ExcCode,BD,Start,CP0_A1,CP0_A3,CP0_WD,PC_RAW,IRQ,CP0_RD,CP0_EPC);
//input
    input clk;
    input reset;

    input CP0We;            //support mtc0

    input EXL_Clr;

    input [7:2] IP;         //peripheral devices' interrupt request
    
    input [6:2] ExcCode;    //exception code
    input BD;               //whether exception occurs in delay slot 
    input Start;

    input [4:0] CP0_A1;     //reg to read
    input [4:0] CP0_A3;     //reg to write
    input [31:0] CP0_WD;
    
    input [31:0] PC_RAW;

//output
    output IRQ;             //interrupt request

    output [31:0] CP0_RD;
    output [31:0] CP0_EPC;

//sequential logic
    parameter SR=12,
              Cause=13,
              EPC=14,
              PRId=15;

    integer i;

    reg [31:0] CP0Mem[0:31];

    wire [31:0] PC;        //When 4 !| PC_RAW, PC is justified PC_RAW.

    wire [15:10] IM;
    wire EXL;
    wire IE;

    wire INT;   //interrupt
    wire EXC;   //exception

    wire [31:0] SR_detect;
    wire [31:0] Cause_detect;
    wire [31:0] EPC_detect;
    wire [31:0] PRId_detect;

    assign PC=(PC_RAW>>2)<<2;

    assign IM=CP0Mem[SR][15:10];
    assign EXL=CP0Mem[SR][1];
    assign IE=CP0Mem[SR][0];    

    assign INT=(IP&IM)&&(!EXL)&&IE;
    assign EXC=ExcCode&&(!EXL);         //when IM&IE is zero,exception can still happen

    assign IRQ=INT||EXC;

    assign CP0_RD=CP0Mem[CP0_A1];
    assign CP0_EPC=CP0Mem[EPC];

    assign SR_detect=CP0Mem[SR];
    assign Cause_detect=CP0Mem[Cause];
    assign EPC_detect=CP0Mem[EPC];
    assign PRId_detect=CP0Mem[PRId];

    always @(posedge clk)
        begin
            if(reset)
                begin
                    i=0;
                    while(i<32)
                        begin
                            CP0Mem[i]<=0;
                            i=i+1;
                        end
                    //PRId
                    CP0Mem[PRId]<=32'h20000217;
                end
            else if(INT)
                begin
                //SR
                    CP0Mem[SR][1]<=1;               //EXL
                //Cause
                    CP0Mem[Cause][15:10]<=IP;       //IP
                    CP0Mem[Cause][6:2]<=0;          //ExcCode
                    CP0Mem[Cause][31]<=BD;          //BD
                //EPC
                    if(PC<32'h0000_3000||PC>=32'h0000_4180)CP0Mem[EPC]<=CP0Mem[EPC];    //prevent continuous IRQ changing EPC
                    else if(ExcCode==0)
                        begin
                            if(BD)CP0Mem[EPC]<=PC-4;        //EPC
                            else if(Start==1) CP0Mem[EPC]<=PC+4;    //MD ins have already finished the function in EXE
                            else CP0Mem[EPC]<=PC;
                        end
                    else
                        begin
                            if(BD)CP0Mem[EPC]<=PC-4;        //EPC
                            else CP0Mem[EPC]<=PC;
                        end
                end
            else if(EXC)
                begin
                //SR
                    CP0Mem[SR][1]<=1;               //EXL
                //Cause
                    CP0Mem[Cause][15:10]<=IP;       //IP
                    CP0Mem[Cause][6:2]<=ExcCode;    //ExcCode
                    CP0Mem[Cause][31]<=BD;          //BD
                //EPC
                    if(PC<32'h0000_3000||PC>=32'h0000_4180)CP0Mem[EPC]<=CP0Mem[EPC];
                    else
                        begin
                            if(BD)CP0Mem[EPC]<=PC-4;        //EPC
                            else CP0Mem[EPC]<=PC;
                        end
                end
            else if(EXL_Clr)
                begin
                //SR
                    CP0Mem[SR][1]<=0;               //EXL
                //Cause
                    CP0Mem[Cause][15:10]<=IP;       //IP
                end
            else if(CP0We)
                begin
                    CP0Mem[Cause][15:10]<=IP;       //IP
                    case(CP0_A3)        //when write to undefined reg,return 0.
                        SR:CP0Mem[SR]<=CP0_WD;
                        EPC:CP0Mem[EPC]<=(CP0_WD>>2)<<2;
                    endcase
                end
            else 
                begin
                    CP0Mem[SR]<=CP0Mem[SR];
                    CP0Mem[Cause][15:10]<=IP;       //IP
                    CP0Mem[EPC]<=CP0Mem[EPC];
                end
        end

endmodule