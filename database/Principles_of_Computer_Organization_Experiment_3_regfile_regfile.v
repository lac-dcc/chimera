// This program was cloned from: https://github.com/Men1scus/Principles_of_Computer_Organization
// License: MIT License

`timescale 1ns / 1ps
//*************************************************************************
//   > 文件名: regfile.v
//   > 描述  ：寄存器堆模块，同步写，异步读
//   > 作者  : LOONGSON
//   > 日期  : 2016-04-14
//*************************************************************************
module regfile(
    input             clk,
    input             wen,
    input      [4 :0] raddr1,
    input      [4 :0] raddr2,
    input      [4 :0] waddr,
    input      [31:0] wdata,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2,
    input      [4 :0] test_addr,
    output reg [31:0] test_data
    );
    reg [31:0] rf[31:0];
     
    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clock
    // register 0 hardwired to 0

    always @(posedge clk)
    begin
        if (wen) 
        begin
            rf[waddr] <= wdata;
        end
    end
     
    //读端口1
    always @(*)
    begin
        case (raddr1)
            5'd1 : rdata1 <= rf[1 ];
            5'd2 : rdata1 <= rf[2 ];
            5'd3 : rdata1 <= rf[3 ];
            5'd4 : rdata1 <= rf[4 ];
            5'd5 : rdata1 <= rf[5 ];
            5'd6 : rdata1 <= rf[6 ];
            5'd7 : rdata1 <= rf[7 ];
            5'd8 : rdata1 <= rf[8 ];
            5'd9 : rdata1 <= rf[9 ];
            5'd10: rdata1 <= rf[10];
            5'd11: rdata1 <= rf[11];
            5'd12: rdata1 <= rf[12];
            5'd13: rdata1 <= rf[13];
            5'd14: rdata1 <= rf[14];
            5'd15: rdata1 <= rf[15];
            5'd16: rdata1 <= rf[16];
            5'd17: rdata1 <= rf[17];
            5'd18: rdata1 <= rf[18];
            5'd19: rdata1 <= rf[19];
            5'd20: rdata1 <= rf[20];
            5'd21: rdata1 <= rf[21];
            5'd22: rdata1 <= rf[22];
            5'd23: rdata1 <= rf[23];
            5'd24: rdata1 <= rf[24];
            5'd25: rdata1 <= rf[25];
            5'd26: rdata1 <= rf[26];
            5'd27: rdata1 <= rf[27];
            5'd28: rdata1 <= rf[28];
            5'd29: rdata1 <= rf[29];
            5'd30: rdata1 <= rf[30];
            5'd31: rdata1 <= rf[31];
            default : rdata1 <= 32'd0;
        endcase
    end
    //读端口2
    always @(*)
    begin
        case (raddr2)
            5'd1 : rdata2 <= rf[1 ];
            5'd2 : rdata2 <= rf[2 ];
            5'd3 : rdata2 <= rf[3 ];
            5'd4 : rdata2 <= rf[4 ];
            5'd5 : rdata2 <= rf[5 ];
            5'd6 : rdata2 <= rf[6 ];
            5'd7 : rdata2 <= rf[7 ];
            5'd8 : rdata2 <= rf[8 ];
            5'd9 : rdata2 <= rf[9 ];
            5'd10: rdata2 <= rf[10];
            5'd11: rdata2 <= rf[11];
            5'd12: rdata2 <= rf[12];
            5'd13: rdata2 <= rf[13];
            5'd14: rdata2 <= rf[14];
            5'd15: rdata2 <= rf[15];
            5'd16: rdata2 <= rf[16];
            5'd17: rdata2 <= rf[17];
            5'd18: rdata2 <= rf[18];
            5'd19: rdata2 <= rf[19];
            5'd20: rdata2 <= rf[20];
            5'd21: rdata2 <= rf[21];
            5'd22: rdata2 <= rf[22];
            5'd23: rdata2 <= rf[23];
            5'd24: rdata2 <= rf[24];
            5'd25: rdata2 <= rf[25];
            5'd26: rdata2 <= rf[26];
            5'd27: rdata2 <= rf[27];
            5'd28: rdata2 <= rf[28];
            5'd29: rdata2 <= rf[29];
            5'd30: rdata2 <= rf[30];
            5'd31: rdata2 <= rf[31];
            default : rdata2 <= 32'd0;
        endcase
    end
     //调试端口，读出寄存器值显示在触摸屏上
    always @(*)
    begin
        case (test_addr)
            5'd1 : test_data <= rf[1 ];
            5'd2 : test_data <= rf[2 ];
            5'd3 : test_data <= rf[3 ];
            5'd4 : test_data <= rf[4 ];
            5'd5 : test_data <= rf[5 ];
            5'd6 : test_data <= rf[6 ];
            5'd7 : test_data <= rf[7 ];
            5'd8 : test_data <= rf[8 ];
            5'd9 : test_data <= rf[9 ];
            5'd10: test_data <= rf[10];
            5'd11: test_data <= rf[11];
            5'd12: test_data <= rf[12];
            5'd13: test_data <= rf[13];
            5'd14: test_data <= rf[14];
            5'd15: test_data <= rf[15];
            5'd16: test_data <= rf[16];
            5'd17: test_data <= rf[17];
            5'd18: test_data <= rf[18];
            5'd19: test_data <= rf[19];
            5'd20: test_data <= rf[20];
            5'd21: test_data <= rf[21];
            5'd22: test_data <= rf[22];
            5'd23: test_data <= rf[23];
            5'd24: test_data <= rf[24];
            5'd25: test_data <= rf[25];
            5'd26: test_data <= rf[26];
            5'd27: test_data <= rf[27];
            5'd28: test_data <= rf[28];
            5'd29: test_data <= rf[29];
            5'd30: test_data <= rf[30];
            5'd31: test_data <= rf[31];
            default : test_data <= 32'd0;
        endcase
    end
endmodule
