
//
// module: xc_malu_muldivrem
//
//  Module for handling:
//  - multiplication (ss,su,uu)
//  - division (signed/unsigned)
//  - remainder (signed/unsigned)
//  - packed multiplication (16,8,4,2)
//
module xc_malu_muldivrem (

input  wire         clock           ,
input  wire         resetn          ,

input  wire [31:0]  rs1             , //
input  wire [31:0]  rs2             , //
input  wire [31:0]  rs3             , //

input  wire         flush           , // Flush state / pipeline progress
input  wire         valid           , // Inputs valid.

input  wire         do_div          , //
input  wire         do_divu         , //
input  wire         do_rem          , //
input  wire         do_remu         , //
input  wire         do_mul          , //
input  wire         do_mulu         , //
input  wire         do_mulsu        , //
input  wire         do_clmul        , //
input  wire         do_pmul         , //
input  wire         do_pclmul       , //

input  wire         pw_32           , // 32-bit width packed elements.
input  wire         pw_16           , // 16-bit width packed elements.
input  wire         pw_8            , //  8-bit width packed elements.
input  wire         pw_4            , //  4-bit width packed elements.
input  wire         pw_2            , //  2-bit width packed elements.

input  wire [ 5:0]  count           , // Current count value
input  wire [63:0]  acc             , // Current accumulator value
input  wire [31:0]  arg_0           , // Current arg 0 value
input  wire [31:0]  arg_1           , // Current arg 1 value

output wire [63:0]  n_acc           , // Next accumulator value
output wire [31:0]  n_arg_0         , // Next arg 0 value
output wire [31:0]  n_arg_1         , // Next arg 1 value

output wire [31:0]  padd_lhs        , // Packed adder left input
output wire [31:0]  padd_rhs        , // Packed adder right input
output wire         padd_sub        , // Packed adder subtract?
output wire         padd_cin        , // Packed adder carry in
output wire         padd_cen        , // Packed adder carry enable.

input  wire [32:0]  padd_cout       ,
input  wire [31:0]  padd_result     ,

output wire [63:0]  result          , // 64-bit result
output wire         ready             // Outputs ready.

);


wire route_div = do_div || do_divu   || do_rem   || do_remu     ;
wire route_mul = do_mul || do_mulu   || do_mulsu || do_clmul    ;
wire route_pmul= do_pmul|| do_pclmul ;

//
// Submodule interface wires
// -----------------------------------------------------------------

wire         mul_carryless= do_clmul || do_pclmul;
wire         mul_lhs_sign = do_mul   || do_mulsu ;
wire         mul_rhs_sign = do_mul               ;
wire [31:0]  mul_padd_lhs        ; // Packed adder left input
wire [31:0]  mul_padd_rhs        ; // Packed adder right input
wire         mul_padd_sub        ; // Packed adder subtract?
wire         mul_padd_cin        ; // Packed adder carry in
wire         mul_padd_cen        ; // Packed adder carry enable.
wire [63:0]  mul_n_acc           ;
wire [31:0]  mul_n_arg_0         ;
wire         mul_ready           ;
wire [63:0]  mul_result   = acc;

wire         div_outsign  = do_div && (rs1[31] != rs2[31]) && |rs2;
wire         rem_outsign  = do_rem && rs1[31];

wire         result_div   = do_div || do_divu;
wire         result_rem   = do_rem || do_remu;

wire         div_signed   = do_div || do_rem  ;
wire [31:0]  div_padd_lhs        ; // Left hand input
wire [31:0]  div_padd_rhs        ; // Right hand input.
wire [ 0:0]  div_padd_sub        ; // Subtract if set, else add.
wire [63:0]  div_n_acc           ;
wire [31:0]  div_n_arg_0         ;
wire [31:0]  div_n_arg_1         ;
wire         div_ready           ;

wire [31:0]  arg_sel             = result_div ? arg_1 : arg_0;
wire         arg_sel_neg         = div_outsign && result_div ||
                                   rem_outsign && result_rem ;

