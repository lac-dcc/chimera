
//
// module: xc_malu
//
//  Implements a multi-cycle arithmetic logic unit for some of
//  the bigger / more complex instructions in XCrypto.
//
//  Instructions handled:
//  - div, divu, rem, remu
//  - mul, mulh, mulhu, mulhsu
//  - pmul.l, pmul.h
//  - clmul, clmulr, clmulh
//  - madd, msub, macc, mmul
//
module xc_malu (

input  wire         clock           ,
input  wire         resetn          ,

input  wire [31:0]  rs1             , //
input  wire [31:0]  rs2             , //
input  wire [31:0]  rs3             , //

input  wire         flush           , // Flush state / pipeline progress
input  wire [31:0]  flush_data      , // Random / zeros data to flush into state.
input  wire         valid           , // Inputs valid.

input  wire         uop_div         , //
input  wire         uop_divu        , //
input  wire         uop_rem         , //
input  wire         uop_remu        , //
input  wire         uop_mul         , //
input  wire         uop_mulu        , //
input  wire         uop_mulsu       , //
input  wire         uop_clmul       , //
input  wire         uop_pmul        , //
input  wire         uop_pclmul      , //
input  wire         uop_madd        , //
input  wire         uop_msub        , //
input  wire         uop_macc        , //
input  wire         uop_mmul        , //

input  wire         pw_32           , // 32-bit width packed elements.
input  wire         pw_16           , // 16-bit width packed elements.
input  wire         pw_8            , //  8-bit width packed elements.
input  wire         pw_4            , //  4-bit width packed elements.
input  wire         pw_2            , //  2-bit width packed elements.

output wire [63:0]  result          , // 64-bit result
output wire         ready             // Outputs ready.

);

wire fsm_init;
wire fsm_mdr;
wire fsm_msub_1;
wire fsm_macc_1;
wire fsm_mmul_1;
wire fsm_mmul_2;
wire fsm_mmul_3;
wire fsm_done;

wire ld_mdr;
wire ld_long;

//
// Submodule interface wires
// -----------------------------------------------------------------

wire         insn_divrem     =
    uop_div    || uop_divu   || uop_rem    || uop_remu    ;

wire         insn_mdr        =
    insn_divrem   ||
    uop_mul    || uop_mulu   || uop_mulsu  || uop_clmul  ||
    uop_pmul   || uop_pclmul ; 

wire         insn_long       =
    uop_madd   || uop_msub   || uop_macc   || uop_mmul    ;

wire         do_div          = uop_div   ; //
wire         do_divu         = uop_divu  ; //
wire         do_rem          = uop_rem   ; //
wire         do_remu         = uop_remu  ; //
wire         do_mul          = uop_mul   ; //
wire         do_mulu         = uop_mulu  || (uop_mmul && fsm_init || fsm_mmul_1);
wire         do_mulsu        = uop_mulsu ; //
wire         do_clmul        = uop_clmul ; //
wire         do_pmul         = uop_pmul  ; //
wire         do_pclmul       = uop_pclmul; //

wire [63:0]  mdr_n_acc       ; // Next accumulator value
wire [31:0]  mdr_n_arg_0     ; // Next arg 0 value
wire [31:0]  mdr_n_arg_1     ; // Next arg 1 value
wire [31:0]  mdr_padd_lhs    ; // Packed adder left input
wire [31:0]  mdr_padd_rhs    ; // Packed adder right input
wire         mdr_padd_sub    ; // Packed adder subtract?
wire         mdr_padd_cin    ; // Packed adder carry in
wire         mdr_padd_cen    ; // Packed adder carry enable.
wire [63:0]  mdr_result      ; // 64-bit result
wire         mdr_ready       ; // Outputs ready.

wire [31:0]  long_padd_lhs     ; // Left hand input
wire [31:0]  long_padd_rhs     ; // Right hand input.
wire         long_padd_cin     ; // Carry in bit.
wire [ 0:0]  long_padd_sub     ; // Subtract if set, else add.
wire         long_n_carry      ;
wire [63:0]  long_n_acc        ;
wire [63:0]  long_result       ;
wire         long_ready        ;

//
// Result Multiplexing
// -----------------------------------------------------------------

assign       result  =                    mdr_result |
                                         long_result ;

//
// Packed Adder Interface
// -----------------------------------------------------------------

wire [31:0] padd_lhs =                    mdr_padd_lhs |
                       {32{ld_long  }} & long_padd_lhs ;
                       
wire [31:0] padd_rhs =                    mdr_padd_rhs |
                       {32{ld_long  }} & long_padd_rhs ;
                       
wire        padd_sub =                    mdr_padd_sub ||
                           ld_long    && long_padd_sub ;
                       
