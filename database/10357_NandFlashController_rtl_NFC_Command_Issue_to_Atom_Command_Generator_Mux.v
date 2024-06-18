// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module NFC_Atom_Command_Issue_to_Atom_Command_Generator_Mux
#
(
    parameter NumofCMD = 14, // number of blocking commands
    parameter NumberOfWays    =   4
)
(
	iCMD_Active                ,

    iACG_Idle_Command          ,  
    iACG_Idle_CommandOption    ,  
    iACG_Idle_TargetWay        ,  
    iACG_Idle_NumOfData        ,  
    iACG_Idle_CASelect         ,  
    iACG_Idle_CAData           ,  

    iACG_Idle_WriteData        ,  
    iACG_Idle_WriteLast        ,  
    iACG_Idle_WriteValid       ,  

    iACG_Idle_ReadReady        ,

	iACG_Reset_Command         ,
	iACG_Reset_CommandOption   ,
	iACG_Reset_TargetWay       ,
	iACG_Reset_NumOfData       ,
	iACG_Reset_CASelect        ,
	iACG_Reset_CAData          ,

    iACG_STF_Command         ,
    iACG_STF_CommandOption   ,
    iACG_STF_TargetWay       ,
    iACG_STF_NumOfData       ,
    iACG_STF_CASelect        ,
    iACG_STF_CAData          ,

    iACG_STF_WriteData        ,  
    iACG_STF_WriteLast        ,  
    iACG_STF_WriteValid       ,  

    iACG_Prog_Command         ,
    iACG_Prog_CommandOption   ,
    iACG_Prog_TargetWay       ,
    iACG_Prog_NumOfData       ,
    iACG_Prog_CASelect        ,
    iACG_Prog_CAData          ,

    iACG_Read_Command         ,
    iACG_Read_CommandOption   ,
    iACG_Read_TargetWay       ,
    iACG_Read_NumOfData       ,
    iACG_Read_CASelect        ,
    iACG_Read_CAData          ,

    iACG_GTF_Command         ,
    iACG_GTF_CommandOption   ,
    iACG_GTF_TargetWay       ,
    iACG_GTF_NumOfData       ,
    iACG_GTF_CASelect        ,
    iACG_GTF_CAData          ,

    iACG_EB_Command         ,
    iACG_EB_CommandOption   ,
    iACG_EB_TargetWay       ,
    iACG_EB_NumOfData       ,
    iACG_EB_CASelect        ,
    iACG_EB_CAData          ,

    iACG_RS_Command         ,
    iACG_RS_CommandOption   ,
    iACG_RS_TargetWay       ,
    iACG_RS_NumOfData       ,
    iACG_RS_CASelect        ,
    iACG_RS_CAData          ,

    iFifo_WriteData     ,  
    iFifo_WriteLast     ,  
    iFifo_WriteValid    ,  

    oCI_ACG_Command          ,  
    oCI_ACG_CommandOption    ,  
    oCI_ACG_TargetWay        ,  
    oCI_ACG_NumOfData        ,  
    oCI_ACG_CASelect         ,  
    oCI_ACG_CAData           ,  

    oCI_ACG_WriteData        ,  
    oCI_ACG_WriteLast        ,  
    oCI_ACG_WriteValid       ,  

    oCI_ACG_ReadReady        
);

	input  [NumofCMD - 1:0]        iCMD_Active                ;

	// Idle
    input   [7:0]                   iACG_Idle_Command          ;
    input   [2:0]                   iACG_Idle_CommandOption    ;
    input   [NumberOfWays - 1:0]    iACG_Idle_TargetWay        ;
    input   [15:0]                  iACG_Idle_NumOfData        ;
    input                           iACG_Idle_CASelect         ;
    input   [39:0]                  iACG_Idle_CAData           ;

    input   [15:0]                  iACG_Idle_WriteData        ;
    input                           iACG_Idle_WriteLast        ;
    input                           iACG_Idle_WriteValid       ;

    input                           iACG_Idle_ReadReady        ;

    // Reset
    input   [7:0]                   iACG_Reset_Command         ;
    input   [2:0]                   iACG_Reset_CommandOption   ;
    input   [NumberOfWays - 1:0]    iACG_Reset_TargetWay       ;
    input   [15:0]                  iACG_Reset_NumOfData       ;
    input                           iACG_Reset_CASelect        ;
    input   [39:0]                  iACG_Reset_CAData          ;


    input   [7:0]                   iACG_STF_Command          ;
    input   [2:0]                   iACG_STF_CommandOption    ;
    input   [NumberOfWays - 1:0]    iACG_STF_TargetWay        ;
    input   [15:0]                  iACG_STF_NumOfData        ;
    input                           iACG_STF_CASelect         ;
    input   [39:0]                  iACG_STF_CAData           ;

    input   [15:0]                  iACG_STF_WriteData        ;
    input                           iACG_STF_WriteLast        ;
    input                           iACG_STF_WriteValid       ;

    input   [7:0]                   iACG_Prog_Command         ;
    input   [2:0]                   iACG_Prog_CommandOption   ;
    input   [NumberOfWays - 1:0]    iACG_Prog_TargetWay       ;
    input   [15:0]                  iACG_Prog_NumOfData       ;
    input                           iACG_Prog_CASelect        ;
    input   [39:0]                  iACG_Prog_CAData          ;

    input   [7:0]                   iACG_Read_Command         ;
    input   [2:0]                   iACG_Read_CommandOption   ;
    input   [NumberOfWays - 1:0]    iACG_Read_TargetWay       ;
    input   [15:0]                  iACG_Read_NumOfData       ;
    input                           iACG_Read_CASelect        ;
    input   [39:0]                  iACG_Read_CAData          ;

    input   [7:0]                   iACG_GTF_Command         ;
    input   [2:0]                   iACG_GTF_CommandOption   ;
    input   [NumberOfWays - 1:0]    iACG_GTF_TargetWay       ;
    input   [15:0]                  iACG_GTF_NumOfData       ;
    input                           iACG_GTF_CASelect        ;
    input   [39:0]                  iACG_GTF_CAData          ;

    input   [7:0]                   iACG_EB_Command         ;
    input   [2:0]                   iACG_EB_CommandOption   ;
    input   [NumberOfWays - 1:0]    iACG_EB_TargetWay       ;
    input   [15:0]                  iACG_EB_NumOfData       ;
    input                           iACG_EB_CASelect        ;
    input   [39:0]                  iACG_EB_CAData          ;

    input   [7:0]                   iACG_RS_Command         ;
    input   [2:0]                   iACG_RS_CommandOption   ;
    input   [NumberOfWays - 1:0]    iACG_RS_TargetWay       ;
    input   [15:0]                  iACG_RS_NumOfData       ;
    input                           iACG_RS_CASelect        ;
    input   [39:0]                  iACG_RS_CAData          ;

    input   [15:0]                  iFifo_WriteData           ;
    input                           iFifo_WriteLast           ;
    input                           iFifo_WriteValid          ;

    output   [7:0]                  oCI_ACG_Command             ;
    output   [2:0]                  oCI_ACG_CommandOption       ;
    output   [NumberOfWays - 1:0]   oCI_ACG_TargetWay           ;
    output   [15:0]                 oCI_ACG_NumOfData           ;
    output                          oCI_ACG_CASelect            ;
    output   [39:0]                 oCI_ACG_CAData              ;

    output   [15:0]                 oCI_ACG_WriteData           ;
    output                          oCI_ACG_WriteLast           ;
    output                          oCI_ACG_WriteValid          ;

    output                          oCI_ACG_ReadReady           ;



    reg   [7:0]                  rCI_ACG_Command             ;
    reg   [2:0]                  rCI_ACG_CommandOption       ;
    reg   [NumberOfWays - 1:0]   rCI_ACG_TargetWay           ;
    reg   [15:0]                 rCI_ACG_NumOfData           ;
    reg                          rCI_ACG_CASelect            ;
    reg   [39:0]                 rCI_ACG_CAData              ;

    reg   [15:0]                 rCI_ACG_WriteData           ;
    reg                          rCI_ACG_WriteLast           ;
    reg                          rCI_ACG_WriteValid          ;

    reg                          rCI_ACG_ReadReady           ;


    always @ (*) begin
        if          (iCMD_Active[13]) begin rCI_ACG_Command <= iACG_Reset_Command;
        end else if (iCMD_Active[12]) begin rCI_ACG_Command <= iACG_STF_Command;
        end else if (iCMD_Active[11]) begin rCI_ACG_Command <= iACG_Prog_Command;
        end else if (iCMD_Active[10]) begin rCI_ACG_Command <= iACG_Read_Command;
        end else if (iCMD_Active[ 9]) begin rCI_ACG_Command <= iACG_GTF_Command;
        end else if (iCMD_Active[ 8]) begin rCI_ACG_Command <= iACG_EB_Command;
        end else if (iCMD_Active[ 7]) begin rCI_ACG_Command <= iACG_RS_Command;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_Command <= rCI_ACG_Command;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_Command <= rCI_ACG_Command;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_Command <= rCI_ACG_Command;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_Command <= rCI_ACG_Command;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_Command <= rCI_ACG_Command;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_Command <= rCI_ACG_Command;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_Command <= rCI_ACG_Command;
        end else                      begin rCI_ACG_Command <= iACG_Idle_Command;
        end
    end

    always @ (*) begin
        if          (iCMD_Active[13]) begin rCI_ACG_CommandOption <= 0;
        end else if (iCMD_Active[12]) begin rCI_ACG_CommandOption <= 0;
        end else if (iCMD_Active[11]) begin rCI_ACG_CommandOption <= iACG_Prog_CommandOption;
        end else if (iCMD_Active[10]) begin rCI_ACG_CommandOption <= iACG_Read_CommandOption;
        end else if (iCMD_Active[ 9]) begin rCI_ACG_CommandOption <= iACG_GTF_CommandOption;
        end else if (iCMD_Active[ 8]) begin rCI_ACG_CommandOption <= iACG_EB_CommandOption;
        end else if (iCMD_Active[ 7]) begin rCI_ACG_CommandOption <= iACG_RS_CommandOption;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_CommandOption <= rCI_ACG_CommandOption;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_CommandOption <= rCI_ACG_CommandOption;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_CommandOption <= rCI_ACG_CommandOption;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_CommandOption <= rCI_ACG_CommandOption;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_CommandOption <= rCI_ACG_CommandOption;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_CommandOption <= rCI_ACG_CommandOption;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_CommandOption <= rCI_ACG_CommandOption;
        end else                      begin rCI_ACG_CommandOption <= 0;
        end
    end

    always @ (*) begin
        if          (iCMD_Active[13]) begin rCI_ACG_TargetWay <= iACG_Reset_TargetWay;
        end else if (iCMD_Active[12]) begin rCI_ACG_TargetWay <= iACG_STF_TargetWay;
        end else if (iCMD_Active[11]) begin rCI_ACG_TargetWay <= iACG_Prog_TargetWay;
        end else if (iCMD_Active[10]) begin rCI_ACG_TargetWay <= iACG_Read_TargetWay;
        end else if (iCMD_Active[ 9]) begin rCI_ACG_TargetWay <= iACG_GTF_TargetWay;
        end else if (iCMD_Active[ 8]) begin rCI_ACG_TargetWay <= iACG_EB_TargetWay;
        end else if (iCMD_Active[ 7]) begin rCI_ACG_TargetWay <= iACG_RS_TargetWay;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_TargetWay <= rCI_ACG_TargetWay;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_TargetWay <= rCI_ACG_TargetWay;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_TargetWay <= rCI_ACG_TargetWay;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_TargetWay <= rCI_ACG_TargetWay;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_TargetWay <= rCI_ACG_TargetWay;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_TargetWay <= rCI_ACG_TargetWay;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_TargetWay <= rCI_ACG_TargetWay;
        end else                      begin rCI_ACG_TargetWay <= iACG_Idle_TargetWay;
        end
    end

    always @ (*) begin
        if          (iCMD_Active[13]) begin rCI_ACG_NumOfData <= iACG_Reset_NumOfData;
        end else if (iCMD_Active[12]) begin rCI_ACG_NumOfData <= iACG_STF_NumOfData;
        end else if (iCMD_Active[11]) begin rCI_ACG_NumOfData <= iACG_Prog_NumOfData;
        end else if (iCMD_Active[10]) begin rCI_ACG_NumOfData <= iACG_Read_NumOfData;
        end else if (iCMD_Active[ 9]) begin rCI_ACG_NumOfData <= iACG_GTF_NumOfData;
        end else if (iCMD_Active[ 8]) begin rCI_ACG_NumOfData <= iACG_EB_NumOfData;
        end else if (iCMD_Active[ 7]) begin rCI_ACG_NumOfData <= iACG_RS_NumOfData;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_NumOfData <= rCI_ACG_NumOfData;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_NumOfData <= rCI_ACG_NumOfData;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_NumOfData <= rCI_ACG_NumOfData;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_NumOfData <= rCI_ACG_NumOfData;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_NumOfData <= rCI_ACG_NumOfData;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_NumOfData <= rCI_ACG_NumOfData;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_NumOfData <= rCI_ACG_NumOfData;
        end else                      begin rCI_ACG_NumOfData <= iACG_Idle_NumOfData;
        end
    end

    always @ (*) begin
        if          (iCMD_Active[13]) begin rCI_ACG_CASelect <= iACG_Reset_CASelect;
        end else if (iCMD_Active[12]) begin rCI_ACG_CASelect <= iACG_STF_CASelect;
        end else if (iCMD_Active[11]) begin rCI_ACG_CASelect <= iACG_Prog_CASelect;
        end else if (iCMD_Active[10]) begin rCI_ACG_CASelect <= iACG_Read_CASelect;
        end else if (iCMD_Active[ 9]) begin rCI_ACG_CASelect <= iACG_GTF_CASelect;
        end else if (iCMD_Active[ 8]) begin rCI_ACG_CASelect <= iACG_EB_CASelect;
        end else if (iCMD_Active[ 7]) begin rCI_ACG_CASelect <= iACG_RS_CASelect;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_CASelect <= rCI_ACG_CASelect;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_CASelect <= rCI_ACG_CASelect;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_CASelect <= rCI_ACG_CASelect;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_CASelect <= rCI_ACG_CASelect;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_CASelect <= rCI_ACG_CASelect;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_CASelect <= rCI_ACG_CASelect;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_CASelect <= rCI_ACG_CASelect;
        end else                      begin rCI_ACG_CASelect <= iACG_Idle_CASelect;
        end
    end

    always @ (*) begin
        if          (iCMD_Active[13]) begin rCI_ACG_CAData <= iACG_Reset_CAData;
        end else if (iCMD_Active[12]) begin rCI_ACG_CAData <= iACG_STF_CAData;
        end else if (iCMD_Active[11]) begin rCI_ACG_CAData <= iACG_Prog_CAData;
        end else if (iCMD_Active[10]) begin rCI_ACG_CAData <= iACG_Read_CAData;
        end else if (iCMD_Active[ 9]) begin rCI_ACG_CAData <= iACG_GTF_CAData;
        end else if (iCMD_Active[ 8]) begin rCI_ACG_CAData <= iACG_EB_CAData;
        end else if (iCMD_Active[ 7]) begin rCI_ACG_CAData <= iACG_RS_CAData;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_CAData <= rCI_ACG_CAData;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_CAData <= rCI_ACG_CAData;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_CAData <= rCI_ACG_CAData;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_CAData <= rCI_ACG_CAData;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_CAData <= rCI_ACG_CAData;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_CAData <= rCI_ACG_CAData;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_CAData <= rCI_ACG_CAData;
        end else                      begin rCI_ACG_CAData <= iACG_Idle_CAData;
        end
    end

    always @ (*) begin
        // if          (iCMD_Active[13]) begin rCI_ACG_WriteData <= iACG_Idle_WriteData;
        // end else 
        if (iCMD_Active[12]) begin rCI_ACG_WriteData <= iACG_STF_WriteData;
        end else if (iCMD_Active[11]) begin rCI_ACG_WriteData <= iFifo_WriteData;
        // end else if (iCMD_Active[10]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 7]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_WriteData <= rCI_ACG_WriteData;
        end else                      begin rCI_ACG_WriteData <= iACG_Idle_WriteData;
        end
    end

    always @ (*) begin
        // if          (iCMD_Active[13]) begin rCI_ACG_WriteLast <= iACG_STF_WriteLast;
        // end else 
        if (iCMD_Active[12]) begin rCI_ACG_WriteLast <= iACG_STF_WriteLast;
        end else if (iCMD_Active[11]) begin rCI_ACG_WriteLast <= iFifo_WriteLast;
        // end else if (iCMD_Active[10]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 7]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_WriteLast <= rCI_ACG_WriteLast;
        end else                      begin rCI_ACG_WriteLast <= iACG_Idle_WriteLast;
        end
    end

    always @ (*) begin
        // if          (iCMD_Active[13]) begin rCI_ACG_WriteValid <= iACG_STF_WriteValid;
        // end else 
        if (iCMD_Active[12]) begin rCI_ACG_WriteValid <= iACG_STF_WriteValid;
        end else if (iCMD_Active[11]) begin rCI_ACG_WriteValid <= iFifo_WriteValid;
        // end else if (iCMD_Active[10]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 7]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_WriteValid <= rCI_ACG_WriteValid;
        end else                      begin rCI_ACG_WriteValid <= iACG_Idle_WriteValid;
        end
    end

    always @ (*) begin
        // if          (iCMD_Active[13]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[12]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[11]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[10]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 8]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 7]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 6]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 5]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 4]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 3]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 2]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 1]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else if (iCMD_Active[ 0]) begin rCI_ACG_ReadReady <= rCI_ACG_ReadReady;
        // end else                      begin 
        rCI_ACG_ReadReady <= 1;
        // end

    end

	assign oCI_ACG_Command       = rCI_ACG_Command             ;     
	assign oCI_ACG_CommandOption = rCI_ACG_CommandOption       ;     
	assign oCI_ACG_TargetWay     = rCI_ACG_TargetWay           ;     
	assign oCI_ACG_NumOfData     = rCI_ACG_NumOfData           ;     
	assign oCI_ACG_CASelect      = rCI_ACG_CASelect            ;     
	assign oCI_ACG_CAData        = rCI_ACG_CAData              ;     
	assign oCI_ACG_WriteData     = rCI_ACG_WriteData           ;     
	assign oCI_ACG_WriteLast     = rCI_ACG_WriteLast           ;     
	assign oCI_ACG_WriteValid    = rCI_ACG_WriteValid          ;     
	assign oCI_ACG_ReadReady     = rCI_ACG_ReadReady           ;   


endmodule
