// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module RecursiveDoubling (a,b,cin,sum,cout);

input [32:1] a,b;
input cin;

output wire [32:1] sum;
output wire cout;

wire [1:0] pgk [32:1];

wire [1:0] temp_1 [32:1];
wire [1:0] temp_2 [32:1];
wire [1:0] temp_3 [32:1];
wire [1:0] temp_4 [32:1];
wire [1:0] temp_5 [32:1];

wire [32:1] gk; 

// pgk  00-kill  11-generate  10-propagate


//pgk generation

assign pgk[1][0]=(a[1]&b[1]) | (b[1]&cin) | (cin&a[1]);
assign pgk[1][1]=(a[1]&b[1]) | (b[1]&cin) | (cin&a[1]);

assign pgk[2][0]=a[2]&b[2]; 
assign pgk[2][1]=a[2]|b[2];

assign pgk[3][0]=a[3]&b[3]; 
assign pgk[3][1]=a[3]|b[3];

assign pgk[4][0]=a[4]&b[4]; 
assign pgk[4][1]=a[4]|b[4];

assign pgk[5][0]=a[5]&b[5]; 
assign pgk[5][1]=a[5]|b[5];

assign pgk[6][0]=a[6]&b[6]; 
assign pgk[6][1]=a[6]|b[6];

assign pgk[7][0]=a[7]&b[7]; 
assign pgk[7][1]=a[7]|b[7];

assign pgk[8][0]=a[8]&b[8]; 
assign pgk[8][1]=a[8]|b[8];

assign pgk[9][0]=a[9]&b[9]; 
assign pgk[9][1]=a[9]|b[9];

assign pgk[10][0]=a[10]&b[10]; 
assign pgk[10][1]=a[10]|b[10];

assign pgk[11][0]=a[11]&b[11]; 
assign pgk[11][1]=a[11]|b[11];

assign pgk[12][0]=a[12]&b[12]; 
assign pgk[12][1]=a[12]|b[12];

assign pgk[13][0]=a[13]&b[13]; 
assign pgk[13][1]=a[13]|b[13];

assign pgk[14][0]=a[14]&b[14]; 
assign pgk[14][1]=a[14]|b[14];

assign pgk[15][0]=a[15]&b[15]; 
assign pgk[15][1]=a[15]|b[15];

assign pgk[16][0]=a[16]&b[16]; 
assign pgk[16][1]=a[16]|b[16];

assign pgk[17][0]=a[17]&b[17]; 
assign pgk[17][1]=a[17]|b[17];

assign pgk[18][0]=a[18]&b[18]; 
assign pgk[18][1]=a[18]|b[18];

assign pgk[19][0]=a[19]&b[19]; 
assign pgk[19][1]=a[19]|b[19];

assign pgk[20][0]=a[20]&b[20]; 
assign pgk[20][1]=a[20]|b[20];

assign pgk[21][0]=a[21]&b[21]; 
assign pgk[21][1]=a[21]|b[21];

assign pgk[22][0]=a[22]&b[22]; 
assign pgk[22][1]=a[22]|b[22];

assign pgk[23][0]=a[23]&b[23]; 
assign pgk[23][1]=a[23]|b[23];

assign pgk[24][0]=a[24]&b[24]; 
assign pgk[24][1]=a[24]|b[24];

assign pgk[25][0]=a[25]&b[25]; 
assign pgk[25][1]=a[25]|b[25];

assign pgk[26][0]=a[26]&b[26]; 
assign pgk[26][1]=a[26]|b[26];

assign pgk[27][0]=a[27]&b[27]; 
assign pgk[27][1]=a[27]|b[27];

assign pgk[28][0]=a[28]&b[28]; 
assign pgk[28][1]=a[28]|b[28];

assign pgk[29][0]=a[29]&b[29]; 
assign pgk[29][1]=a[29]|b[29];

assign pgk[30][0]=a[30]&b[30]; 
assign pgk[30][1]=a[30]|b[30];

assign pgk[31][0]=a[31]&b[31]; 
assign pgk[31][1]=a[31]|b[31];

assign pgk[32][0]=a[32]&b[32]; 
assign pgk[32][1]=a[32]|b[32];





//PGK Reducing

//  1 - 32.31 
//  2   32.30
//  4   32.28
//  8   32.24
//  16  32.16
 


// 1 jump
assign temp_1[1][0]=pgk[1][0];
assign temp_1[1][1]=pgk[1][1];

assign temp_1[2][0]=(pgk[2][0])|(pgk[2][1]&pgk[1][0]);
assign temp_1[2][1]=(pgk[2][0])|(pgk[2][1]&pgk[1][1]);

assign temp_1[3][0]=(pgk[3][0])|(pgk[3][1]&pgk[2][0]);
assign temp_1[3][1]=(pgk[3][0])|(pgk[3][1]&pgk[2][1]);

assign temp_1[4][0]=(pgk[4][0])|(pgk[4][1]&pgk[3][0]);
assign temp_1[4][1]=(pgk[4][0])|(pgk[4][1]&pgk[3][1]);

