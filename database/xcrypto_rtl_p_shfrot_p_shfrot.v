
//
// module: p_shfrot
//
//  Barrel implementation of the packed shift/rotate instructions.
//
module p_shfrot (

input  [31:0] crs1  , // Source register 1
input  [ 4:0] shamt , // Shift amount (immediate or source register 2)

input  [ 4:0] pw    , // Pack width to operate on

input         shift , // Shift left/right
input         rotate, // Rotate left/right
input         left  , // Shift/roate left
input         right , // Shift/rotate right

output [31:0] result  // Operation result

);

wire w_32 = pw[0];
wire w_16 = pw[1];
wire w_8  = pw[2];
wire w_4  = pw[3];
wire w_2  = pw[4];

wire [31:0] l0 =  crs1;

wire [31:0] l1;
wire [31:0] l2;
wire [31:0] l4;
wire [31:0] l8;
wire [31:0] l16;


//
// Level 1 code.

wire [31:0] l1_32_left  = {l0[30:0], rotate && l0[31]};

wire [31:0] l1_32_right = {rotate && l0[0], l0[31:1]};

wire [31:0] l1_16_left  = {l0[30:16], rotate && l0[31],
                           l0[14: 0], rotate && l0[15]};

wire [31:0] l1_16_right = {rotate && l0[16], l0[31:17],
                           rotate && l0[ 0], l0[15: 1]};

wire [31:0] l1_8_left   = {l0[30:24], rotate && l0[31],
                           l0[22:16], rotate && l0[23],
                           l0[14: 8], rotate && l0[15],
                           l0[ 6: 0], rotate && l0[ 7]};

wire [31:0] l1_8_right  = {rotate && l0[24], l0[31:25],
                           rotate && l0[16], l0[23:17],
                           rotate && l0[ 8], l0[15: 9],
                           rotate && l0[ 0], l0[ 7: 1]};

wire [31:0] l1_4_left   = {l0[30:28], rotate && l0[31],
                           l0[26:24], rotate && l0[27],
                           l0[22:20], rotate && l0[23],
                           l0[18:16], rotate && l0[19],
                           l0[14:12], rotate && l0[15],
                           l0[10: 8], rotate && l0[11],
                           l0[ 6: 4], rotate && l0[ 7],
                           l0[ 2: 0], rotate && l0[ 3]};

wire [31:0] l1_4_right  = {rotate && l0[28], l0[31:29],
                           rotate && l0[24], l0[27:25],
                           rotate && l0[20], l0[23:21],
                           rotate && l0[16], l0[19:17],
                           rotate && l0[12], l0[15:13],
                           rotate && l0[ 8], l0[11: 9],
                           rotate && l0[ 4], l0[ 7: 5],
                           rotate && l0[ 0], l0[ 3: 1]};

wire [31:0] l1_2_left   = {l0[30], rotate && l0[31],
                           l0[28], rotate && l0[29],
                           l0[26], rotate && l0[27],
                           l0[24], rotate && l0[25],
                           l0[22], rotate && l0[23],
                           l0[20], rotate && l0[21],
                           l0[18], rotate && l0[19],
                           l0[16], rotate && l0[17],
                           l0[14], rotate && l0[15],
                           l0[12], rotate && l0[13],
                           l0[10], rotate && l0[11],
                           l0[ 8], rotate && l0[ 9],
                           l0[ 6], rotate && l0[ 7],
                           l0[ 4], rotate && l0[ 5],
                           l0[ 2], rotate && l0[ 3],
                           l0[ 0], rotate && l0[ 1]};

wire [31:0] l1_2_right  = {rotate && l0[30], l0[31],
                           rotate && l0[28], l0[29],
                           rotate && l0[26], l0[27],
                           rotate && l0[24], l0[25],
                           rotate && l0[22], l0[23],
                           rotate && l0[20], l0[21],
                           rotate && l0[18], l0[19],
                           rotate && l0[16], l0[17],
                           rotate && l0[14], l0[15],
                           rotate && l0[12], l0[13],
                           rotate && l0[10], l0[11],
                           rotate && l0[ 8], l0[ 9],
                           rotate && l0[ 6], l0[ 7],
                           rotate && l0[ 4], l0[ 5],
                           rotate && l0[ 2], l0[ 3],
                           rotate && l0[ 0], l0[ 1]};
    
