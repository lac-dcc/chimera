// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps


module NandFlashController_Interface_adapter
#
(
    parameter NumberOfWays         = 2
)
(
	iSystemClock ,
	iReset       ,

	iAxilValid   ,
	iCommand     ,
	iCommandValid,
	iAddress     ,
	iLength      ,
	oCommandFail ,
	// iDMARAddress ,
	// iDMAWAddress ,
	oNFCStatus   ,
	oNandRBStatus,
	
	
	oOpcode      ,
	oTargetID    ,
	oSourceID    ,
	oAddress     ,
	oLength      ,
	oCMDValid    ,
	iCMDReady    ,

    iStatus      ,
    iStatusValid ,
    
    iReadyBusy   
);

	input                          iSystemClock ;
	input                          iReset ;

	input                          iAxilValid   ;
	input   [31:0]                 iCommand     ;
	input                          iCommandValid;
	input   [31:0]                 iAddress     ;
	input   [15:0]                 iLength      ;
	output                         oCommandFail ;
	// input   [31:0]                 iDMARAddress ;
	// input   [31:0]                 iDMAWAddress ;
	output  [31:0]                 oNFCStatus   ;
	output  [31:0]                 oNandRBStatus;
	
	output  [5:0]                  oOpcode      ;
	output  [4:0]                  oTargetID    ;
	output  [4:0]                  oSourceID    ;
	output  [31:0]                 oAddress     ;
	output  [15:0]                 oLength      ;
	output                         oCMDValid    ;
	input                          iCMDReady    ;
	
	input   [23:0]                 iStatus      ;
	input                          iStatusValid ;
	
	input   [NumberOfWays - 1:0]   iReadyBusy   ;

	reg                            rCommandFail ;
	reg  [5:0]                     rOpcode      ;
	reg  [4:0]                     rTargetID    ;
	reg  [4:0]                     rSourceID    ;
	reg  [31:0]                    rAddress     ;
	reg  [15:0]                    rLength      ;
	reg                            rCMDValid    ;

	reg  [31:0]                    rNFCStatus   ;
	reg  [31:0]                    rNandRBStatus;

    always @ (posedge iSystemClock) begin
        if (iReset) begin
			rOpcode      <= 0;   
			rTargetID    <= 0;   
			rSourceID    <= 0;   
			rAddress     <= 0;   
			rLength      <= 0;   
			rCMDValid    <= 0;  
			rCommandFail <= 0; 
        end else if (iAxilValid) begin
			rOpcode   <= iCommand[5:0];   
			rTargetID <= iCommand[4+16:16];   
			rSourceID <= 0;   
			rAddress  <= iAddress;   
			rLength   <= iLength; 
			if (iCommandValid)  
				if (iCMDReady) begin
					rCMDValid <= 0;
					rCommandFail <= 1;
				end else begin
					rCMDValid <= 1;
					rCommandFail <= 0;
				end
			else begin
				rCommandFail <= 0;
				rCMDValid <= 0;   
			end
				
        end else begin
			rOpcode      <= rOpcode     ;   
			rTargetID    <= rTargetID   ;   
			rSourceID    <= rSourceID   ;   
			rAddress     <= rAddress    ;   
			rLength      <= rLength     ;   
			rCMDValid    <= 0           ;  
			rCommandFail <= rCommandFail;
        end
    end

    always @ (posedge iSystemClock) begin
    	if (iStatusValid) 
    		rNFCStatus <= {iStatus, 7'd0, iCMDReady};
    	else begin
    		rNFCStatus <= {rNFCStatus[31:8], 7'd0, iCMDReady};
    	end
    	rNandRBStatus <= iReadyBusy;
    end

	assign oNFCStatus    = rNFCStatus   ;
	assign oNandRBStatus = rNandRBStatus;
	
	assign oCommandFail  = rCommandFail ;
	assign oOpcode       = rOpcode      ;
	assign oTargetID     = rTargetID    ;
	assign oSourceID     = rSourceID    ;
	assign oAddress      = rAddress     ;
	assign oLength       = rLength      ;
	assign oCMDValid     = rCMDValid    ;

endmodule