assign temp_1[5][0]=(pgk[5][0])|(pgk[5][1]&pgk[4][0]);
assign temp_1[5][1]=(pgk[5][0])|(pgk[5][1]&pgk[4][1]);

assign temp_1[6][0]=(pgk[6][0])|(pgk[6][1]&pgk[5][0]);
assign temp_1[6][1]=(pgk[6][0])|(pgk[6][1]&pgk[5][1]);

assign temp_1[7][0]=(pgk[7][0])|(pgk[7][1]&pgk[6][0]);
assign temp_1[7][1]=(pgk[7][0])|(pgk[7][1]&pgk[6][1]);

assign temp_1[8][0]=(pgk[8][0])|(pgk[8][1]&pgk[7][0]);
assign temp_1[8][1]=(pgk[8][0])|(pgk[8][1]&pgk[7][1]);

assign temp_1[9][0]=(pgk[9][0])|(pgk[9][1]&pgk[8][0]);
assign temp_1[9][1]=(pgk[9][0])|(pgk[9][1]&pgk[8][1]);

assign temp_1[10][0]=(pgk[10][0])|(pgk[10][1]&pgk[9][0]);
assign temp_1[10][1]=(pgk[10][0])|(pgk[10][1]&pgk[9][1]);

assign temp_1[11][0]=(pgk[11][0])|(pgk[11][1]&pgk[10][0]);
assign temp_1[11][1]=(pgk[11][0])|(pgk[11][1]&pgk[10][1]);

assign temp_1[12][0]=(pgk[12][0])|(pgk[12][1]&pgk[11][0]);
assign temp_1[12][1]=(pgk[12][0])|(pgk[12][1]&pgk[11][1]);

assign temp_1[13][0]=(pgk[13][0])|(pgk[13][1]&pgk[12][0]);
assign temp_1[13][1]=(pgk[13][0])|(pgk[13][1]&pgk[12][1]);

assign temp_1[14][0]=(pgk[14][0])|(pgk[14][1]&pgk[13][0]);
assign temp_1[14][1]=(pgk[14][0])|(pgk[14][1]&pgk[13][1]);

assign temp_1[15][0]=(pgk[15][0])|(pgk[15][1]&pgk[14][0]);
assign temp_1[15][1]=(pgk[15][0])|(pgk[15][1]&pgk[14][1]);

assign temp_1[16][0]=(pgk[16][0])|(pgk[16][1]&pgk[15][0]);
assign temp_1[16][1]=(pgk[16][0])|(pgk[16][1]&pgk[15][1]);

assign temp_1[17][0]=(pgk[17][0])|(pgk[17][1]&pgk[16][0]);
assign temp_1[17][1]=(pgk[17][0])|(pgk[17][1]&pgk[16][1]);

assign temp_1[18][0]=(pgk[18][0])|(pgk[18][1]&pgk[17][0]);
assign temp_1[18][1]=(pgk[18][0])|(pgk[18][1]&pgk[17][1]);

assign temp_1[19][0]=(pgk[19][0])|(pgk[19][1]&pgk[18][0]);
assign temp_1[19][1]=(pgk[19][0])|(pgk[19][1]&pgk[18][1]);

assign temp_1[20][0]=(pgk[20][0])|(pgk[20][1]&pgk[19][0]);
assign temp_1[20][1]=(pgk[20][0])|(pgk[20][1]&pgk[19][1]);

assign temp_1[21][0]=(pgk[21][0])|(pgk[21][1]&pgk[20][0]);
assign temp_1[21][1]=(pgk[21][0])|(pgk[21][1]&pgk[20][1]);

assign temp_1[22][0]=(pgk[22][0])|(pgk[22][1]&pgk[21][0]);
assign temp_1[22][1]=(pgk[22][0])|(pgk[22][1]&pgk[21][1]);

assign temp_1[23][0]=(pgk[23][0])|(pgk[23][1]&pgk[22][0]);
assign temp_1[23][1]=(pgk[23][0])|(pgk[23][1]&pgk[22][1]);

assign temp_1[24][0]=(pgk[24][0])|(pgk[24][1]&pgk[23][0]);
assign temp_1[24][1]=(pgk[24][0])|(pgk[24][1]&pgk[23][1]);

assign temp_1[25][0]=(pgk[25][0])|(pgk[25][1]&pgk[24][0]);
assign temp_1[25][1]=(pgk[25][0])|(pgk[25][1]&pgk[24][1]);

assign temp_1[26][0]=(pgk[26][0])|(pgk[26][1]&pgk[25][0]);
assign temp_1[26][1]=(pgk[26][0])|(pgk[26][1]&pgk[25][1]);

assign temp_1[27][0]=(pgk[27][0])|(pgk[27][1]&pgk[26][0]);
assign temp_1[27][1]=(pgk[27][0])|(pgk[27][1]&pgk[26][1]);

