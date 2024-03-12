
//
// Handles instructions:
//  - pmul
//  - pmulh
//
module xc_malu_pmul (

input  wire [31:0]  rs1             ,
input  wire [31:0]  rs2             ,

input  wire [ 5:0]  count           ,
input  wire [63:0]  acc             ,
input  wire [31:0]  arg_0           ,
input  wire         carryless       ,

input  wire         pw_16           , // 16-bit width packed elements.
input  wire         pw_8            , //  8-bit width packed elements.
input  wire         pw_4            , //  4-bit width packed elements.
input  wire         pw_2            , //  2-bit width packed elements.

output wire [31:0]  padd_lhs        , // Left hand input
output wire [31:0]  padd_rhs        , // Right hand input.
output wire [ 0:0]  padd_sub        , // Subtract if set, else add.
output wire         padd_cen        ,

input       [32:0]  padd_cout       , // Carry bits
input       [31:0]  padd_result     , // Result of the operation

output wire [63:0]  n_acc   ,
output wire [31:0]  n_arg_0         ,

output wire [63:0]  result          ,

output wire         ready        

);

wire [5:0] counter_finish = {1'b0,pw_16,pw_8,pw_4,pw_2,1'b0};

assign n_arg_0   = {1'b0, arg_0[31:1]};

assign ready     = count == counter_finish;

assign padd_cen  = !carryless;

wire add_en_16_0    = arg_0[ 0];
wire add_en_16_1    = arg_0[16];

wire add_en_8_0     = arg_0[ 0];
wire add_en_8_1     = arg_0[ 8];
wire add_en_8_2     = arg_0[16];
wire add_en_8_3     = arg_0[24];

wire add_en_4_0     = arg_0[ 0];
wire add_en_4_1     = arg_0[ 4];
wire add_en_4_2     = arg_0[ 8];
wire add_en_4_3     = arg_0[12];
wire add_en_4_4     = arg_0[16];
wire add_en_4_5     = arg_0[20];
wire add_en_4_6     = arg_0[24];
wire add_en_4_7     = arg_0[28];

wire add_en_2_0     = arg_0[ 0];
wire add_en_2_1     = arg_0[ 2];
wire add_en_2_2     = arg_0[ 4];
wire add_en_2_3     = arg_0[ 6];
wire add_en_2_4     = arg_0[ 8];
wire add_en_2_5     = arg_0[10];
wire add_en_2_6     = arg_0[12];
wire add_en_2_7     = arg_0[14];
wire add_en_2_8     = arg_0[16];
wire add_en_2_9     = arg_0[18];
wire add_en_2_10    = arg_0[20];
wire add_en_2_11    = arg_0[22];
wire add_en_2_12    = arg_0[24];
wire add_en_2_13    = arg_0[26];
wire add_en_2_14    = arg_0[28];
wire add_en_2_15    = arg_0[30];

// Mask for adding 16-bit values
wire [15:0] addm_16_0   = {16{add_en_16_0}};
wire [15:0] addm_16_1   = {16{add_en_16_1}};
wire [31:0] addm_16     = {addm_16_1, addm_16_0};

// Mask for adding 8-bit values
wire [ 7:0] addm_8_0    = {8{add_en_8_0}};
wire [ 7:0] addm_8_1    = {8{add_en_8_1}};
wire [ 7:0] addm_8_2    = {8{add_en_8_2}};
wire [ 7:0] addm_8_3    = {8{add_en_8_3}};
wire [31:0] addm_8      = {addm_8_3, addm_8_2,addm_8_1, addm_8_0};

// Mask for adding 4-bit values
wire [ 3:0] addm_4_0    = {4{add_en_4_0}};
wire [ 3:0] addm_4_1    = {4{add_en_4_1}};
wire [ 3:0] addm_4_2    = {4{add_en_4_2}};
wire [ 3:0] addm_4_3    = {4{add_en_4_3}};
wire [ 3:0] addm_4_4    = {4{add_en_4_4}};
wire [ 3:0] addm_4_5    = {4{add_en_4_5}};
wire [ 3:0] addm_4_6    = {4{add_en_4_6}};
wire [ 3:0] addm_4_7    = {4{add_en_4_7}};
wire [31:0] addm_4      = {addm_4_7, addm_4_6,addm_4_5, addm_4_4,
                           addm_4_3, addm_4_2,addm_4_1, addm_4_0};

// Mask for adding 2-bit values
wire [ 1:0] addm_2_0    = {2{add_en_2_0 }};
wire [ 1:0] addm_2_1    = {2{add_en_2_1 }};
wire [ 1:0] addm_2_2    = {2{add_en_2_2 }};
wire [ 1:0] addm_2_3    = {2{add_en_2_3 }};
wire [ 1:0] addm_2_4    = {2{add_en_2_4 }};
wire [ 1:0] addm_2_5    = {2{add_en_2_5 }};
wire [ 1:0] addm_2_6    = {2{add_en_2_6 }};
wire [ 1:0] addm_2_7    = {2{add_en_2_7 }};
wire [ 1:0] addm_2_8    = {2{add_en_2_8 }};
wire [ 1:0] addm_2_9    = {2{add_en_2_9 }};
wire [ 1:0] addm_2_10   = {2{add_en_2_10}};
wire [ 1:0] addm_2_11   = {2{add_en_2_11}};
wire [ 1:0] addm_2_12   = {2{add_en_2_12}};
wire [ 1:0] addm_2_13   = {2{add_en_2_13}};
wire [ 1:0] addm_2_14   = {2{add_en_2_14}};
wire [ 1:0] addm_2_15   = {2{add_en_2_15}};
wire [31:0] addm_2      = {addm_2_15, addm_2_14, addm_2_13, addm_2_12, 
                           addm_2_11, addm_2_10, addm_2_9 , addm_2_8 ,
                           addm_2_7 , addm_2_6 , addm_2_5 , addm_2_4 ,
                           addm_2_3 , addm_2_2 , addm_2_1 , addm_2_0 };

// Mask for the right hand packed adder input.
wire [31:0] padd_mask   =   {32{pw_16}} & addm_16   |
                            {32{pw_8 }} & addm_8    |
                            {32{pw_4 }} & addm_4    |
                            {32{pw_2 }} & addm_2    ;

// Inputs to the packed adder

wire [31:0] padd_lhs_16 = {acc[63:48], acc[31:16]};

wire [31:0] padd_lhs_8  =
    {acc[63:56], acc[47:40], acc[31:24], acc[15:8]};

wire [31:0] padd_lhs_4  = 
    {acc[63:60], acc[55:52], acc[47:44], acc[39:36], 
     acc[31:28], acc[23:20], acc[15:12], acc[ 7: 4]};

wire [31:0] padd_lhs_2  =
    {acc[63:62], acc[59:58], acc[55:54], acc[51:50], 
     acc[47:46], acc[43:42], acc[39:38], acc[35:34], 
     acc[31:30], acc[27:26], acc[23:22], acc[19:18], 
     acc[15:14], acc[11:10], acc[ 7: 6], acc[ 3: 2]};

assign padd_lhs    = 
    {32{pw_16}} & padd_lhs_16 |
    {32{pw_8 }} & padd_lhs_8  |
    {32{pw_4 }} & padd_lhs_4  |
    {32{pw_2 }} & padd_lhs_2  ;

assign padd_rhs    = rs1 & padd_mask;

assign        padd_sub    = 1'b0;

// Result of the packed addition operation
wire [31:0] cadd_carry  = 32'b0; //

wire [31:0] add_result =  padd_result;
wire [31:0] add_carry  =  padd_cout [31:0] ;

wire [63:0] n_acc_16 = 
                        {add_carry[31],add_result[31:16],acc[47:33], 
                         add_carry[15],add_result[15: 0],acc[15:1 ]};

wire [63:0] n_acc_8  =
                        {add_carry[31],add_result[31:24],acc[55:49], 
                         add_carry[23],add_result[23:16],acc[39:33], 
                         add_carry[15],add_result[15: 8],acc[23:17], 
                         add_carry[ 7],add_result[ 7: 0],acc[ 7: 1]};

wire [63:0] n_acc_4  =
                        {add_carry[31],add_result[31:28],acc[59:57], 
                         add_carry[27],add_result[27:24],acc[51:49], 
                         add_carry[23],add_result[23:20],acc[43:41], 
                         add_carry[19],add_result[19:16],acc[35:33], 
                         add_carry[15],add_result[15:12],acc[27:25], 
                         add_carry[11],add_result[11: 8],acc[19:17], 
                         add_carry[ 7],add_result[ 7: 4],acc[11: 9], 
                         add_carry[ 3],add_result[ 3: 0],acc[ 3: 1]};

wire [63:0] n_acc_2  =
                        {add_carry[31],add_result[31:30],acc[61], 
                         add_carry[29],add_result[29:28],acc[57], 
                         add_carry[27],add_result[27:26],acc[53], 
                         add_carry[25],add_result[25:24],acc[49], 
                         add_carry[23],add_result[23:22],acc[45], 
                         add_carry[21],add_result[21:20],acc[41], 
                         add_carry[19],add_result[19:18],acc[37], 
                         add_carry[17],add_result[17:16],acc[33], 
                         add_carry[15],add_result[15:14],acc[29], 
                         add_carry[13],add_result[13:12],acc[25], 
                         add_carry[11],add_result[11:10],acc[21], 
                         add_carry[ 9],add_result[ 9: 8],acc[17], 
                         add_carry[ 7],add_result[ 7: 6],acc[13], 
                         add_carry[ 5],add_result[ 5: 4],acc[ 9], 
                         add_carry[ 3],add_result[ 3: 2],acc[ 5], 
                         add_carry[ 1],add_result[ 1: 0],acc[ 1]};

assign n_acc = 
    {64{pw_16}} & n_acc_16 |
    {64{pw_8 }} & n_acc_8  |
    {64{pw_4 }} & n_acc_4  |
    {64{pw_2 }} & n_acc_2  ;


wire [31:0]  pmul_result_0_16 = {acc[32+:16],acc[0 +:16]};
wire [31:0]  pmul_result_1_16 = {acc[48+:16],acc[16+:16]};

wire [31:0]  pmul_result_0_8  = {acc[48+: 8],acc[32+: 8],
                                 acc[16+: 8],acc[0 +: 8]};

wire [31:0]  pmul_result_1_8  = {acc[56+: 8],acc[40+: 8],
                                 acc[24+: 8],acc[ 8+: 8]};

wire [31:0]  pmul_result_0_4  = {acc[56+: 4],acc[48+: 4],
                                 acc[40+: 4],acc[32+: 4],
                                 acc[24+: 4],acc[16+: 4],
                                 acc[ 8+: 4],acc[ 0+: 4]};
wire [31:0]  pmul_result_1_4  = {acc[60+: 4],acc[52+: 4],
                                 acc[44+: 4],acc[36+: 4],
                                 acc[28+: 4],acc[20+: 4],
                                 acc[12+: 4],acc[ 4+: 4]};

wire [31:0]  pmul_result_0_2  = {acc[60+: 2],acc[56+: 2],
                                 acc[52+: 2],acc[48+: 2],
                                 acc[44+: 2],acc[40+: 2],
                                 acc[36+: 2],acc[32+: 2],
                                 acc[28+: 2],acc[24+: 2],
                                 acc[20+: 2],acc[16+: 2],
                                 acc[12+: 2],acc[ 8+: 2],
                                 acc[ 4+: 2],acc[ 0+: 2]};
wire [31:0]  pmul_result_1_2  = {acc[62+: 2],acc[58+: 2],
                                 acc[54+: 2],acc[50+: 2],
                                 acc[46+: 2],acc[42+: 2],
                                 acc[38+: 2],acc[34+: 2],
                                 acc[30+: 2],acc[26+: 2],
                                 acc[22+: 2],acc[18+: 2],
                                 acc[14+: 2],acc[10+: 2],
                                 acc[ 6+: 2],acc[ 2+: 2]};

wire [31:0] pmul_result_0     = {32{pw_16}} & pmul_result_0_16 |
                                {32{pw_8 }} & pmul_result_0_8  |
                                {32{pw_4 }} & pmul_result_0_4  |
                                {32{pw_2 }} & pmul_result_0_2  ;

wire [31:0] pmul_result_1     = {32{pw_16}} & pmul_result_1_16 |
                                {32{pw_8 }} & pmul_result_1_8  |
                                {32{pw_4 }} & pmul_result_1_4  |
                                {32{pw_2 }} & pmul_result_1_2  ;

assign result = {pmul_result_1, pmul_result_0};

endmodule
