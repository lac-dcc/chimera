// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

`include "Defines.v"

`define IM SR[15:10]
`define EXL SR[1]
`define IE SR[0]
`define BD Cause[31]
`define IP Cause[15:10]
`define ExcCode Cause[6:2]

module CP0(
    input wire clk,
    input wire rst,
    input wire WE,
    input wire [4:0] InAddr,
    input wire [4:0] OutAddr,
    input wire [31:0] InData,
    output wire [31:0] OutData,
    input wire [31:0] VPC,
    input wire BDIn,
    input wire [4:0] ExcCodeIn,
    input wire [7:2] HWInt,
    input wire EXLClr,
    output wire [31:0] EPCOut,
    output wire req 
);

    reg [31:0] SR;
    reg [31:0] Cause;
    reg [31:0] EPC;

    initial begin
        SR    <= 0;
        Cause <= 0;
        EPC   <= 0;
    end

    assign OutData = (OutAddr == 12)? SR:
                     (OutAddr == 13)? Cause:
                     (OutAddr == 14)? EPC:
                     0;

    wire IntReq, ExcReq;

    assign IntReq = `IE & !`EXL & |(`IM & HWInt);
    assign ExcReq = !`EXL & | ExcCodeIn;
    assign req = IntReq | ExcReq; 

    assign EPCOut = req ? VPC : EPC & 32'hfffffffc;

    always @(posedge clk) begin
        if (rst) begin
            SR <= 0;
            Cause <= 0;
            EPC <= 0;
        end
        else begin
            `IP <= HWInt;
            if (EXLClr) `EXL <= 1'b0;
            if (req) begin
                `ExcCode <= IntReq? 5'b0: ExcCodeIn;
                `EXL <= 1'b1;
                EPC <= BDIn? VPC - 4 : VPC ;
                `BD <= BDIn;
            end else if (WE) begin
                case (InAddr)
                    12: SR <= InData;
                    //13: Cause <= InData;
                    14: EPC <= InData;
                endcase
            end
        end
    end
endmodule