assign temp_1[28][0]=(pgk[28][0])|(pgk[28][1]&pgk[27][0]);
assign temp_1[28][1]=(pgk[28][0])|(pgk[28][1]&pgk[27][1]);

assign temp_1[29][0]=(pgk[29][0])|(pgk[29][1]&pgk[28][0]);
assign temp_1[29][1]=(pgk[29][0])|(pgk[29][1]&pgk[28][1]);

assign temp_1[30][0]=(pgk[30][0])|(pgk[30][1]&pgk[29][0]);
assign temp_1[30][1]=(pgk[30][0])|(pgk[30][1]&pgk[29][1]);

assign temp_1[31][0]=(pgk[31][0])|(pgk[31][1]&pgk[30][0]);
assign temp_1[31][1]=(pgk[31][0])|(pgk[31][1]&pgk[30][1]);

assign temp_1[32][0]=(pgk[32][0])|(pgk[32][1]&pgk[31][0]);
assign temp_1[32][1]=(pgk[32][0])|(pgk[32][1]&pgk[31][1]);


// 2 jump

assign temp_2[1][0]=temp_1[1][0];
assign temp_2[1][1]=temp_1[1][1];

assign temp_2[2][0]=temp_1[2][0];
assign temp_2[2][1]=temp_1[2][1];

assign temp_2[3][0]=(temp_1[3][0])|(temp_1[3][1]&temp_1[1][0]);
assign temp_2[3][1]=(temp_1[3][0])|(temp_1[3][1]&temp_1[1][1]);

assign temp_2[4][0]=(temp_1[4][0])|(temp_1[4][1]&temp_1[2][0]);
assign temp_2[4][1]=(temp_1[4][0])|(temp_1[4][1]&temp_1[2][1]);

assign temp_2[5][0]=(temp_1[5][0])|(temp_1[5][1]&temp_1[3][0]);
assign temp_2[5][1]=(temp_1[5][0])|(temp_1[5][1]&temp_1[3][1]);

assign temp_2[6][0]=(temp_1[6][0])|(temp_1[6][1]&temp_1[4][0]);
assign temp_2[6][1]=(temp_1[6][0])|(temp_1[6][1]&temp_1[4][1]);

assign temp_2[7][0]=(temp_1[7][0])|(temp_1[7][1]&temp_1[5][0]);
assign temp_2[7][1]=(temp_1[7][0])|(temp_1[7][1]&temp_1[5][1]);

assign temp_2[8][0]=(temp_1[8][0])|(temp_1[8][1]&temp_1[6][0]);
assign temp_2[8][1]=(temp_1[8][0])|(temp_1[8][1]&temp_1[6][1]);

assign temp_2[9][0]=(temp_1[9][0])|(temp_1[9][1]&temp_1[7][0]);
assign temp_2[9][1]=(temp_1[9][0])|(temp_1[9][1]&temp_1[7][1]);

assign temp_2[10][0]=(temp_1[10][0])|(temp_1[10][1]&temp_1[8][0]);
assign temp_2[10][1]=(temp_1[10][0])|(temp_1[10][1]&temp_1[8][1]);

assign temp_2[11][0]=(temp_1[11][0])|(temp_1[11][1]&temp_1[9][0]);
assign temp_2[11][1]=(temp_1[11][0])|(temp_1[11][1]&temp_1[9][1]);

assign temp_2[12][0]=(temp_1[12][0])|(temp_1[12][1]&temp_1[10][0]);
assign temp_2[12][1]=(temp_1[12][0])|(temp_1[12][1]&temp_1[10][1]);

assign temp_2[13][0]=(temp_1[13][0])|(temp_1[13][1]&temp_1[11][0]);
assign temp_2[13][1]=(temp_1[13][0])|(temp_1[13][1]&temp_1[11][1]);

assign temp_2[14][0]=(temp_1[14][0])|(temp_1[14][1]&temp_1[12][0]);
assign temp_2[14][1]=(temp_1[14][0])|(temp_1[14][1]&temp_1[12][1]);

assign temp_2[15][0]=(temp_1[15][0])|(temp_1[15][1]&temp_1[13][0]);
assign temp_2[15][1]=(temp_1[15][0])|(temp_1[15][1]&temp_1[13][1]);

assign temp_2[16][0]=(temp_1[16][0])|(temp_1[16][1]&temp_1[14][0]);
assign temp_2[16][1]=(temp_1[16][0])|(temp_1[16][1]&temp_1[14][1]);

assign temp_2[17][0]=(temp_1[17][0])|(temp_1[17][1]&temp_1[15][0]);
assign temp_2[17][1]=(temp_1[17][0])|(temp_1[17][1]&temp_1[15][1]);

assign temp_2[18][0]=(temp_1[18][0])|(temp_1[18][1]&temp_1[16][0]);
assign temp_2[18][1]=(temp_1[18][0])|(temp_1[18][1]&temp_1[16][1]);

assign temp_2[19][0]=(temp_1[19][0])|(temp_1[19][1]&temp_1[17][0]);
assign temp_2[19][1]=(temp_1[19][0])|(temp_1[19][1]&temp_1[17][1]);