wire ld_l1_l_32 =left  && w_32 && shamt[0];
wire ld_l1_r_32 =right && w_32 && shamt[0];

wire ld_l1_l_16 =left  && w_16 && shamt[0];
wire ld_l1_r_16 =right && w_16 && shamt[0];

wire ld_l1_l_8  =left  && w_8  && shamt[0];
wire ld_l1_r_8  =right && w_8  && shamt[0];

wire ld_l1_l_4  =left  && w_4  && shamt[0];
wire ld_l1_r_4  =right && w_4  && shamt[0];

wire ld_l1_l_2  =left  && w_2  && shamt[0];
wire ld_l1_r_2  =right && w_2  && shamt[0];

wire ld_l1_n_n  =                !shamt[0];

assign l1 =
    {32{ld_l1_l_32}} & l1_32_left    |
    {32{ld_l1_r_32}} & l1_32_right   |
    {32{ld_l1_l_16}} & l1_16_left    |
    {32{ld_l1_r_16}} & l1_16_right   |
    {32{ld_l1_l_8 }} & l1_8_left     |
    {32{ld_l1_r_8 }} & l1_8_right    |
    {32{ld_l1_l_4 }} & l1_4_left     |
    {32{ld_l1_r_4 }} & l1_4_right    |
    {32{ld_l1_l_2 }} & l1_2_left     |
    {32{ld_l1_r_2 }} & l1_2_right    |
    {32{ld_l1_n_n }} & l0            ;

//
// Level 2 code.
//

wire [31:0] l2_32_left  = {l1[29:0], {2{rotate}} & l1[31:30]};

wire [31:0] l2_32_right = {{2{rotate}} & l1[1:0], l1[31:2]};

wire [31:0] l2_16_left  = {l1[29:16], {2{rotate}} & l1[31:30],
                           l1[13: 0], {2{rotate}} & l1[15:14]};

wire [31:0] l2_16_right = {{2{rotate}} & l1[17:16], l1[31:18],
                           {2{rotate}} & l1[ 1: 0], l1[15: 2]};

wire [31:0] l2_8_left   = {l1[29:24], {2{rotate}} & l1[31:30],
                           l1[21:16], {2{rotate}} & l1[23:22],
                           l1[13: 8], {2{rotate}} & l1[15:14],
                           l1[ 5: 0], {2{rotate}} & l1[ 7: 6]};

wire [31:0] l2_8_right  = {{2{rotate}} & l1[25:24], l1[31:26],
                           {2{rotate}} & l1[17:16], l1[23:18],
                           {2{rotate}} & l1[ 9: 8], l1[15:10],
                           {2{rotate}} & l1[ 1: 0], l1[ 7: 2]};

wire [31:0] l2_4_left   = {l1[29:28], {2{rotate}} & l1[31:30],
                           l1[25:24], {2{rotate}} & l1[27:26],
                           l1[21:20], {2{rotate}} & l1[23:22],
                           l1[17:16], {2{rotate}} & l1[19:18],
                           l1[13:12], {2{rotate}} & l1[15:14],
                           l1[ 9: 8], {2{rotate}} & l1[11:10],
                           l1[ 5: 4], {2{rotate}} & l1[ 7: 6],
                           l1[ 1: 0], {2{rotate}} & l1[ 3: 2]};

wire [31:0] l2_4_right  = {{2{rotate}} & l1[29:28], l1[31:30],
                           {2{rotate}} & l1[25:24], l1[27:26],
                           {2{rotate}} & l1[21:20], l1[23:22],
                           {2{rotate}} & l1[17:16], l1[19:18],
                           {2{rotate}} & l1[13:12], l1[15:14],
                           {2{rotate}} & l1[ 9: 8], l1[11:10],
                           {2{rotate}} & l1[ 5: 4], l1[ 7: 6],
                           {2{rotate}} & l1[ 1: 0], l1[ 3: 2]};

wire [31:0] l2_2        = rotate ? l1 : 32'b0;
    
