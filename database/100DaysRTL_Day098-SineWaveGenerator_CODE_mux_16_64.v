// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mux_16_64(o,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,i48,i49,i50,i51,i52,i53,i54,i55,i56,i57,i58,i59,i60,i61,i62,i63,i64,s);
input [15:0]i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,i48,i49,i50,i51,i52,i53,i54,i55,i56,i57,i58,i59,i60,i61,i62,i63,i64;
input [5:0]s;
output [15:0]o;
wire [15:0]x1,x2,x3,x4,x5,x6,x7,x8;

mux_16_8 mux_16_8_1(x1,i1,i2,i3,i4,i5,i6,i7,i8,s[2:0]);
mux_16_8 mux_16_8_2(x2,i9,i10,i11,i12,i13,i14,i15,i16,s[2:0]);
mux_16_8 mux_16_8_3(x3,i17,i18,i19,i20,i21,i22,i23,i24,s[2:0]);
mux_16_8 mux_16_8_4(x4,i25,i26,i27,i28,i29,i30,i31,i32,s[2:0]);
mux_16_8 mux_16_8_5(x5,i33,i34,i35,i36,i37,i38,i39,i40,s[2:0]);
mux_16_8 mux_16_8_6(x6,i41,i42,i43,i44,i45,i46,i47,i48,s[2:0]);
mux_16_8 mux_16_8_7(x7,i49,i50,i51,i52,i53,i54,i55,i56,s[2:0]);
mux_16_8 mux_16_8_8(x8,i57,i58,i59,i60,i61,i62,i63,i64,s[2:0]);

mux_16_8 mux_16_8_9(o,x1,x2,x3,x4,x5,x6,x7,x8,s[5:3]);
endmodule