wire        padd_cin =                    mdr_padd_cin ||
                           ld_long    && long_padd_cin ;
                      
wire        padd_cen =                    mdr_padd_cen ||
                           ld_long    &&          1'b1 ;

wire [ 4:0] padd_pw  = {pw_2, pw_4, pw_8, pw_16, pw_32};

wire [32:0] padd_cout   ;
wire [31:0] padd_result ;

//
// Control FSM
// -----------------------------------------------------------------

reg [7:0] fsm;
reg [7:0] n_fsm;

localparam FSM_INIT     = 8'b00000001;
localparam FSM_MDR      = 8'b00000010;
localparam FSM_MSUB_1   = 8'b00000100;
localparam FSM_MACC_1   = 8'b00001000;
localparam FSM_MMUL_1   = 8'b00010000;
localparam FSM_MMUL_2   = 8'b00100000;
localparam FSM_MMUL_3   = 8'b01000000;
localparam FSM_DONE     = 8'b10000000;

assign fsm_init   = fsm[0];
assign fsm_mdr    = fsm[1];
assign fsm_msub_1 = fsm[2];
assign fsm_macc_1 = fsm[3];
assign fsm_mmul_1 = fsm[4];
assign fsm_mmul_2 = fsm[5];
assign fsm_mmul_3 = fsm[6];
assign fsm_done   = fsm[7];

always @(*) begin 
    
    n_fsm = FSM_INIT;

case(fsm)

    FSM_INIT: begin
        if(valid) begin
            if     (insn_mdr && !uop_mmul) n_fsm = FSM_MDR   ;
            else if(uop_msub             ) n_fsm = FSM_MSUB_1;
            else if(uop_macc             ) n_fsm = FSM_MACC_1;
            else if(uop_mmul             ) n_fsm = FSM_MMUL_1;
        end else begin
            n_fsm = FSM_INIT  ;
        end
    end
    
    FSM_MDR  : begin
        if(mdr_ready) n_fsm = FSM_DONE ;
        else          n_fsm = FSM_MDR  ;
    end
    
    FSM_MSUB_1: begin
        n_fsm = FSM_DONE;
    end
    
    FSM_MACC_1: begin
        n_fsm = FSM_DONE;
    end
    
    FSM_MMUL_1: begin
        if(mdr_ready) n_fsm = FSM_MMUL_2;
        else          n_fsm = FSM_MMUL_1;
    end
    
    FSM_MMUL_2: begin
        n_fsm = FSM_MMUL_3;
    end
    
    FSM_MMUL_3: begin
        n_fsm = FSM_DONE;
    end
    
    FSM_DONE  : begin
        // Stay in this state until flush is assertd.
        n_fsm = FSM_DONE;
    end

    default: n_fsm = FSM_INIT;

endcase end

always @(posedge clock) begin
    if(!resetn || flush) begin
        fsm <= FSM_INIT;
    end else begin
        fsm <= n_fsm;
    end
end

//
// Register State
// -----------------------------------------------------------------

reg  [ 5:0] count    ;   // State / step counter.
wire [ 5:0] n_count  = count + 1;
wire        count_en = fsm_mdr || (fsm_init && uop_mmul && valid);

reg  [63:0] acc         ; // Accumulator

// Route outputs of MDR instruction into registers. Can happen even if
// there isn't an MDR instruction executing, as in the case of xc.mmul.
assign ld_mdr   = insn_mdr  ||  ((fsm_init||fsm_mmul_1) && uop_mmul);
assign ld_long  = insn_long && !((fsm_init||fsm_mmul_1) && uop_mmul);

wire [63:0] n_acc    = {64{ld_mdr   }} &  mdr_n_acc  |
                       {64{ld_long  }} & long_n_acc  ;
                     
reg  [31:0] arg_0       ; // Misc intermediate variable

wire [31:0] n_arg_0  = {32{ld_mdr   }} &  mdr_n_arg_0;
                     
reg  [31:0] arg_1       ; // Misc intermediate variable. Div/Rem Quotient.

wire [31:0] n_arg_1  =                    mdr_n_arg_1;

reg         carry       ;
wire        n_carry  = insn_long && long_n_carry     ;

wire        ld_on_init = insn_divrem || (insn_long && !uop_mmul);

wire        reg_ld_en  = count_en               ||
                         insn_long              ;

always @(posedge clock) begin
    if(!resetn || flush) begin
        count <= 0;
        acc   <= {flush_data, flush_data};
        arg_0 <= flush_data;
        arg_1 <= flush_data;
        carry <= 0;
    end else if(fsm_init && valid) begin
        acc   <= ld_on_init ? n_acc  : 0     ;
        arg_0 <= ld_on_init ? n_arg_0 : rs2   ;
        arg_1 <= n_arg_1;
        carry <= n_carry;
        if(count_en) begin
            count <= n_count;
        end
    end else if(reg_ld_en && !ready && !fsm_done && valid) begin
        count <= n_count;
        acc   <= n_acc  ;
        arg_0 <= n_arg_0 ;
        arg_1 <= n_arg_1 ;
        carry <= n_carry;
    end