wire ld_l2_l_32 =left  && w_32 && shamt[1];
wire ld_l2_r_32 =right && w_32 && shamt[1];

wire ld_l2_l_16 =left  && w_16 && shamt[1];
wire ld_l2_r_16 =right && w_16 && shamt[1];

wire ld_l2_l_8  =left  && w_8  && shamt[1];
wire ld_l2_r_8  =right && w_8  && shamt[1];

wire ld_l2_l_4  =left  && w_4  && shamt[1];
wire ld_l2_r_4  =right && w_4  && shamt[1];

wire ld_l2_2    =         w_2  && shamt[1];

wire ld_l2_n_n  =                !shamt[1];

assign l2 = 
    {32{ld_l2_l_32}} & l2_32_left    |
    {32{ld_l2_r_32}} & l2_32_right   |
    {32{ld_l2_l_16}} & l2_16_left    |
    {32{ld_l2_r_16}} & l2_16_right   |
    {32{ld_l2_l_8 }} & l2_8_left     |
    {32{ld_l2_r_8 }} & l2_8_right    |
    {32{ld_l2_l_4 }} & l2_4_left     |
    {32{ld_l2_r_4 }} & l2_4_right    |
    {32{ld_l2_2   }} & l2_2          |
    {32{ld_l2_n_n }} & l1            ;

//
// Level 3 code - shift/rotate by 4
wire [31:0] l4_32_left  = {l2[27:0], {4{rotate}} & l2[31:28]};

wire [31:0] l4_32_right = {{4{rotate}} & l2[3:0], l2[31:4]};

wire [31:0] l4_16_left  = {l2[27:16], {4{rotate}} & l2[31:28],
                           l2[11: 0], {4{rotate}} & l2[15:12]};

wire [31:0] l4_16_right = {{4{rotate}} & l2[19:16], l2[31:20],
                           {4{rotate}} & l2[ 3: 0], l2[15: 4]};

wire [31:0] l4_8_left   = {l2[27:24], {4{rotate}} & l2[31:28],
                           l2[19:16], {4{rotate}} & l2[23:20],
                           l2[11: 8], {4{rotate}} & l2[15:12],
                           l2[ 3: 0], {4{rotate}} & l2[ 7: 4]};

wire [31:0] l4_8_right  = {{4{rotate}} & l2[27:24], l2[31:28],
                           {4{rotate}} & l2[19:16], l2[23:20],
                           {4{rotate}} & l2[11: 8], l2[15:12],
                           {4{rotate}} & l2[ 3: 0], l2[ 7: 4]};

wire [31:0] l4_4        = rotate ? l2 : 32'b0;

wire [31:0] l4_2        = rotate ? l2 : 32'b0;
    
wire ld_l4_l_32 =left  && w_32 && shamt[2];
wire ld_l4_r_32 =right && w_32 && shamt[2];

wire ld_l4_l_16 =left  && w_16 && shamt[2];
wire ld_l4_r_16 =right && w_16 && shamt[2];

wire ld_l4_l_8  =left  && w_8  && shamt[2];
wire ld_l4_r_8  =right && w_8  && shamt[2];

wire ld_l4_l_4  =left  && w_4  && shamt[2];
wire ld_l4_r_4  =right && w_4  && shamt[2];

wire ld_l4_l_2  =left  && w_2  && shamt[2];
wire ld_l4_r_2  =right && w_2  && shamt[2];

wire ld_l4_n_n  =                !shamt[2];

assign l4 =
    {32{ld_l4_l_32}} & l4_32_left    |
    {32{ld_l4_r_32}} & l4_32_right   |
    {32{ld_l4_l_16}} & l4_16_left    |
    {32{ld_l4_r_16}} & l4_16_right   |
    {32{ld_l4_l_8 }} & l4_8_left     |
    {32{ld_l4_r_8 }} & l4_8_right    |
    {32{ld_l4_l_4 }} & l4_4          |
    {32{ld_l4_r_4 }} & l4_4          |
    {32{ld_l4_l_2 }} & l4_2          |
    {32{ld_l4_r_2 }} & l4_2          |
    {32{ld_l4_n_n }} & l2            ;

//
// Level 4 code - shift/rotate by 8.
wire [31:0] l8_32_left  = {l4[23:0], {8{rotate}} & l4[31:24]};