assign temp_2[20][0]=(temp_1[20][0])|(temp_1[20][1]&temp_1[18][0]);
assign temp_2[20][1]=(temp_1[20][0])|(temp_1[20][1]&temp_1[18][1]);

assign temp_2[21][0]=(temp_1[21][0])|(temp_1[21][1]&temp_1[19][0]);
assign temp_2[21][1]=(temp_1[21][0])|(temp_1[21][1]&temp_1[19][1]);

assign temp_2[22][0]=(temp_1[22][0])|(temp_1[22][1]&temp_1[20][0]);
assign temp_2[22][1]=(temp_1[22][0])|(temp_1[22][1]&temp_1[20][1]);

assign temp_2[23][0]=(temp_1[23][0])|(temp_1[23][1]&temp_1[21][0]);
assign temp_2[23][1]=(temp_1[23][0])|(temp_1[23][1]&temp_1[21][1]);

assign temp_2[24][0]=(temp_1[24][0])|(temp_1[24][1]&temp_1[22][0]);
assign temp_2[24][1]=(temp_1[24][0])|(temp_1[24][1]&temp_1[22][1]);

assign temp_2[25][0]=(temp_1[25][0])|(temp_1[25][1]&temp_1[23][0]);
assign temp_2[25][1]=(temp_1[25][0])|(temp_1[25][1]&temp_1[23][1]);

assign temp_2[26][0]=(temp_1[26][0])|(temp_1[26][1]&temp_1[24][0]);
assign temp_2[26][1]=(temp_1[26][0])|(temp_1[26][1]&temp_1[24][1]);

assign temp_2[27][0]=(temp_1[27][0])|(temp_1[27][1]&temp_1[25][0]);
assign temp_2[27][1]=(temp_1[27][0])|(temp_1[27][1]&temp_1[25][1]);

assign temp_2[28][0]=(temp_1[28][0])|(temp_1[28][1]&temp_1[26][0]);
assign temp_2[28][1]=(temp_1[28][0])|(temp_1[28][1]&temp_1[26][1]);

assign temp_2[29][0]=(temp_1[29][0])|(temp_1[29][1]&temp_1[27][0]);
assign temp_2[29][1]=(temp_1[29][0])|(temp_1[29][1]&temp_1[27][1]);

assign temp_2[30][0]=(temp_1[30][0])|(temp_1[30][1]&temp_1[28][0]);
assign temp_2[30][1]=(temp_1[30][0])|(temp_1[30][1]&temp_1[28][1]);

assign temp_2[31][0]=(temp_1[31][0])|(temp_1[31][1]&temp_1[29][0]);
assign temp_2[31][1]=(temp_1[31][0])|(temp_1[31][1]&temp_1[29][1]);

assign temp_2[32][0]=(temp_1[32][0])|(temp_1[32][1]&temp_1[30][0]);
assign temp_2[32][1]=(temp_1[32][0])|(temp_1[32][1]&temp_1[30][1]);


// 4 jumps
assign temp_3[1][0]=temp_2[1][0];
assign temp_3[1][1]=temp_2[1][1];

assign temp_3[2][0]=temp_2[2][0];
assign temp_3[2][1]=temp_2[2][1];

assign temp_3[3][0]=temp_2[3][0];
assign temp_3[3][1]=temp_2[3][1];

assign temp_3[4][0]=temp_2[4][0];
assign temp_3[4][1]=temp_2[4][1];

assign temp_3[5][0]=(temp_2[5][0])|(temp_2[5][1]&temp_2[1][0]);
assign temp_3[5][1]=(temp_2[5][0])|(temp_2[5][1]&temp_2[1][1]);

assign temp_3[6][0]=(temp_2[6][0])|(temp_2[6][1]&temp_2[2][0]);
assign temp_3[6][1]=(temp_2[6][0])|(temp_2[6][1]&temp_2[2][1]);

assign temp_3[7][0]=(temp_2[7][0])|(temp_2[7][1]&temp_2[3][0]);
assign temp_3[7][1]=(temp_2[7][0])|(temp_2[7][1]&temp_2[3][1]);

assign temp_3[8][0]=(temp_2[8][0])|(temp_2[8][1]&temp_2[4][0]);
assign temp_3[8][1]=(temp_2[8][0])|(temp_2[8][1]&temp_2[4][1]);

assign temp_3[9][0]=(temp_2[9][0])|(temp_2[9][1]&temp_2[5][0]);
assign temp_3[9][1]=(temp_2[9][0])|(temp_2[9][1]&temp_2[5][1]);

assign temp_3[10][0]=(temp_2[10][0])|(temp_2[10][1]&temp_2[6][0]);
assign temp_3[10][1]=(temp_2[10][0])|(temp_2[10][1]&temp_2[6][1]);

assign temp_3[11][0]=(temp_2[11][0])|(temp_2[11][1]&temp_2[7][0]);
assign temp_3[11][1]=(temp_2[11][0])|(temp_2[11][1]&temp_2[7][1]);

