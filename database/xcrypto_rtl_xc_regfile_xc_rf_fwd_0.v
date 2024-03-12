
//
// module: xc_rf_fwd_0
//
//  The most basic 2-read-1-write register file with two "forwarded"
//  value stages.
//
module xc_rf_fwd_0 (

input  wire        clock      ,
input  wire        resetn     ,
           
input  wire [ 4:0] rs1_addr   ,
output wire [31:0] rs1_rdata  ,
           
input  wire [ 4:0] rs2_addr   ,
output wire [31:0] rs2_rdata  ,

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

wire    fwd_rs1_0 = rs1_addr == fwd_0_addr && |rs1_addr;
wire    fwd_rs2_0 = rs2_addr == fwd_0_addr && |rs2_addr;

wire    fwd_rs1_1 = rs1_addr == fwd_1_addr && |rs1_addr;
wire    fwd_rs2_1 = rs2_addr == fwd_1_addr && |rs2_addr;

wire    fwd_rs1_g = rs1_addr == rd_addr    && |rs1_addr;
wire    fwd_rs2_g = rs2_addr == rd_addr    && |rs2_addr;

assign rs1_rdata = fwd_rs1_0 ? fwd_0_wdata      :
                   fwd_rs1_1 ? fwd_1_wdata      :
                   fwd_rs1_g ? rd_wdata         :
                               gpr_rs1_rdata    ;


assign rs2_rdata = fwd_rs2_0 ? fwd_0_wdata      :
                   fwd_rs2_1 ? fwd_1_wdata      :
                   fwd_rs2_g ? rd_wdata         :
                               gpr_rs2_rdata    ;

xc_rf_0 i_xc_rf_0(
.clock      (clock          ),
.resetn     (resetn         ),
.rs1_addr   (rs1_addr       ),
.rs1_rdata  (gpr_rs1_rdata  ),
.rs2_addr   (rs2_addr       ),
.rs2_rdata  (gpr_rs2_rdata  ),
.rd_wen     (rd_wen         ),
.rd_addr    (rd_addr        ),
.rd_wdata   (rd_wdata       ) 
);

endmodule