wire [31:0] l8_32_right = {{8{rotate}} & l4[7:0], l4[31:8]};

wire [31:0] l8_16_left  = {l4[23:16], {8{rotate}} & l4[31:24],
                           l4[ 7: 0], {8{rotate}} & l4[15: 8]};

wire [31:0] l8_16_right = {{8{rotate}} & l4[23:16], l4[31:24],
                           {8{rotate}} & l4[ 7: 0], l4[15: 8]};

wire [31:0] l8_8        = rotate ? l4 : 32'b0;

wire [31:0] l8_4        = rotate ? l4 : 32'b0;

wire [31:0] l8_2        = rotate ? l4 : 32'b0;
    
wire ld_l8_l_32 =left  && w_32 && shamt[3];
wire ld_l8_r_32 =right && w_32 && shamt[3];

wire ld_l8_l_16 =left  && w_16 && shamt[3];
wire ld_l8_r_16 =right && w_16 && shamt[3];

wire ld_l8_l_8  =left  && w_8  && shamt[3];
wire ld_l8_r_8  =right && w_8  && shamt[3];

wire ld_l8_l_4  =left  && w_4  && shamt[3];
wire ld_l8_r_4  =right && w_4  && shamt[3];

wire ld_l8_l_2  =left  && w_2  && shamt[3];
wire ld_l8_r_2  =right && w_2  && shamt[3];

wire ld_l8_n_n  =                !shamt[3];

assign l8 =
    {32{ld_l8_l_32}} & l8_32_left    |
    {32{ld_l8_r_32}} & l8_32_right   |
    {32{ld_l8_l_16}} & l8_16_left    |
    {32{ld_l8_r_16}} & l8_16_right   |
    {32{ld_l8_l_8 }} & l8_8          |
    {32{ld_l8_r_8 }} & l8_8          |
    {32{ld_l8_l_4 }} & l8_4          |
    {32{ld_l8_r_4 }} & l8_4          |
    {32{ld_l8_l_2 }} & l8_2          |
    {32{ld_l8_r_2 }} & l8_2          |
    {32{ld_l8_n_n }} & l4            ;

//
// Level 5 code.
wire [31:0] l16_32_left  = {l8[15:0], {16{rotate}} & l8[31:16]};

wire [31:0] l16_32_right = {{16{rotate}} & l8[15: 0], l8[31:16]};

wire [31:0] l16_16       = rotate ? l8 : 32'b0;

wire [31:0] l16_8        = rotate ? l8 : 32'b0;

wire [31:0] l16_4        = rotate ? l8 : 32'b0;

wire [31:0] l16_2        = rotate ? l8 : 32'b0;
    
wire ld_l16_l_32 =left  && w_32 && shamt[4];
wire ld_l16_r_32 =right && w_32 && shamt[4];

wire ld_l16_l_16 =left  && w_16 && shamt[4];
wire ld_l16_r_16 =right && w_16 && shamt[4];

wire ld_l16_l_8  =left  && w_8  && shamt[4];
wire ld_l16_r_8  =right && w_8  && shamt[4];

wire ld_l16_l_4  =left  && w_4  && shamt[4];
wire ld_l16_r_4  =right && w_4  && shamt[4];

wire ld_l16_l_2  =left  && w_2  && shamt[4];
wire ld_l16_r_2  =right && w_2  && shamt[4];

wire ld_l16_n_n  =                !shamt[4];

assign l16 =
    {32{ld_l16_l_32}} & l16_32_left    |
    {32{ld_l16_r_32}} & l16_32_right   |
    {32{ld_l16_l_16}} & l16_16         |
    {32{ld_l16_r_16}} & l16_16         |
    {32{ld_l16_l_8 }} & l16_8          |
    {32{ld_l16_r_8 }} & l16_8          |
    {32{ld_l16_l_4 }} & l16_4          |
    {32{ld_l16_r_4 }} & l16_4          |
    {32{ld_l16_l_2 }} & l16_2          |
    {32{ld_l16_r_2 }} & l16_2          |
    {32{ld_l16_n_n }} & l8             ;

// Finish.
assign result = l16;

endmodule