assign temp_3[12][0]=(temp_2[12][0])|(temp_2[12][1]&temp_2[8][0]);
assign temp_3[12][1]=(temp_2[12][0])|(temp_2[12][1]&temp_2[8][1]);

assign temp_3[13][0]=(temp_2[13][0])|(temp_2[13][1]&temp_2[9][0]);
assign temp_3[13][1]=(temp_2[13][0])|(temp_2[13][1]&temp_2[9][1]);

assign temp_3[14][0]=(temp_2[14][0])|(temp_2[14][1]&temp_2[10][0]);
assign temp_3[14][1]=(temp_2[14][0])|(temp_2[14][1]&temp_2[10][1]);

assign temp_3[15][0]=(temp_2[15][0])|(temp_2[15][1]&temp_2[11][0]);
assign temp_3[15][1]=(temp_2[15][0])|(temp_2[15][1]&temp_2[11][1]);

assign temp_3[16][0]=(temp_2[16][0])|(temp_2[16][1]&temp_2[12][0]);
assign temp_3[16][1]=(temp_2[16][0])|(temp_2[16][1]&temp_2[12][1]);

assign temp_3[17][0]=(temp_2[17][0])|(temp_2[17][1]&temp_2[13][0]);
assign temp_3[17][1]=(temp_2[17][0])|(temp_2[17][1]&temp_2[13][1]);

assign temp_3[18][0]=(temp_2[18][0])|(temp_2[18][1]&temp_2[14][0]);
assign temp_3[18][1]=(temp_2[18][0])|(temp_2[18][1]&temp_2[14][1]);

assign temp_3[19][0]=(temp_2[19][0])|(temp_2[19][1]&temp_2[15][0]);
assign temp_3[19][1]=(temp_2[19][0])|(temp_2[19][1]&temp_2[15][1]);

assign temp_3[20][0]=(temp_2[20][0])|(temp_2[20][1]&temp_2[16][0]);
assign temp_3[20][1]=(temp_2[20][0])|(temp_2[20][1]&temp_2[16][1]);

assign temp_3[21][0]=(temp_2[21][0])|(temp_2[21][1]&temp_2[17][0]);
assign temp_3[21][1]=(temp_2[21][0])|(temp_2[21][1]&temp_2[17][1]);

assign temp_3[22][0]=(temp_2[22][0])|(temp_2[22][1]&temp_2[18][0]);
assign temp_3[22][1]=(temp_2[22][0])|(temp_2[22][1]&temp_2[18][1]);

assign temp_3[23][0]=(temp_2[23][0])|(temp_2[23][1]&temp_2[19][0]);
assign temp_3[23][1]=(temp_2[23][0])|(temp_2[23][1]&temp_2[19][1]);

assign temp_3[24][0]=(temp_2[24][0])|(temp_2[24][1]&temp_2[20][0]);
assign temp_3[24][1]=(temp_2[24][0])|(temp_2[24][1]&temp_2[20][1]);

assign temp_3[25][0]=(temp_2[25][0])|(temp_2[25][1]&temp_2[21][0]);
assign temp_3[25][1]=(temp_2[25][0])|(temp_2[25][1]&temp_2[21][1]);

assign temp_3[26][0]=(temp_2[26][0])|(temp_2[26][1]&temp_2[22][0]);
assign temp_3[26][1]=(temp_2[26][0])|(temp_2[26][1]&temp_2[22][1]);

assign temp_3[27][0]=(temp_2[27][0])|(temp_2[27][1]&temp_2[23][0]);
assign temp_3[27][1]=(temp_2[27][0])|(temp_2[27][1]&temp_2[23][1]);

assign temp_3[28][0]=(temp_2[28][0])|(temp_2[28][1]&temp_2[24][0]);
assign temp_3[28][1]=(temp_2[28][0])|(temp_2[28][1]&temp_2[24][1]);

assign temp_3[29][0]=(temp_2[29][0])|(temp_2[29][1]&temp_2[25][0]);
assign temp_3[29][1]=(temp_2[29][0])|(temp_2[29][1]&temp_2[25][1]);

assign temp_3[30][0]=(temp_2[30][0])|(temp_2[30][1]&temp_2[26][0]);
assign temp_3[30][1]=(temp_2[30][0])|(temp_2[30][1]&temp_2[26][1]);

assign temp_3[31][0]=(temp_2[31][0])|(temp_2[31][1]&temp_2[27][0]);
assign temp_3[31][1]=(temp_2[31][0])|(temp_2[31][1]&temp_2[27][1]);

assign temp_3[32][0]=(temp_2[32][0])|(temp_2[32][1]&temp_2[28][0]);
assign temp_3[32][1]=(temp_2[32][0])|(temp_2[32][1]&temp_2[28][1]);


// 8 jumps
assign temp_4[1][0]=temp_3[1][0];
assign temp_4[1][1]=temp_3[1][1];

assign temp_4[2][0]=temp_3[2][0];
assign temp_4[2][1]=temp_3[2][1];

