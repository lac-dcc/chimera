`timescale 1ns / 1ps

module NFC_Atom_Command_Generator_to_Physical_Mux
#
(
    parameter NumberOfWays    =   4
)
(
    iCI_ACG_Command             ,

    // iCI_ACG_WriteData           ,
    // iCI_ACG_WriteLast           ,
    // iCI_ACG_WriteValid          ,
    oACG_CI_WriteReady          ,

    iDLE_DQSOutEnable           ,
    iDLE_DQOutEnable            ,
    iDLE_DQStrobe               ,
    iDLE_DQ                     ,
    iDLE_ChipEnable             ,
    iDLE_ReadEnable             ,
    iDLE_WriteEnable            ,
    iDLE_AddressLatchEnable     ,
    iDLE_CommandLatchEnable     ,

    iDLE_DelayTapLoad           ,
    iDLE_DelayTap               ,

    iACA_DQSOutEnable           ,
    iACA_DQOutEnable            ,
    iACA_DQStrobe               ,
    iACA_DQ                     ,
    iACA_ChipEnable             ,
    iACA_ReadEnable             ,
    iACA_WriteEnable            ,
    iACA_AddressLatchEnable     ,
    iACA_CommandLatchEnable     ,

    iACS_DQSOutEnable           ,
    iACS_DQOutEnable            ,
    iACS_DQStrobe               ,
    iACS_DQ                     ,
    iACS_ChipEnable             ,
    iACS_ReadEnable             ,
    iACS_WriteEnable            ,
    iACS_AddressLatchEnable     ,
    iACS_CommandLatchEnable     ,

    // oDOA_WriteData              ,
    // oDOA_WriteLast              ,
    // oDOA_WriteValid             ,
    iDOA_WriteReady             ,

    iDOA_DQSOutEnable           ,
    iDOA_DQOutEnable            ,
    iDOA_DQStrobe               ,
    iDOA_DQ                     ,
    iDOA_ChipEnable             ,
    iDOA_ReadEnable             ,
    iDOA_WriteEnable            ,
    iDOA_AddressLatchEnable     ,
    iDOA_CommandLatchEnable     ,

    // oDOS_WriteData              ,
    // oDOS_WriteLast              ,
    // oDOS_WriteValid             ,
    iDOS_WriteReady             ,

    iDOS_DQSOutEnable           ,
    iDOS_DQOutEnable            ,
    iDOS_DQStrobe               ,
    iDOS_DQ                     ,
    iDOS_ChipEnable             ,
    iDOS_ReadEnable             ,
    iDOS_WriteEnable            ,
    iDOS_AddressLatchEnable     ,
    iDOS_CommandLatchEnable     ,

    iDIA_DQSOutEnable           ,
    iDIA_DQOutEnable            ,
    iDIA_DQStrobe               ,
    iDIA_DQ                     ,
    iDIA_ChipEnable             ,
    iDIA_ReadEnable             ,
    iDIA_WriteEnable            ,
    iDIA_AddressLatchEnable     ,
    iDIA_CommandLatchEnable     ,

    iDIS_DQSOutEnable           ,
    iDIS_DQOutEnable            ,
    iDIS_DQStrobe               ,
    iDIS_DQ                     ,
    iDIS_ChipEnable             ,
    iDIS_ReadEnable             ,
    iDIS_WriteEnable            ,
    iDIS_AddressLatchEnable     ,
    iDIS_CommandLatchEnable     ,

    oACG_PHY_DQSOutEnable       ,
    oACG_PHY_DQOutEnable        ,
    oACG_PHY_DQStrobe           ,
    oACG_PHY_DQ                 ,
    oACG_PHY_ChipEnable         ,
    oACG_PHY_ReadEnable         ,
    oACG_PHY_WriteEnable        ,
    oACG_PHY_AddressLatchEnable ,
    oACG_PHY_CommandLatchEnable ,

    oACG_PHY_BUFF_WE            ,

    oACG_PHY_DelayTapLoad       ,
    oACG_PHY_DelayTap           


);
    input  [7:0]                   iCI_ACG_Command             ;

    // input   [31:0]                 iCI_ACG_WriteData           ;
    // input                          iCI_ACG_WriteLast           ;
    // input                          iCI_ACG_WriteValid          ;
    output                         oACG_CI_WriteReady          ;

    input                          iDLE_DQSOutEnable           ;
    input                          iDLE_DQOutEnable            ;
    input  [7:0]                   iDLE_DQStrobe               ;
    input  [31:0]                  iDLE_DQ                     ;
    input  [2*NumberOfWays - 1:0]  iDLE_ChipEnable             ;
    input  [3:0]                   iDLE_ReadEnable             ;
    input  [3:0]                   iDLE_WriteEnable            ;
    input  [3:0]                   iDLE_AddressLatchEnable     ;
    input  [3:0]                   iDLE_CommandLatchEnable     ;

    input                          iDLE_DelayTapLoad           ;
    input  [4:0]                   iDLE_DelayTap               ;

    input                          iACA_DQSOutEnable           ;
    input                          iACA_DQOutEnable            ;
    input  [7:0]                   iACA_DQStrobe               ;
    input  [31:0]                  iACA_DQ                     ;
    input  [2*NumberOfWays - 1:0]  iACA_ChipEnable             ;
    input  [3:0]                   iACA_ReadEnable             ;
    input  [3:0]                   iACA_WriteEnable            ;
    input  [3:0]                   iACA_AddressLatchEnable     ;
    input  [3:0]                   iACA_CommandLatchEnable     ;

    input                          iACS_DQSOutEnable           ;
    input                          iACS_DQOutEnable            ;
    input  [7:0]                   iACS_DQStrobe               ;
    input  [31:0]                  iACS_DQ                     ;
    input  [2*NumberOfWays - 1:0]  iACS_ChipEnable             ;
    input  [3:0]                   iACS_ReadEnable             ;
    input  [3:0]                   iACS_WriteEnable            ;
    input  [3:0]                   iACS_AddressLatchEnable     ;
    input  [3:0]                   iACS_CommandLatchEnable     ;

    // output   [31:0]                oDOA_WriteData              ;
    // output                         oDOA_WriteLast              ;
    // output                         oDOA_WriteValid             ;
    input                          iDOA_WriteReady             ;

    input                          iDOA_DQSOutEnable           ;
    input                          iDOA_DQOutEnable            ;
    input  [7:0]                   iDOA_DQStrobe               ;
    input  [31:0]                  iDOA_DQ                     ;
    input  [2*NumberOfWays - 1:0]  iDOA_ChipEnable             ;
    input  [3:0]                   iDOA_ReadEnable             ;
    input  [3:0]                   iDOA_WriteEnable            ;
    input  [3:0]                   iDOA_AddressLatchEnable     ;
    input  [3:0]                   iDOA_CommandLatchEnable     ;

    // output   [31:0]                oDOS_WriteData              ;
    // output                         oDOS_WriteLast              ;
    // output                         oDOS_WriteValid             ;
    input                          iDOS_WriteReady             ;

    input                          iDOS_DQSOutEnable           ;
    input                          iDOS_DQOutEnable            ;
    input  [7:0]                   iDOS_DQStrobe               ;
    input  [31:0]                  iDOS_DQ                     ;
    input  [2*NumberOfWays - 1:0]  iDOS_ChipEnable             ;
    input  [3:0]                   iDOS_ReadEnable             ;
    input  [3:0]                   iDOS_WriteEnable            ;
    input  [3:0]                   iDOS_AddressLatchEnable     ;
    input  [3:0]                   iDOS_CommandLatchEnable     ;

    input                          iDIA_DQSOutEnable           ;
    input                          iDIA_DQOutEnable            ;
    input  [7:0]                   iDIA_DQStrobe               ;
    input  [31:0]                  iDIA_DQ                     ;
    input  [2*NumberOfWays - 1:0]  iDIA_ChipEnable             ;
    input  [3:0]                   iDIA_ReadEnable             ;
    input  [3:0]                   iDIA_WriteEnable            ;
    input  [3:0]                   iDIA_AddressLatchEnable     ;
    input  [3:0]                   iDIA_CommandLatchEnable     ;

    input                          iDIS_DQSOutEnable           ;
    input                          iDIS_DQOutEnable            ;
    input  [7:0]                   iDIS_DQStrobe               ;
    input  [31:0]                  iDIS_DQ                     ;
    input  [2*NumberOfWays - 1:0]  iDIS_ChipEnable             ;
    input  [3:0]                   iDIS_ReadEnable             ;
    input  [3:0]                   iDIS_WriteEnable            ;
    input  [3:0]                   iDIS_AddressLatchEnable     ;
    input  [3:0]                   iDIS_CommandLatchEnable     ;

    output                         oACG_PHY_DQSOutEnable       ;
    output                         oACG_PHY_DQOutEnable        ;
    output  [7:0]                  oACG_PHY_DQStrobe           ;
    output  [31:0]                 oACG_PHY_DQ                 ;
    output  [2*NumberOfWays - 1:0] oACG_PHY_ChipEnable         ;
    output  [3:0]                  oACG_PHY_ReadEnable         ;
    output  [3:0]                  oACG_PHY_WriteEnable        ;
    output  [3:0]                  oACG_PHY_AddressLatchEnable ;
    output  [3:0]                  oACG_PHY_CommandLatchEnable ;

    output                         oACG_PHY_BUFF_WE            ;

    output                         oACG_PHY_DelayTapLoad       ;
    output  [4:0]                  oACG_PHY_DelayTap           ;

    reg                            rACG_CI_WriteReady          ;

    // reg   [31:0]                   rDOA_WriteData              ;
    // reg                            rDOA_WriteLast              ;
    // reg                            rDOA_WriteValid             ;

    // reg   [31:0]                   rDOS_WriteData              ;
    // reg                            rDOS_WriteLast              ;
    // reg                            rDOS_WriteValid             ;

    reg                            rACG_PHY_DQSOutEnable       ;
    reg                            rACG_PHY_DQOutEnable        ;
    reg  [7:0]                     rACG_PHY_DQStrobe           ;
    reg  [31:0]                    rACG_PHY_DQ                 ;
    reg  [2*NumberOfWays - 1:0]    rACG_PHY_ChipEnable         ;
    reg  [3:0]                     rACG_PHY_ReadEnable         ;
    reg  [3:0]                     rACG_PHY_WriteEnable        ;
    reg  [3:0]                     rACG_PHY_AddressLatchEnable ;
    reg  [3:0]                     rACG_PHY_CommandLatchEnable ;

    reg                            rACG_PHY_BUFF_WE            ;

    reg                            rACG_PHY_DelayTapLoad       ;
    reg  [4:0]                     rACG_PHY_DelayTap           ;
    // iCI_ACG_Command[6]: C/A Latch async
    // iCI_ACG_Command[5]: Data Out  async
    // iCI_ACG_Command[4]: Data In   async

    // iCI_ACG_Command[3]: C/A Latch sync
    // iCI_ACG_Command[2]: Data Out  sync
    // iCI_ACG_Command[1]: Data In   sync

    // iCI_ACG_Command[0]: Timer
    
    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_DQSOutEnable <= iACA_DQSOutEnable;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_DQSOutEnable <= iDOA_DQSOutEnable;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_DQSOutEnable <= iDIA_DQSOutEnable;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_DQSOutEnable <= iACS_DQSOutEnable;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_DQSOutEnable <= iDOS_DQSOutEnable;
        end else if (iCI_ACG_Command[1]) begin rACG_PHY_DQSOutEnable <= iDIS_DQSOutEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_DQSOutEnable <= iDLE_DQSOutEnable;
        end else                         begin rACG_PHY_DQSOutEnable <= iDLE_DQSOutEnable;
        end
    end

    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_DQOutEnable <= iACA_DQOutEnable;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_DQOutEnable <= iDOA_DQOutEnable;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_DQOutEnable <= iDIA_DQOutEnable;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_DQOutEnable <= iACS_DQOutEnable;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_DQOutEnable <= iDOS_DQOutEnable;
        end else if (iCI_ACG_Command[1]) begin rACG_PHY_DQOutEnable <= iDIS_DQOutEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_DQOutEnable <= iDLE_DQOutEnable;
        end else                         begin rACG_PHY_DQOutEnable <= iDLE_DQOutEnable;
        end
    end

    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_DQStrobe <= iACA_DQStrobe;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_DQStrobe <= iDOA_DQStrobe;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_DQStrobe <= iDIA_DQStrobe;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_DQStrobe <= iACS_DQStrobe;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_DQStrobe <= iDOS_DQStrobe;
        // end else if (iCI_ACG_Command[1]) begin rACG_PHY_DQStrobe <= iDIS_DQStrobe;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_DQStrobe <= iDLE_DQStrobe;
        end else                         begin rACG_PHY_DQStrobe <= iDLE_DQStrobe;
        end
    end

    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_DQ <= iACA_DQ;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_DQ <= iDOA_DQ;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_DQ <= iDIA_DQ;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_DQ <= iACS_DQ;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_DQ <= iDOS_DQ;
        // end else if (iCI_ACG_Command[1]) begin rACG_PHY_DQ <= iDIS_DQ;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_DQ <= iDLE_DQ;
        end else                         begin rACG_PHY_DQ <= iDLE_DQ;
        end
    end

    always @ (*) begin
        // if          (iCI_ACG_Command[6]) begin rACG_PHY_ChipEnable <= iACA_ChipEnable;
        // end else if (iCI_ACG_Command[5]) begin rACG_PHY_ChipEnable <= iDOA_ChipEnable;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_ChipEnable <= iDIA_ChipEnable;
        // end else if (iCI_ACG_Command[3]) begin rACG_PHY_ChipEnable <= iACS_ChipEnable;
        // end else if (iCI_ACG_Command[2]) begin rACG_PHY_ChipEnable <= iDOS_ChipEnable;
        // end else if (iCI_ACG_Command[1]) begin rACG_PHY_ChipEnable <= iDIS_ChipEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_ChipEnable <= iDLE_ChipEnable;
        // end else                         begin 
        rACG_PHY_ChipEnable <= iDLE_ChipEnable;
        // end
    end

    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_ReadEnable <= iACA_ReadEnable;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_ReadEnable <= iDOA_ReadEnable;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_ReadEnable <= iDIA_ReadEnable;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_ReadEnable <= iACS_ReadEnable;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_ReadEnable <= iDOS_ReadEnable;
        end else if (iCI_ACG_Command[1]) begin rACG_PHY_ReadEnable <= iDIS_ReadEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_ReadEnable <= iDLE_ReadEnable;
        end else                         begin rACG_PHY_ReadEnable <= iDLE_ReadEnable;
        end
    end

    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_WriteEnable <= iACA_WriteEnable;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_WriteEnable <= iDOA_WriteEnable;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_WriteEnable <= iDIA_WriteEnable;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_WriteEnable <= iACS_WriteEnable;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_WriteEnable <= iDOS_WriteEnable;
        end else if (iCI_ACG_Command[1]) begin rACG_PHY_WriteEnable <= iDIS_WriteEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_WriteEnable <= iDLE_WriteEnable;
        end else                         begin rACG_PHY_WriteEnable <= iDLE_WriteEnable;
        end
    end

    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_AddressLatchEnable <= iACA_AddressLatchEnable;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_AddressLatchEnable <= iDOA_AddressLatchEnable;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_AddressLatchEnable <= iDIA_AddressLatchEnable;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_AddressLatchEnable <= iACS_AddressLatchEnable;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_AddressLatchEnable <= iDOS_AddressLatchEnable;
        end else if (iCI_ACG_Command[1]) begin rACG_PHY_AddressLatchEnable <= iDIS_AddressLatchEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_AddressLatchEnable <= iDLE_AddressLatchEnable;
        end else                         begin rACG_PHY_AddressLatchEnable <= iDLE_AddressLatchEnable;
        end
    end

    always @ (*) begin
        if          (iCI_ACG_Command[6]) begin rACG_PHY_CommandLatchEnable <= iACA_CommandLatchEnable;
        end else if (iCI_ACG_Command[5]) begin rACG_PHY_CommandLatchEnable <= iDOA_CommandLatchEnable;
        // end else if (iCI_ACG_Command[4]) begin rACG_PHY_CommandLatchEnable <= iDIA_CommandLatchEnable;
        end else if (iCI_ACG_Command[3]) begin rACG_PHY_CommandLatchEnable <= iACS_CommandLatchEnable;
        end else if (iCI_ACG_Command[2]) begin rACG_PHY_CommandLatchEnable <= iDOS_CommandLatchEnable;
        end else if (iCI_ACG_Command[1]) begin rACG_PHY_CommandLatchEnable <= iDIS_CommandLatchEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_PHY_CommandLatchEnable <= iDLE_CommandLatchEnable;
        end else                         begin rACG_PHY_CommandLatchEnable <= iDLE_CommandLatchEnable;
        end
    end


    always @ (*) begin
        // if          (iCI_ACG_Command[6]) begin rACG_CI_WriteReady <= iACA_CommandLatchEnable;
        // end else 
        if          (iCI_ACG_Command[5]) begin rACG_CI_WriteReady <= iDOA_WriteReady;
        // end else if (iCI_ACG_Command[4]) begin rACG_CI_WriteReady <= iDIA_CommandLatchEnable;
        // end else if (iCI_ACG_Command[3]) begin rACG_CI_WriteReady <= iACS_CommandLatchEnable;
        end else if (iCI_ACG_Command[2]) begin rACG_CI_WriteReady <= iDOS_WriteReady;
        // end else if (iCI_ACG_Command[1]) begin rACG_CI_WriteReady <= iDIS_CommandLatchEnable;
        // end else if (iCI_ACG_Command[0]) begin rACG_CI_WriteReady <= iDLE_CommandLatchEnable;
        end else                         begin rACG_CI_WriteReady <= 1'b0;
        end
    end

    always @ (*) begin

                 if (iCI_ACG_Command[1]) begin rACG_PHY_BUFF_WE <= 1'b1;
        end else                         begin rACG_PHY_BUFF_WE <= 1'b0;
        end
    end

    assign oACG_PHY_DQSOutEnable           = rACG_PHY_DQSOutEnable           ;   
    assign oACG_PHY_DQOutEnable            = rACG_PHY_DQOutEnable            ;   
    assign oACG_PHY_DQStrobe               = rACG_PHY_DQStrobe               ;   
    assign oACG_PHY_DQ                     = rACG_PHY_DQ                     ;   
    assign oACG_PHY_ChipEnable             = rACG_PHY_ChipEnable             ;   
    assign oACG_PHY_ReadEnable             = rACG_PHY_ReadEnable             ;   
    assign oACG_PHY_WriteEnable            = rACG_PHY_WriteEnable            ;   
    assign oACG_PHY_AddressLatchEnable     = rACG_PHY_AddressLatchEnable     ;   
    assign oACG_PHY_CommandLatchEnable     = rACG_PHY_CommandLatchEnable     ;   

    assign oACG_PHY_DelayTapLoad           = iDLE_DelayTapLoad               ;
    assign oACG_PHY_DelayTap               = iDLE_DelayTap                   ;

    assign oACG_CI_WriteReady              = rACG_CI_WriteReady              ;

    assign oACG_PHY_BUFF_WE                = rACG_PHY_BUFF_WE                ;
endmodule
