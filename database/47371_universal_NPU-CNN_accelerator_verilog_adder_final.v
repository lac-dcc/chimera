// This program was cloned from: https://github.com/thousrm/universal_NPU-CNN_accelerator
// License: MIT License


module adder_final(i19, i18, i17, i16, i15, i14, i13, i12, i11, i10, i9, i8, i7, i6,
                    out);


input [1:0] i19, i18, i17, i16, i15, i14, i13, i12, i11, i10, i9, i8, i7, i6;
wire c0, c1, c2, c3, c4;
output [13:0] out;

CLG4_3 C3(i16[0], i16[1], i17[0], i17[1], i18[0], i18[1], i19[0], i19[1], c4, out[10], out[11], out[12], out[13]);
CLG4 C2(i12[0], i12[1], i13[0], i13[1], i14[0], i14[1], i15[0], i15[1], c3, out[6], out[7], out[8], out[9], c4);
CLG2 C1(i10[0], i10[1], i11[0], i11[1], c2, out[4], out[5], c3);
CLG2 C0(i8[0], i8[1], i9[0], i9[1], c1, out[2], out[3], c2);
FA FA0(i7[0], i7[1], c0, out[1], c1);
HA HA0(i6[0], i6[1], out[0], c0);



endmodule




module adder_final_simple(i19, i18, i17, i16, i15, i14, i13, i12, i11, i10, i9, i8, i7, i6, i5,
                    out);


input [1:0] i19, i18, i17, i16, i15, i14, i13, i12, i11, i10, i9, i8, i7, i6;
input i5;

wire [19:0] outb;

assign outb = (i19[0]<<19) + (i18[0]<<18) +(i17[0]<<17) +(i16[0]<<16) +(i15[0]<<15) +
                    (i14[0]<<14) +(i13[0]<<13) +(i12[0]<<12) +(i11[0]<<11) +
                    (i10[0]<<10) +(i9[0]<<9) +(i8[0]<<8) +(i7[0]<<7) +
                    (i6[0]<<6) +(i5<<5) + 
            (i19[1]<<19) + (i18[1]<<18) +(i17[1]<<17) +(i16[1]<<16) +(i15[1]<<15) +
                    (i14[1]<<14) +(i13[1]<<13) +(i12[1]<<12) +(i11[1]<<11) +
                    (i10[1]<<10) +(i9[1]<<9) +(i8[1]<<8) +(i7[1]<<7) +
                    (i6[1]<<6);


output [13:0] out;

assign out = outb[19-:14];

endmodule