assign temp_4[3][0]=temp_3[3][0];
assign temp_4[3][1]=temp_3[3][1];

assign temp_4[4][0]=temp_3[4][0];
assign temp_4[4][1]=temp_3[4][1];

assign temp_4[5][0]=temp_3[5][0];
assign temp_4[5][1]=temp_3[5][1];

assign temp_4[6][0]=temp_3[6][0];
assign temp_4[6][1]=temp_3[6][1];

assign temp_4[7][0]=temp_3[7][0];
assign temp_4[7][1]=temp_3[7][1];

assign temp_4[8][0]=temp_3[8][0];
assign temp_4[8][1]=temp_3[8][1];

assign temp_4[9][0]=(temp_3[9][0])|(temp_3[9][1]&temp_3[1][0]);
assign temp_4[9][1]=(temp_3[9][0])|(temp_3[9][1]&temp_3[1][1]);

assign temp_4[10][0]=(temp_3[10][0])|(temp_3[10][1]&temp_3[2][0]);
assign temp_4[10][1]=(temp_3[10][0])|(temp_3[10][1]&temp_3[2][1]);

assign temp_4[11][0]=(temp_3[11][0])|(temp_3[11][1]&temp_3[3][0]);
assign temp_4[11][1]=(temp_3[11][0])|(temp_3[11][1]&temp_3[3][1]);

assign temp_4[12][0]=(temp_3[12][0])|(temp_3[12][1]&temp_3[4][0]);
assign temp_4[12][1]=(temp_3[12][0])|(temp_3[12][1]&temp_3[4][1]);

assign temp_4[13][0]=(temp_3[13][0])|(temp_3[13][1]&temp_3[5][0]);
assign temp_4[13][1]=(temp_3[13][0])|(temp_3[13][1]&temp_3[5][1]);

assign temp_4[14][0]=(temp_3[14][0])|(temp_3[14][1]&temp_3[6][0]);
assign temp_4[14][1]=(temp_3[14][0])|(temp_3[14][1]&temp_3[6][1]);

assign temp_4[15][0]=(temp_3[15][0])|(temp_3[15][1]&temp_3[7][0]);
assign temp_4[15][1]=(temp_3[15][0])|(temp_3[15][1]&temp_3[7][1]);

assign temp_4[16][0]=(temp_3[16][0])|(temp_3[16][1]&temp_3[8][0]);
assign temp_4[16][1]=(temp_3[16][0])|(temp_3[16][1]&temp_3[8][1]);

assign temp_4[17][0]=(temp_3[17][0])|(temp_3[17][1]&temp_3[9][0]);
assign temp_4[17][1]=(temp_3[17][0])|(temp_3[17][1]&temp_3[9][1]);

assign temp_4[18][0]=(temp_3[18][0])|(temp_3[18][1]&temp_3[10][0]);
assign temp_4[18][1]=(temp_3[18][0])|(temp_3[18][1]&temp_3[10][1]);

assign temp_4[19][0]=(temp_3[19][0])|(temp_3[19][1]&temp_3[11][0]);
assign temp_4[19][1]=(temp_3[19][0])|(temp_3[19][1]&temp_3[11][1]);

assign temp_4[20][0]=(temp_3[20][0])|(temp_3[20][1]&temp_3[12][0]);
assign temp_4[20][1]=(temp_3[20][0])|(temp_3[20][1]&temp_3[12][1]);

assign temp_4[21][0]=(temp_3[21][0])|(temp_3[21][1]&temp_3[13][0]);
assign temp_4[21][1]=(temp_3[21][0])|(temp_3[21][1]&temp_3[13][1]);

assign temp_4[22][0]=(temp_3[22][0])|(temp_3[22][1]&temp_3[14][0]);
assign temp_4[22][1]=(temp_3[22][0])|(temp_3[22][1]&temp_3[14][1]);

assign temp_4[23][0]=(temp_3[23][0])|(temp_3[23][1]&temp_3[15][0]);
assign temp_4[23][1]=(temp_3[23][0])|(temp_3[23][1]&temp_3[15][1]);

assign temp_4[24][0]=(temp_3[24][0])|(temp_3[24][1]&temp_3[16][0]);
assign temp_4[24][1]=(temp_3[24][0])|(temp_3[24][1]&temp_3[16][1]);

assign temp_4[25][0]=(temp_3[25][0])|(temp_3[25][1]&temp_3[17][0]);
assign temp_4[25][1]=(temp_3[25][0])|(temp_3[25][1]&temp_3[17][1]);

assign temp_4[26][0]=(temp_3[26][0])|(temp_3[26][1]&temp_3[18][0]);
assign temp_4[26][1]=(temp_3[26][0])|(temp_3[26][1]&temp_3[18][1]);

assign temp_4[27][0]=(temp_3[27][0])|(temp_3[27][1]&temp_3[19][0]);
assign temp_4[27][1]=(temp_3[27][0])|(temp_3[27][1]&temp_3[19][1]);

