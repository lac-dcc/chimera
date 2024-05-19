// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


//
// module: xc_rf_fwd_1
//
//  A 3-read-1-write register file  with two "forwarded"
//  value stages.
//
module xc_rf_fwd_1 (

input  wire        clock      ,
input  wire        resetn     ,
           
input  wire [ 4:0] rs1_addr   ,
output wire [31:0] rs1_rdata  ,
           
input  wire [ 4:0] rs2_addr   ,
output wire [31:0] rs2_rdata  ,
           
input  wire [ 4:0] rs3_addr   ,
output wire [31:0] rs3_rdata  ,

input  wire        fwd_0_wen  ,
input  wire [ 4:0] fwd_0_addr ,
input  wire [31:0] fwd_0_wdata,

input  wire        fwd_1_wen  ,
input  wire [ 4:0] fwd_1_addr ,
input  wire [31:0] fwd_1_wdata, 
           
input  wire        rd_wen     ,
input  wire [ 4:0] rd_addr    ,
input  wire [31:0] rd_wdata    

);

wire [31:0] gpr_rs1_rdata  ;
wire [31:0] gpr_rs2_rdata  ;
wire [31:0] gpr_rs3_rdata  ;

wire    fwd_rs1_0 = rs1_addr == fwd_0_addr && |rs1_addr;
wire    fwd_rs2_0 = rs2_addr == fwd_0_addr && |rs2_addr;
wire    fwd_rs3_0 = rs3_addr == fwd_0_addr && |rs3_addr;

wire    fwd_rs1_1 = rs1_addr == fwd_1_addr && |rs1_addr;
wire    fwd_rs2_1 = rs2_addr == fwd_1_addr && |rs2_addr;
wire    fwd_rs3_1 = rs3_addr == fwd_1_addr && |rs3_addr;

wire    fwd_rs1_g = rs1_addr == rd_addr    && |rs1_addr;
wire    fwd_rs2_g = rs2_addr == rd_addr    && |rs2_addr;
wire    fwd_rs3_g = rs3_addr == rd_addr    && |rs3_addr;

assign rs1_rdata = fwd_rs1_0 ? fwd_0_wdata      :
                   fwd_rs1_1 ? fwd_1_wdata      :
                   fwd_rs1_g ? rd_wdata         :
                               gpr_rs1_rdata    ;


assign rs2_rdata = fwd_rs2_0 ? fwd_0_wdata      :
                   fwd_rs2_1 ? fwd_1_wdata      :
                   fwd_rs2_g ? rd_wdata         :
                               gpr_rs2_rdata    ;

assign rs3_rdata = fwd_rs3_0 ? fwd_0_wdata      :
                   fwd_rs3_1 ? fwd_1_wdata      :
                   fwd_rs3_g ? rd_wdata         :
                               gpr_rs3_rdata    ;

xc_rf_1 i_xc_rf_1(
.clock      (clock          ),
.resetn     (resetn         ),
.rs1_addr   (rs1_addr       ),
.rs1_rdata  (gpr_rs1_rdata  ),
.rs2_addr   (rs2_addr       ),
.rs2_rdata  (gpr_rs2_rdata  ),
.rs3_addr   (rs3_addr       ),
.rs3_rdata  (gpr_rs3_rdata  ),
.rd_wen     (rd_wen         ),
.rd_addr    (rd_addr        ),
.rd_wdata   (rd_wdata       ) 
);

endmodule