wire [63:0]  divrem_result       = {32'b0,arg_sel_neg ? -arg_sel : arg_sel};

wire [31:0]  pmul_padd_lhs       ; // Left hand input
wire [31:0]  pmul_padd_rhs       ; // Right hand input.
wire [ 0:0]  pmul_padd_sub       ; // Subtract if set, else add.
wire         pmul_padd_cen       ;
wire [63:0]  pmul_n_acc          ;
wire [31:0]  pmul_n_arg_0        ;
wire [31:0]  pmul_n_arg_1        ;
wire [63:0]  pmul_result         ;
wire         pmul_ready          ;

//
// Routing to parent module
// -----------------------------------------------------------------

assign n_acc    = {64{route_pmul}} & pmul_n_acc    |
                  {64{route_mul }} &  mul_n_acc    |
                  {64{route_div }} &  div_n_acc    ;

assign n_arg_0  = {32{route_pmul}} & pmul_n_arg_0  |
                  {32{route_mul }} &  mul_n_arg_0  |
                  {32{route_div }} &  div_n_arg_0  ;

assign n_arg_1  =                     div_n_arg_1  ;

assign padd_lhs = {32{route_pmul}} & pmul_padd_lhs |
                  {32{route_mul }} &  mul_padd_lhs ;

assign padd_rhs = {32{route_pmul}} & pmul_padd_rhs |
                  {32{route_mul }} &  mul_padd_rhs ;

assign padd_sub =     route_pmul  && pmul_padd_sub ||
                      route_mul   &&  mul_padd_sub  ;

assign padd_cin =     route_mul   &&  mul_padd_cin ||
                      route_pmul  &&  1'b0         ;

assign padd_cen =     route_mul   &&  mul_padd_cen ||
                      route_pmul  &&  pmul_padd_cen;

assign result   =                    pmul_result   |
                  {64{route_mul }} &  mul_result   |
                  {64{route_div }} & divrem_result ;

assign ready    =     route_pmul  && pmul_ready    ||
                      route_mul   &&  mul_ready    ||
                      route_div   &&  div_ready    ;

//
// Submodule instances.
// -----------------------------------------------------------------

//
// Handles instructions:
//  - mul
//  - mulh
//  - mulhu
//  - mulhsu
//  - clmul
//  - clmulh
//
xc_malu_mul i_xc_malu_mul (
.rs1        (rs1            ),
.rs2        (rs2            ),
.count      (count          ),
.acc        (acc            ),
.arg_0      (arg_0          ),
.carryless  (mul_carryless  ),
.pw_32      (pw_32          ), // 32-bit width packed elements.
.pw_16      (pw_16          ), // 16-bit width packed elements.
.pw_8       (pw_8           ), //  8-bit width packed elements.
.pw_4       (pw_4           ), //  4-bit width packed elements.
.pw_2       (pw_2           ), //  2-bit width packed elements.
.lhs_sign   (mul_lhs_sign   ),
.rhs_sign   (mul_rhs_sign   ),
.padd_lhs   (mul_padd_lhs   ), // Packed adder left input
.padd_rhs   (mul_padd_rhs   ), // Packed adder right input
.padd_sub   (mul_padd_sub   ), // Packed adder subtract?
.padd_cin   (mul_padd_cin   ), // Packed adder carry in
.padd_cen   (mul_padd_cen   ), // Packed adder carry enable.
.padd_cout  (padd_cout      ), // Packed adder carry out
.padd_result(padd_result    ), // Packed adder result.
.n_acc      (mul_n_acc      ),
.n_arg_0    (mul_n_arg_0    ),
.ready      (mul_ready      )
);

//
// Handles instructions:
//  - div
//  - divu
//  - rem
//  - remu
//
xc_malu_divrem i_xc_malu_divrem (
.clock      (clock       ),
.resetn     (resetn      ),
.rs1        (rs1         ),
.rs2        (rs2         ),
.valid      (valid       ),
.op_signed  (div_signed  ),
.flush      (flush       ),
.count      (count       ),
.acc        (acc         ), // Divisor
.arg_0      (arg_0       ), // Dividend
.arg_1      (arg_1       ), // Quotient
.n_acc      (div_n_acc   ),
.n_arg_0    (div_n_arg_0 ),
.n_arg_1    (div_n_arg_1 ),
.ready      (div_ready   )
);

//
// Handles instructions:
//  - pmul
//  - pmulh
//
xc_malu_pmul i_malu_pmul(
.rs1        (rs1            ),
.rs2        (rs2            ),
.count      (count          ),
.acc        (acc            ),
.arg_0      (arg_0          ),
.carryless  (mul_carryless  ),
.pw_16      (pw_16          ), // 16-bit width packed elements.
.pw_8       (pw_8           ), //  8-bit width packed elements.
.pw_4       (pw_4           ), //  4-bit width packed elements.
.pw_2       (pw_2           ), //  2-bit width packed elements.
.padd_lhs   (pmul_padd_lhs  ), // Left hand input
.padd_rhs   (pmul_padd_rhs  ), // Right hand input.
.padd_sub   (pmul_padd_sub  ), // Subtract if set, else add.
.padd_cen   (pmul_padd_cen  ), // Packed adder carry enable.
.padd_cout  (padd_cout      ), // Carry bits
.padd_result(padd_result    ), // Result of the operation
.n_acc      (pmul_n_acc     ),
.n_arg_0    (pmul_n_arg_0   ),
.result     (pmul_result    ),
.ready      (pmul_ready     ) 
);

endmodule