assign temp_4[28][0]=(temp_3[28][0])|(temp_3[28][1]&temp_3[20][0]);
assign temp_4[28][1]=(temp_3[28][0])|(temp_3[28][1]&temp_3[20][1]);

assign temp_4[29][0]=(temp_3[29][0])|(temp_3[29][1]&temp_3[21][0]);
assign temp_4[29][1]=(temp_3[29][0])|(temp_3[29][1]&temp_3[21][1]);

assign temp_4[30][0]=(temp_3[30][0])|(temp_3[30][1]&temp_3[22][0]);
assign temp_4[30][1]=(temp_3[30][0])|(temp_3[30][1]&temp_3[22][1]);

assign temp_4[31][0]=(temp_3[31][0])|(temp_3[31][1]&temp_3[23][0]);
assign temp_4[31][1]=(temp_3[31][0])|(temp_3[31][1]&temp_3[23][1]);

assign temp_4[32][0]=(temp_3[32][0])|(temp_3[32][1]&temp_3[24][0]);
assign temp_4[32][1]=(temp_3[32][0])|(temp_3[32][1]&temp_3[24][1]);



// 16 jumps 
assign temp_5[1][0]=temp_4[1][0];
assign temp_5[1][1]=temp_4[1][1];

assign temp_5[2][0]=temp_4[2][0];
assign temp_5[2][1]=temp_4[2][1];

assign temp_5[3][0]=temp_4[3][0];
assign temp_5[3][1]=temp_4[3][1];

assign temp_5[4][0]=temp_4[4][0];
assign temp_5[4][1]=temp_4[4][1];

assign temp_5[5][0]=temp_4[5][0];
assign temp_5[5][1]=temp_4[5][1];

assign temp_5[6][0]=temp_4[6][0];
assign temp_5[6][1]=temp_4[6][1];

assign temp_5[7][0]=temp_4[7][0];
assign temp_5[7][1]=temp_4[7][1];

assign temp_5[8][0]=temp_4[8][0];
assign temp_5[8][1]=temp_4[8][1];

assign temp_5[9][0]=temp_4[9][0];
assign temp_5[9][1]=temp_4[9][1];

assign temp_5[10][0]=temp_4[10][0];
assign temp_5[10][1]=temp_4[10][1];

assign temp_5[11][0]=temp_4[11][0];
assign temp_5[11][1]=temp_4[11][1];

assign temp_5[12][0]=temp_4[12][0];
assign temp_5[12][1]=temp_4[12][1];

assign temp_5[13][0]=temp_4[13][0];
assign temp_5[13][1]=temp_4[13][1];

assign temp_5[14][0]=temp_4[14][0];
assign temp_5[14][1]=temp_4[14][1];

assign temp_5[15][0]=temp_4[15][0];
assign temp_5[15][1]=temp_4[15][1];

assign temp_5[16][0]=temp_4[16][0];
assign temp_5[16][1]=temp_4[16][1];

assign temp_5[17][0]=(temp_4[17][0])|(temp_4[17][1]&temp_4[1][0]);
assign temp_5[17][1]=(temp_4[17][0])|(temp_4[17][1]&temp_4[1][1]);

assign temp_5[18][0]=(temp_4[18][0])|(temp_4[18][1]&temp_4[2][0]);
assign temp_5[18][1]=(temp_4[18][0])|(temp_4[18][1]&temp_4[2][1]);

assign temp_5[19][0]=(temp_4[19][0])|(temp_4[19][1]&temp_4[3][0]);
assign temp_5[19][1]=(temp_4[19][0])|(temp_4[19][1]&temp_4[3][1]);

assign temp_5[20][0]=(temp_4[20][0])|(temp_4[20][1]&temp_4[4][0]);
assign temp_5[20][1]=(temp_4[20][0])|(temp_4[20][1]&temp_4[4][1]);

assign temp_5[21][0]=(temp_4[21][0])|(temp_4[21][1]&temp_4[5][0]);
assign temp_5[21][1]=(temp_4[21][0])|(temp_4[21][1]&temp_4[5][1]);

assign temp_5[22][0]=(temp_4[22][0])|(temp_4[22][1]&temp_4[6][0]);
assign temp_5[22][1]=(temp_4[22][0])|(temp_4[22][1]&temp_4[6][1]);

assign temp_5[23][0]=(temp_4[23][0])|(temp_4[23][1]&temp_4[7][0]);
assign temp_5[23][1]=(temp_4[23][0])|(temp_4[23][1]&temp_4[7][1]);

assign temp_5[24][0]=(temp_4[24][0])|(temp_4[24][1]&temp_4[8][0]);
assign temp_5[24][1]=(temp_4[24][0])|(temp_4[24][1]&temp_4[8][1]);

assign temp_5[25][0]=(temp_4[25][0])|(temp_4[25][1]&temp_4[9][0]);
assign temp_5[25][1]=(temp_4[25][0])|(temp_4[25][1]&temp_4[9][1]);

