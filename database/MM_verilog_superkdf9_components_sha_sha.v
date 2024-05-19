// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`define DEF_SHA256_H0 32'h6a09e667
`define DEF_SHA256_H1 32'hbb67ae85
`define DEF_SHA256_H2 32'h3c6ef372
`define DEF_SHA256_H3 32'ha54ff53a
`define DEF_SHA256_H4 32'h510e527f
`define DEF_SHA256_H5 32'h9b05688c
`define DEF_SHA256_H6 32'h1f83d9ab
`define DEF_SHA256_H7 32'h5be0cd19

module sha(
    // system clock and reset
    input CLK_I,
    input RST_I,
    
    // wishbone interface signals
    input SHA_CYC_I,//NC
    input SHA_STB_I,
    input SHA_WE_I,
    input SHA_LOCK_I,//NC
    input [2:0] SHA_CTI_I,//NC
    input [1:0] SHA_BTE_I,//NC
    input [4:0] SHA_ADR_I,
    input [31:0]  SHA_DAT_I,
    input [3:0]   SHA_SEL_I,
    output reg    SHA_ACK_O,
    output        SHA_ERR_O,//const 0
    output        SHA_RTY_O,//const 0
    output [31:0] SHA_DAT_O 
);
assign SHA_ERR_O = 1'b0 ;
assign SHA_RTY_O = 1'b0 ;

//-----------------------------------------------------
// WB bus ACK
//-----------------------------------------------------
always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I )
		SHA_ACK_O <= 1'b0 ;
	else if( SHA_STB_I && (~SHA_ACK_O) )
		SHA_ACK_O <= 1'b1 ;
	else 
		SHA_ACK_O <= 1'b0 ;
end

wire sha_cmd_wr_en = SHA_STB_I & SHA_WE_I & ( SHA_ADR_I == 5'h0) & ~SHA_ACK_O ;
wire sha_din_wr_en = SHA_STB_I & SHA_WE_I & ( SHA_ADR_I == 5'h4) & ~SHA_ACK_O ;
wire sha_hi_wr_en  = SHA_STB_I & SHA_WE_I & ( SHA_ADR_I == 5'hc) & ~SHA_ACK_O ;

wire sha_cmd_rd_en  = SHA_STB_I & ~SHA_WE_I & ( SHA_ADR_I == 5'h0 ) & ~SHA_ACK_O ;
wire sha_hash_rd_en = SHA_STB_I & ~SHA_WE_I & ( SHA_ADR_I == 5'h8 ) & ~SHA_ACK_O ;
wire sha_pre_rd_en  = SHA_STB_I & ~SHA_WE_I & ( SHA_ADR_I == 5'h10) & ~SHA_ACK_O ;
//-----------------------------------------------------
// REG SHA_CMD
//-----------------------------------------------------
reg reg_init ;
reg reg_done ;
reg reg_rst ;
reg reg_dbl ;
wire done ;
always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I )
		reg_init <= 1'b0 ;
	else if( sha_cmd_wr_en )
		reg_init <= SHA_DAT_I[0]||SHA_DAT_I[3] ;
	else
		reg_init <= 1'b0 ;
end

always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I )
		reg_done <= 1'b0 ;
	else if( done )
		reg_done <= 1'b1 ;
	else if( sha_din_wr_en || (sha_cmd_wr_en && SHA_DAT_I[3]))
		reg_done <= 1'b0 ;
end

always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I )
		reg_rst <= 1'b0 ;
	else if( sha_cmd_wr_en )
		reg_rst <= SHA_DAT_I[2] ;
	else
		reg_rst <= 1'b0 ;
end

always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I )
		reg_dbl <= 1'b0 ;
	else if( sha_cmd_wr_en )
		reg_dbl <= SHA_DAT_I[3] ;
	else
		reg_dbl <= 1'b0 ;
end


//-----------------------------------------------------
// REG SHA_DIN
//-----------------------------------------------------
reg [31:0] reg_din ;
reg vld ;
always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I ) begin
		reg_din <= 32'b0 ;
		vld <= 1'b0 ;
	end else if( sha_din_wr_en ) begin
		reg_din <= SHA_DAT_I[31:0] ;
		vld <= 1'b1 ;
	end else
		vld <= 1'b0 ;
end


//-----------------------------------------------------
// REG SHA_HASH
//-----------------------------------------------------
reg [2:0] hash_cnt ;
reg [31:0] reg_hash ;
wire [255:0] hash ;
reg sha_hash_rd_en_r ;
always @ ( posedge CLK_I )
	sha_hash_rd_en_r <= sha_hash_rd_en ;

always @ ( * ) begin
	case( hash_cnt )
	3'd0: reg_hash = hash[32*8-1:32*7] ;
	3'd1: reg_hash = hash[32*7-1:32*6] ;
	3'd2: reg_hash = hash[32*6-1:32*5] ;
	3'd3: reg_hash = hash[32*5-1:32*4] ;
	3'd4: reg_hash = hash[32*4-1:32*3] ;
	3'd5: reg_hash = hash[32*3-1:32*2] ;
	3'd6: reg_hash = hash[32*2-1:32*1] ;
	3'd7: reg_hash = hash[32*1-1:32*0] ;
	endcase
end

always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I | reg_init )
		hash_cnt <= 3'b0 ;
	else if( sha_hash_rd_en_r )
		hash_cnt <= hash_cnt + 3'b1 ;
end

//-----------------------------------------------------
// REG SHA_HI
//-----------------------------------------------------
reg [8*32-1:0] SHA256_Hx ;
always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I | reg_rst ) begin
		SHA256_Hx[8*32-1:7*32] <= `DEF_SHA256_H0 ;
		SHA256_Hx[7*32-1:6*32] <= `DEF_SHA256_H1 ;
		SHA256_Hx[6*32-1:5*32] <= `DEF_SHA256_H2 ;
		SHA256_Hx[5*32-1:4*32] <= `DEF_SHA256_H3 ;
		SHA256_Hx[4*32-1:3*32] <= `DEF_SHA256_H4 ;
		SHA256_Hx[3*32-1:2*32] <= `DEF_SHA256_H5 ;
		SHA256_Hx[2*32-1:1*32] <= `DEF_SHA256_H6 ;
		SHA256_Hx[1*32-1:0*32] <= `DEF_SHA256_H7 ;
	end else if( sha_hi_wr_en )
		SHA256_Hx <= {SHA256_Hx[7*32-1:0],SHA_DAT_I[31:0]} ;
end

//-----------------------------------------------------
// REG SHA_PRE
//-----------------------------------------------------
wire [32*6-1:0] PRE ;
reg [2:0] pre_cnt ;
reg [31:0] reg_pre ;
reg sha_pre_rd_en_r ;
always @ ( posedge CLK_I )
	sha_pre_rd_en_r <= sha_pre_rd_en ;

always @ ( * ) begin
	case( pre_cnt )
	3'd0: reg_pre = PRE[32*1-1:32*0] ;
	3'd1: reg_pre = PRE[32*2-1:32*1] ;
	3'd2: reg_pre = PRE[32*3-1:32*2] ;
	3'd3: reg_pre = PRE[32*4-1:32*3] ;
	3'd4: reg_pre = PRE[32*5-1:32*4] ;
	3'd5: reg_pre = PRE[32*6-1:32*5] ;
	default: reg_pre = 32'b0 ;
	endcase
end

always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I | reg_init )
		pre_cnt <= 3'b0 ;
	else if( sha_pre_rd_en_r )
		pre_cnt <= pre_cnt + 3'b1 ;
end

//-----------------------------------------------------
// Bus output
//-----------------------------------------------------
reg sha_cmd_rd_en_f ;
reg sha_hash_rd_en_f ;
always @ ( posedge CLK_I or posedge RST_I ) begin
	if( RST_I ) begin
		sha_cmd_rd_en_f <= 1'b0 ;
		sha_hash_rd_en_f <= 1'b0 ;
	end else begin
		sha_cmd_rd_en_f <= sha_cmd_rd_en ;
		sha_hash_rd_en_f <= sha_hash_rd_en ;
	end
end

assign SHA_DAT_O = sha_cmd_rd_en_f  ? {30'h0,reg_done,1'b0} : 
                   sha_hash_rd_en_f ? reg_hash : reg_pre ; 

//-----------------------------------------------------
// Double SHA
//-----------------------------------------------------
wire dbl_vld ;
wire [31:0] dbl_din ;
dbl_sha U_dbl_sha(
/*input        */ .clk     (CLK_I  ) ,
/*input        */ .rst     (RST_I  ) ,

/*input        */ .reg_dbl (reg_dbl) ,
/*input        */ .done    (done   ) ,
/*input [255:0]*/ .hash    (hash   ) ,

/*output       */ .dbl_vld (dbl_vld) ,
/*output[31:0] */ .dbl_din (dbl_din)  
);


sha_core U_sha_core(
/*input         */ .clk       (CLK_I                 ) , 
/*input         */ .rst       (RST_I                 ) ,
/*input  [31:0] */ .SHA256_H0 (SHA256_Hx[32*8-1:32*7]) ,
/*input  [31:0] */ .SHA256_H1 (SHA256_Hx[32*7-1:32*6]) ,
/*input  [31:0] */ .SHA256_H2 (SHA256_Hx[32*6-1:32*5]) ,
/*input  [31:0] */ .SHA256_H3 (SHA256_Hx[32*5-1:32*4]) ,
/*input  [31:0] */ .SHA256_H4 (SHA256_Hx[32*4-1:32*3]) ,
/*input  [31:0] */ .SHA256_H5 (SHA256_Hx[32*3-1:32*2]) ,
/*input  [31:0] */ .SHA256_H6 (SHA256_Hx[32*2-1:32*1]) ,
/*input  [31:0] */ .SHA256_H7 (SHA256_Hx[32*1-1:32*0]) ,

/*output [31:0] */ .A0        (PRE[32*1-1:32*0]      ) ,
/*output [31:0] */ .A1        (PRE[32*2-1:32*1]      ) ,
/*output [31:0] */ .A2        (PRE[32*3-1:32*2]      ) ,
/*output [31:0] */ .E0        (PRE[32*4-1:32*3]      ) ,
/*output [31:0] */ .E1        (PRE[32*5-1:32*4]      ) ,
/*output [31:0] */ .E2        (PRE[32*6-1:32*5]      ) ,
      
/*input         */ .init      (reg_init              ) ,//sha core initial
/*input         */ .vld       (vld|dbl_vld           ) ,//data input valid
/*input  [31:0] */ .din       (dbl_vld?dbl_din: reg_din    ) ,

/*output        */ .done      (done                  ) ,
/*output [255:0]*/ .hash      (hash                  ) 
) ;
endmodule 
