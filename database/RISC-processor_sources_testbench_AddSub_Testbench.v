`timescale 1ns / 1ps

module AddSub_Testbench;

reg [5:0] alufn;
reg [31:0] a;
reg [31:0] b;

wire [31:0] s;
wire z;
wire v;
wire n;

wire [31:0] cmp;
wire [31:0] logRes;

reg [67:0] val [72:0];

AddSub add_sub_instance_0 (
    .alufn(alufn),
    .a(a),
    .b(b),

    .s(s),
    .z(z),
    .v(v),
    .n(n)
);

CmpModule cmp_module_inst_0 (
    .alufn(alufn),
    .a(a),
    .b(b),

    .cmp(cmp)
);

LogicModule log_module_inst_0 (
    .alufn(alufn),
    .a(a),
    .b(b),

    .res(logRes)
);

initial begin
    val[0] = 68'h00000000000000000;
    val[1] = 68'h55555555000000000;
    val[2] = 68'h00000000555555550;
    val[3] = 68'h55555555555555550;
    val[4] = 68'hAAAAAAAA000000000;
    val[5] = 68'h00000000AAAAAAAA0;
    val[6] = 68'hAAAAAAAAAAAAAAAA0;
    val[7] = 68'hFFFFFFFFFFFFFFFF1;
    val[8] = 68'h00000001FFFFFFFF0;
    val[9] = 68'hFFFFFFFF000000001;
    val[10] = 68'h00000001000000000;
    val[11] = 68'hFFFFFFF2FFFFFFF01;
    val[12] = 68'h00000001000000030;
    val[13] = 68'hAAAAAAAC5555555C0;
    val[14] = 68'hFFFFFFFFFFFFFFEF1;
    val[15] = 68'h000000020000001E0;
    val[16] = 68'h00000000FFFFFFC01;
    val[17] = 68'h0000007FFFFFFFFF1;
    val[18] = 68'h00000080000000800;
    val[19] = 68'h00000180000000800;
    val[20] = 68'h00000380000000800;
    val[21] = 68'h00000780000000800;
    val[22] = 68'h00001000000000000;
    val[23] = 68'h00001000000010000;
    val[24] = 68'h00003000000010000;
    val[25] = 68'h00007000000010000;
    val[26] = 68'h0000F000000010000;
    val[27] = 68'h00001000FFFE10001;
    val[28] = 68'h00001000FFFC10001;
    val[29] = 68'h0007F800000008000;
    val[30] = 68'h000FFC00000004000;
    val[31] = 68'h001FFE00000002000;
    val[32] = 68'h003FFF00000001000;
    val[33] = 68'h00000080FF8000801;
    val[34] = 68'hFF000000020000000;
    val[35] = 68'h04000000FE0000000;
    val[36] = 68'h03000FFF00FFF0010;
    val[37] = 68'h070007FF00FFF8010;
    val[38] = 68'h0F0003FF00FFFC010;
    val[39] = 68'h1F0001FF00FFFE010;
    val[40] = 68'h3F0000FF00FFFF010;
    val[41] = 68'h80000001000000011;
    val[42] = 68'h00000002FFFFFFFD3;
    val[43] = 68'h00000002FFFFFFFD5;
    val[44] = 68'h00000002FFFFFFFD7;
    val[45] = 68'h800000007FFFFFFF3;
    val[46] = 68'h80000000000000025;
    val[47] = 68'h80000000123456787;
    val[48] = 68'h00000003000000053;
    val[49] = 68'h00000003000000055;
    val[50] = 68'h00000003000000057;
    val[51] = 68'h7FFFFFFFFFFFFFFE3;
    val[52] = 68'h7FFFFFFFFFFFFFFE5;
    val[53] = 68'h7FFFFFFFFFFFFFFE7;
    val[54] = 68'h00000003000000033;
    val[55] = 68'h00000003000000035;
    val[56] = 68'h00000003000000037;

    // Values for verification of boolean logic
    // unit of alu
    val[57] = 68'h00000000000000008;
    val[58] = 68'hFFFFFFFF000000008;
    val[59] = 68'h00000000FFFFFFFF8;
    val[60] = 68'hFFFFFFFFFFFFFFFF8;
    val[61] = 68'h0000000000000000E;
    val[62] = 68'hFFFFFFFF00000000E;
    val[63] = 68'h00000000FFFFFFFFE;
    val[64] = 68'hFFFFFFFFFFFFFFFFE;
    val[65] = 68'h00000000000000006;
    val[66] = 68'hFFFFFFFF000000006;
    val[67] = 68'h00000000FFFFFFFF6;
    val[68] = 68'hFFFFFFFFFFFFFFFF6;
    val[69] = 68'h0000000000000000A;
    val[70] = 68'hFFFFFFFF00000000A;
    val[71] = 68'h00000000FFFFFFFFA;
    val[72] = 68'hFFFFFFFFFFFFFFFFA;
end

integer i = 0;
always begin
    #10

    alufn = 6'b000000 + val[i][3:0];
    a = val[i][67:36];
    b = val[i][35:4];

    i = i + 1;
end

endmodule