assign temp_5[26][0]=(temp_4[26][0])|(temp_4[26][1]&temp_4[10][0]);
assign temp_5[26][1]=(temp_4[26][0])|(temp_4[26][1]&temp_4[10][1]);

assign temp_5[27][0]=(temp_4[27][0])|(temp_4[27][1]&temp_4[11][0]);
assign temp_5[27][1]=(temp_4[27][0])|(temp_4[27][1]&temp_4[11][1]);

assign temp_5[28][0]=(temp_4[28][0])|(temp_4[28][1]&temp_4[12][0]);
assign temp_5[28][1]=(temp_4[28][0])|(temp_4[28][1]&temp_4[12][1]);

assign temp_5[29][0]=(temp_4[29][0])|(temp_4[29][1]&temp_4[13][0]);
assign temp_5[29][1]=(temp_4[29][0])|(temp_4[29][1]&temp_4[13][1]);

assign temp_5[30][0]=(temp_4[30][0])|(temp_4[30][1]&temp_4[14][0]);
assign temp_5[30][1]=(temp_4[30][0])|(temp_4[30][1]&temp_4[14][1]);

assign temp_5[31][0]=(temp_4[31][0])|(temp_4[31][1]&temp_4[15][0]);
assign temp_5[31][1]=(temp_4[31][0])|(temp_4[31][1]&temp_4[15][1]);

assign temp_5[32][0]=(temp_4[32][0])|(temp_4[32][1]&temp_4[16][0]);
assign temp_5[32][1]=(temp_4[32][0])|(temp_4[32][1]&temp_4[16][1]);


//GK Calculating
assign gk[1]=temp_5[1][1];
assign gk[2]=temp_5[2][1];
assign gk[3]=temp_5[3][1];
assign gk[4]=temp_5[4][1];
assign gk[5]=temp_5[5][1];
assign gk[6]=temp_5[6][1];
assign gk[7]=temp_5[7][1];
assign gk[8]=temp_5[8][1];
assign gk[9]=temp_5[9][1];
assign gk[10]=temp_5[10][1];
assign gk[11]=temp_5[11][1];
assign gk[12]=temp_5[12][1];
assign gk[13]=temp_5[13][1];
assign gk[14]=temp_5[14][1];
assign gk[15]=temp_5[15][1];
assign gk[16]=temp_5[16][1];
assign gk[17]=temp_5[17][1];
assign gk[18]=temp_5[18][1];
assign gk[19]=temp_5[19][1];
assign gk[20]=temp_5[20][1];
assign gk[21]=temp_5[21][1];
assign gk[22]=temp_5[22][1];
assign gk[23]=temp_5[23][1];
assign gk[24]=temp_5[24][1];
assign gk[25]=temp_5[25][1];
assign gk[26]=temp_5[26][1];
assign gk[27]=temp_5[27][1];
assign gk[28]=temp_5[28][1];
assign gk[29]=temp_5[29][1];
assign gk[30]=temp_5[30][1];
assign gk[31]=temp_5[31][1];
assign gk[32]=temp_5[32][1];


//calculating sum
assign sum[1]=a[1]^b[1]^cin;
assign sum[2]=gk[1]^a[2]^b[2];
assign sum[3]=gk[2]^a[3]^b[3];
assign sum[4]=gk[3]^a[4]^b[4];
assign sum[5]=gk[4]^a[5]^b[5];
assign sum[6]=gk[5]^a[6]^b[6];
assign sum[7]=gk[6]^a[7]^b[7];
assign sum[8]=gk[7]^a[8]^b[8];
assign sum[9]=gk[8]^a[9]^b[9];
assign sum[10]=gk[9]^a[10]^b[10];
assign sum[11]=gk[10]^a[11]^b[11];
assign sum[12]=gk[11]^a[12]^b[12];
assign sum[13]=gk[12]^a[13]^b[13];
assign sum[14]=gk[13]^a[14]^b[14];
assign sum[15]=gk[14]^a[15]^b[15];
assign sum[16]=gk[15]^a[16]^b[16];
assign sum[17]=gk[16]^a[17]^b[17];
assign sum[18]=gk[17]^a[18]^b[18];
assign sum[19]=gk[18]^a[19]^b[19];
assign sum[20]=gk[19]^a[20]^b[20];
assign sum[21]=gk[20]^a[21]^b[21];
assign sum[22]=gk[21]^a[22]^b[22];
assign sum[23]=gk[22]^a[23]^b[23];
assign sum[24]=gk[23]^a[24]^b[24];
assign sum[25]=gk[24]^a[25]^b[25];
assign sum[26]=gk[25]^a[26]^b[26];
assign sum[27]=gk[26]^a[27]^b[27];
assign sum[28]=gk[27]^a[28]^b[28];
assign sum[29]=gk[28]^a[29]^b[29];
assign sum[30]=gk[29]^a[30]^b[30];
assign sum[31]=gk[30]^a[31]^b[31];
assign sum[32]=gk[31]^a[32]^b[32];

assign cout=gk[32];



endmodule