end

//
// Are we finished yet?
// -----------------------------------------------------------------

assign ready = insn_mdr     && mdr_ready    ||
               insn_long    && long_ready   ||
               fsm_done                     ;

//
// Submodule instances.
// -----------------------------------------------------------------

//
// instance : p_addsub
//
//  Packed addition/subtraction for 32-bit 2s complement values.
//
p_addsub i_p_addsub(
.lhs     (padd_lhs   ), // Left hand input
.rhs     (padd_rhs   ), // Right hand input.
.pw      (padd_pw    ), // Pack width to operate on
.cin     (padd_cin   ), // Carry in bit.
.sub     (padd_sub   ), // Subtract if set, else add.
.c_en    (padd_cen   ), // Carry enable bits.
.c_out   (padd_cout  ), // Carry bits
.result  (padd_result)  // Result of the operation
);

xc_malu_muldivrem i_malu_muldivrem (
.clock      (clock          ),
.resetn     (resetn         ),
.rs1        (rs1            ), //
.rs2        (rs2            ), //
.rs3        (rs3            ), //
.flush      (flush          ), // Flush state / pipeline progress
.valid      (valid          ), // Inputs valid.
.do_div     (do_div         ), //
.do_divu    (do_divu        ), //
.do_rem     (do_rem         ), //
.do_remu    (do_remu        ), //
.do_mul     (do_mul         ), //
.do_mulu    (do_mulu        ), //
.do_mulsu   (do_mulsu       ), //
.do_clmul   (do_clmul       ), //
.do_pmul    (do_pmul        ), //
.do_pclmul  (do_pclmul      ), //
.pw_32      (pw_32          ), // 32-bit width packed elements.
.pw_16      (pw_16          ), // 16-bit width packed elements.
.pw_8       (pw_8           ), //  8-bit width packed elements.
.pw_4       (pw_4           ), //  4-bit width packed elements.
.pw_2       (pw_2           ), //  2-bit width packed elements.
.count      (count          ), // Current count value
.acc        (acc            ), // Current accumulator value
.arg_0      (arg_0          ), // Current arg 0 value
.arg_1      (arg_1          ), // Current arg 1 value
.n_acc      (mdr_n_acc      ), // Next accumulator value
.n_arg_0    (mdr_n_arg_0    ), // Next arg 0 value
.n_arg_1    (mdr_n_arg_1    ), // Next arg 1 value
.padd_lhs   (mdr_padd_lhs   ), // Packed adder left input
.padd_rhs   (mdr_padd_rhs   ), // Packed adder right input
.padd_sub   (mdr_padd_sub   ), // Packed adder subtract?
.padd_cin   (mdr_padd_cin   ), // Packed adder carry in
.padd_cen   (mdr_padd_cen   ), // Packed adder carry enable.
.padd_cout  (padd_cout      ),
.padd_result(padd_result    ),
.result     (mdr_result     ), // 64-bit result
.ready      (mdr_ready      )  // Outputs ready.
);

xc_malu_long i_xc_malu_long (
.rs1            (rs1                ), //
.rs2            (rs2                ), //
.rs3            (rs3                ), //
.fsm_init       (fsm_init           ),
.fsm_mdr        (fsm_mdr            ),
.fsm_msub_1     (fsm_msub_1         ),
.fsm_macc_1     (fsm_macc_1         ),
.fsm_mmul_1     (fsm_mmul_1         ),
.fsm_mmul_2     (fsm_mmul_2         ),
.fsm_done       (fsm_done           ),
.acc            (acc                ),
.carry          (carry              ),
.count          (count              ),
.padd_lhs       (long_padd_lhs      ), // Left hand input
.padd_rhs       (long_padd_rhs      ), // Right hand input.
.padd_cin       (long_padd_cin      ), // Carry in bit.
.padd_sub       (long_padd_sub      ), // Subtract if set, else add.
.padd_cout      (padd_cout          ), // Carry bits
.padd_result    (padd_result        ), // Result of the operation
.uop_madd       (uop_madd           ), //
.uop_msub       (uop_msub           ), //
.uop_macc       (uop_macc           ), //
.uop_mmul       (uop_mmul           ), //
.n_carry        (long_n_carry       ),
.n_acc          (long_n_acc         ),
.result         (long_result        ),
.ready          (long_ready         )
);

endmodule

