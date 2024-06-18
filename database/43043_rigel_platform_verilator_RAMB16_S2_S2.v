// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module RAMB16_S2_S2(
  input WEA,
  input ENA,
  input SSRA,
  input CLKA,
  input [12:0] ADDRA,
  input [1:0] DIA,
//  input DIPA,
//  output [3:0] DOPA,
  output [1:0] DOA,
  input WEB,
  input ENB,
  input SSRB,
  input CLKB,
  input [12:0] ADDRB,
  input [1:0] DIB,
//  input DIPB,
//  output [3:0] DOPB,
  output [1:0] DOB);
  parameter WRITE_MODE_A = "write_first";
  parameter WRITE_MODE_B = "write_first";
parameter INIT_00=256'd0;
parameter INIT_01=256'd0;
parameter INIT_02=256'd0;
parameter INIT_03=256'd0;
parameter INIT_04=256'd0;
parameter INIT_05=256'd0;
parameter INIT_06=256'd0;
parameter INIT_07=256'd0;
parameter INIT_08=256'd0;
parameter INIT_09=256'd0;
parameter INIT_0A=256'd0;
parameter INIT_0B=256'd0;
parameter INIT_0C=256'd0;
parameter INIT_0D=256'd0;
parameter INIT_0E=256'd0;
parameter INIT_0F=256'd0;
parameter INIT_10=256'd0;
parameter INIT_11=256'd0;
parameter INIT_12=256'd0;
parameter INIT_13=256'd0;
parameter INIT_14=256'd0;
parameter INIT_15=256'd0;
parameter INIT_16=256'd0;
parameter INIT_17=256'd0;
parameter INIT_18=256'd0;
parameter INIT_19=256'd0;
parameter INIT_1A=256'd0;
parameter INIT_1B=256'd0;
parameter INIT_1C=256'd0;
parameter INIT_1D=256'd0;
parameter INIT_1E=256'd0;
parameter INIT_1F=256'd0;
parameter INIT_20=256'd0;
parameter INIT_21=256'd0;
parameter INIT_22=256'd0;
parameter INIT_23=256'd0;
parameter INIT_24=256'd0;
parameter INIT_25=256'd0;
parameter INIT_26=256'd0;
parameter INIT_27=256'd0;
parameter INIT_28=256'd0;
parameter INIT_29=256'd0;
parameter INIT_2A=256'd0;
parameter INIT_2B=256'd0;
parameter INIT_2C=256'd0;
parameter INIT_2D=256'd0;
parameter INIT_2E=256'd0;
parameter INIT_2F=256'd0;
parameter INIT_30=256'd0;
parameter INIT_31=256'd0;
parameter INIT_32=256'd0;
parameter INIT_33=256'd0;
parameter INIT_34=256'd0;
parameter INIT_35=256'd0;
parameter INIT_36=256'd0;
parameter INIT_37=256'd0;
parameter INIT_38=256'd0;
parameter INIT_39=256'd0;
parameter INIT_3A=256'd0;
parameter INIT_3B=256'd0;
parameter INIT_3C=256'd0;
parameter INIT_3D=256'd0;
parameter INIT_3E=256'd0;
   parameter INIT_3F=256'd0;   


   RAMB16_RIGEL #(.WRITE_MODE_A(WRITE_MODE_A),.WRITE_MODE_B(WRITE_MODE_B),.BITS(2),.INIT_00(INIT_00),.INIT_01(INIT_01),.INIT_02(INIT_02),.INIT_03(INIT_03),.INIT_04(INIT_04),.INIT_05(INIT_05),.INIT_06(INIT_06),.INIT_07(INIT_07),.INIT_08(INIT_08),.INIT_09(INIT_09),.INIT_0A(INIT_0A),.INIT_0B(INIT_0B),.INIT_0C(INIT_0C),.INIT_0D(INIT_0D),.INIT_0E(INIT_0E),.INIT_0F(INIT_0F),.INIT_10(INIT_10),.INIT_11(INIT_11),.INIT_12(INIT_12),.INIT_13(INIT_13),.INIT_14(INIT_14),.INIT_15(INIT_15),.INIT_16(INIT_16),.INIT_17(INIT_17),.INIT_18(INIT_18),.INIT_19(INIT_19),.INIT_1A(INIT_1A),.INIT_1B(INIT_1B),.INIT_1C(INIT_1C),.INIT_1D(INIT_1D),.INIT_1E(INIT_1E),.INIT_1F(INIT_1F),.INIT_20(INIT_20),.INIT_21(INIT_21),.INIT_22(INIT_22),.INIT_23(INIT_23),.INIT_24(INIT_24),.INIT_25(INIT_25),.INIT_26(INIT_26),.INIT_27(INIT_27),.INIT_28(INIT_28),.INIT_29(INIT_29),.INIT_2A(INIT_2A),.INIT_2B(INIT_2B),.INIT_2C(INIT_2C),.INIT_2D(INIT_2D),.INIT_2E(INIT_2E),.INIT_2F(INIT_2F),.INIT_30(INIT_30),.INIT_31(INIT_31),.INIT_32(INIT_32),.INIT_33(INIT_33),.INIT_34(INIT_34),.INIT_35(INIT_35),.INIT_36(INIT_36),.INIT_37(INIT_37),.INIT_38(INIT_38),.INIT_39(INIT_39),.INIT_3A(INIT_3A),.INIT_3B(INIT_3B),.INIT_3C(INIT_3C),.INIT_3D(INIT_3D),.INIT_3E(INIT_3E),.INIT_3F(INIT_3F)) inner_ram(.WEA(WEA),.ENA(ENA),.SSRA(SSRA),.CLKA(CLKA),.ADDRA(ADDRA),.DIA(DIA),.DIPA(1'b0),.DOA(DOA),.WEB(WEB),.ENB(ENB),.SSRB(SSRB),.CLKB(CLKB),.ADDRB(ADDRB),.DIB(DIB),.DIPB(1'b0),.DOB(DOB));

endmodule
