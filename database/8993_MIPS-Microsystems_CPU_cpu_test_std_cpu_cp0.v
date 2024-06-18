// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`define IE SR[0]
`define EXL SR[1]
`define IM SR[15:10]
`define EXCCODE Cause[6:2]
`define IP Cause[15:10]

module cp0(
    input clk,
    input reset,
    input WE,
    input EXLSet,
    input EXLClr,
    input isDB,
    input isEret,
    input [4:0] A1,
    input [4:0] A2,
    input [31:0] Din,
    input [31:0] pc,
    input [6:2] ExcCode,
    input [7:2] HWInt,
    output IntReq,
    output [31:0] epc,
    output [31:0] Dout
);

    reg [31:0] SR = 0, Cause = 0, EPC = 0, PRId = 32'h00330099;

    assign IntReq = ( (`IE && !`EXL && HWInt&`IM) || (!`EXL && ExcCode) || isEret ) ? 1'b1 : 1'b0;
    assign epc = EPC;
    assign Dout =   (A1 == 5'd12)   ?   SR      :
                    (A1 == 5'd13)   ?   Cause   :
                    (A1 == 5'd14)   ?   EPC     :
                    (A1 == 5'd15)   ?   PRId    :
                                        32'd0;
    
    always @(posedge clk) begin
        if(reset)
            SR <= 32'd0;
        else if(WE == 1'b1 && A2 == 5'd12)
            SR <= Din;
        else if(EXLClr)
            SR <= SR & 32'hffff_fffd;
        else if(EXLSet)
            SR <= SR | 32'h0000_0002;
        else
            ;
    end

    always @(posedge clk) begin
        if (reset)
            Cause <= 32'd0;
        else if(`IE && !`EXL &&  HWInt&`IM)
            Cause <= {isDB, 15'd0, HWInt, 3'd0, 5'd0, 2'd0};
        else if(!`EXL && ExcCode)
            Cause <= {isDB, 15'd0, HWInt, 3'd0, ExcCode, 2'd0};
        else
            Cause <= {Cause[31:16], HWInt, Cause[9:0]};
    end

    always @(posedge clk) begin
        if(reset)
            EPC <= 32'd0;
        else if(WE == 1'b1 && A2 == 5'd14)
            EPC <= {Din[31:2], 2'b00};
        else if(IntReq == 1'b1 && !isEret)
            if(isDB)
                EPC <= {pc[31:2], 2'b00} - 32'd4;
            else
                EPC <= {pc[31:2], 2'b00};
        else
            ;
    end


endmodule // cp0