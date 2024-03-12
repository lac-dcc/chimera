
//
// module: xc_rf_fwd_3
//
//  A 3-read-1-write register file with double-width writeback to
//  adjacent registersand two "forwarded" value stages.
//
module xc_rf_fwd_3 (

input  wire        clock        ,
input  wire        resetn       ,
           
input  wire [ 4:0] rs1_addr     ,
output wire [31:0] rs1_rdata    ,
           
input  wire [ 4:0] rs2_addr     ,
output wire [31:0] rs2_rdata    ,
           
input  wire [ 4:0] rs3_addr     ,
output wire [31:0] rs3_rdata    ,

input  wire        fwd_0_wen    ,
input  wire        fwd_0_wide   ,
input  wire [ 4:0] fwd_0_addr   ,
input  wire [31:0] fwd_0_wdata  ,
input  wire [31:0] fwd_0_wdata_hi,

input  wire        fwd_1_wen    ,
input  wire        fwd_1_wide   ,
input  wire [ 4:0] fwd_1_addr   ,
input  wire [31:0] fwd_1_wdata  , 
input  wire [31:0] fwd_1_wdata_hi,
           
input  wire        rd_wen       ,
input  wire        rd_wide      ,
input  wire [ 4:0] rd_addr      ,
input  wire [31:0] rd_wdata     ,
input  wire [31:0] rd_wdata_hi   

);

wire [31:0] gpr_rs1_rdata  ;
wire [31:0] gpr_rs2_rdata  ;
wire [31:0] gpr_rs3_rdata  ;

wire [31:0] fwd_0_d = fwd_0_wide && fwd_0_addr[0] ? fwd_0_wdata_hi : fwd_0_wdata;
wire [31:0] fwd_1_d = fwd_1_wide && fwd_1_addr[0] ? fwd_1_wdata_hi : fwd_1_wdata;
wire [31:0] fwd_gpr = rd_wide    && rd_addr   [0] ? rd_wdata_hi    : rd_wdata   ;

wire    fwd_rs1_0 = rs1_addr[4:1] == fwd_0_addr[4:1] && |rs1_addr;
wire    fwd_rs2_0 = rs2_addr[4:1] == fwd_0_addr[4:1] && |rs2_addr;
wire    fwd_rs3_0 = rs3_addr[4:1] == fwd_0_addr[4:1] && |rs3_addr;

wire    fwd_rs1_1 = rs1_addr[4:1] == fwd_1_addr[4:1] && |rs1_addr;
wire    fwd_rs2_1 = rs2_addr[4:1] == fwd_1_addr[4:1] && |rs2_addr;
wire    fwd_rs3_1 = rs3_addr[4:1] == fwd_1_addr[4:1] && |rs3_addr;

wire    fwd_rs1_g = rs1_addr == rd_addr    && |rs1_addr;
wire    fwd_rs2_g = rs2_addr == rd_addr    && |rs2_addr;
wire    fwd_rs3_g = rs3_addr == rd_addr    && |rs3_addr;

assign rs1_rdata = fwd_rs1_0 ? fwd_0_d          :
                   fwd_rs1_1 ? fwd_1_d          :
                   fwd_rs1_g ? fwd_gpr          :
                               gpr_rs1_rdata    ;


assign rs2_rdata = fwd_rs2_0 ? fwd_0_d          :
                   fwd_rs2_1 ? fwd_1_d          :
                   fwd_rs2_g ? fwd_gpr          :
                               gpr_rs2_rdata    ;

assign rs3_rdata = fwd_rs3_0 ? fwd_0_d          :
                   fwd_rs3_1 ? fwd_1_d          :
                   fwd_rs3_g ? fwd_gpr          :
                               gpr_rs3_rdata    ;

xc_rf_3 i_xc_rf_3(
.clock      (clock          ),
.resetn     (resetn         ),
.rs1_addr   (rs1_addr       ),
.rs1_rdata  (gpr_rs1_rdata  ),
.rs2_addr   (rs2_addr       ),
.rs2_rdata  (gpr_rs2_rdata  ),
.rs3_addr   (rs3_addr       ),
.rs3_rdata  (gpr_rs3_rdata  ),
.rd_wen     (rd_wen         ),
.rd_wide    (rd_wide        ),
.rd_addr    (rd_addr        ),
.rd_wdata   (rd_wdata       ),
.rd_wdata_hi(rd_wdata_hi    )
);

endmodule



