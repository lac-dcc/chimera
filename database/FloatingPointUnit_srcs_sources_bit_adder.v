// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License

module bit_adder(
    input wire cin,
    input wire [23:0] i0,i1,
    output wire [23:0] sum);

	wire cout;
	wire [23:0] temp;
	wire [23:0] int_ip; //intermediate input - processed from the inputs and fed into fa module 
	
	//if cin == 1, int_ip = 1's complement
	//else int_ip = i1
    xor2 x0 (i1[0], cin, int_ip[0]);
    xor2 x1 (i1[1], cin, int_ip[1]);
    xor2 x2 (i1[2], cin, int_ip[2]);
    xor2 x3 (i1[3], cin, int_ip[3]);
    xor2 x4 (i1[4], cin, int_ip[4]);
    xor2 x5 (i1[5], cin, int_ip[5]);
    xor2 x6 (i1[6], cin, int_ip[6]);
    xor2 x7 (i1[7], cin, int_ip[7]);
    xor2 x8 (i1[8], cin, int_ip[8]);
    xor2 x9 (i1[9], cin, int_ip[9]);
    xor2 x10 (i1[10], cin, int_ip[10]);
    xor2 x11 (i1[11], cin, int_ip[11]);
    xor2 x12 (i1[12], cin, int_ip[12]);
    xor2 x13 (i1[13], cin, int_ip[13]);
    xor2 x14 (i1[14], cin, int_ip[14]);
    xor2 x15 (i1[15], cin, int_ip[15]);
    xor2 x16 (i1[16], cin, int_ip[16]);
    xor2 x17 (i1[17], cin, int_ip[17]);
    xor2 x18 (i1[18], cin, int_ip[18]);
    xor2 x19 (i1[19], cin, int_ip[19]);
    xor2 x20 (i1[20], cin, int_ip[20]);
    xor2 x21 (i1[21], cin, int_ip[21]);
    xor2 x22 (i1[22], cin, int_ip[22]);
    xor2 x23 (i1[23], cin, int_ip[23]);   
    //if cin == 1, cin added to make two's complement
    //else addition takes place
	fa fa1(i0[0], int_ip[0], cin,     sum[0], temp[0]);
	fa fa2(i0[1], int_ip[1], temp[0], sum[1], temp[1]);
	fa fa3(i0[2], int_ip[2], temp[1], sum[2], temp[2]);
	fa fa4(i0[3], int_ip[3], temp[2], sum[3], temp[3]);
	fa fa5(i0[4], int_ip[4], temp[3], sum[4], temp[4]);
	fa fa6(i0[5], int_ip[5], temp[4], sum[5], temp[5]);
	fa fa7(i0[6], int_ip[6], temp[5], sum[6], temp[6]);
    fa fa8(i0[7], int_ip[7], temp[6], sum[7], temp[7]);
    fa fa9(i0[8], int_ip[8], temp[7], sum[8], temp[8]);
    fa fa10(i0[9], int_ip[9], temp[8], sum[9], temp[9]);
    fa fa11(i0[10], int_ip[10], temp[9], sum[10], temp[10]);
    fa fa12(i0[11], int_ip[11], temp[10], sum[11], temp[11]);
    fa fa13(i0[12], int_ip[12], temp[11], sum[12], temp[12]);
    fa fa14(i0[13], int_ip[13], temp[12], sum[13], temp[13]);
    fa fa15(i0[14], int_ip[14], temp[13], sum[14], temp[14]);
    fa fa16(i0[15], int_ip[15], temp[14], sum[15], temp[15]);
    fa fa17(i0[16], int_ip[16], temp[15], sum[16], temp[16]);
    fa fa18(i0[17], int_ip[17], temp[16], sum[17], temp[17]);
    fa fa19(i0[18], int_ip[18], temp[17], sum[18], temp[18]);
    fa fa20(i0[19], int_ip[19], temp[18], sum[19], temp[19]);
    fa fa21(i0[20], int_ip[20], temp[19], sum[20], temp[20]);
    fa fa22(i0[21], int_ip[21], temp[20], sum[21], temp[21]);
    fa fa23(i0[22], int_ip[22], temp[21], sum[22], cout);
endmodule

