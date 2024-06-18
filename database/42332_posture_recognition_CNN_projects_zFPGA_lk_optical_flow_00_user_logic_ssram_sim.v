// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

module ssram_sim
(
	// SRAM
	input	[27:0]	SRAM_ADDR,
	inout   [8:0]   SRAM_DA,SRAM_DB,SRAM_DC,SRAM_DD,
	//		SRAM CONTROL SIGNAL
    input	        SRAM_MODE,
    input	        SRAM_CEn,SRAM_CE2,SRAM_CE2n,
    input           SRAM_BWan,SRAM_BWbn,SRAM_BWcn,SRAM_BWdn,
    input           SRAM_WEn,SRAM_OEn,
    //		SRAM CLK SIGNAL
    input           SRAM_CLK,SRAM_CLKEn,
    input           SRAM_ZZ,SRAM_ADV
);

	reg		[8:0]	ram_da	[0:268435455];
	reg		[8:0]	ram_db	[0:268435455];
	reg		[8:0]	ram_dc	[0:268435455];
	reg		[8:0]	ram_dd	[0:268435455];
	
	// 首先，延迟两个周期进行数据写入
	reg		[27:0]	SRAM_ADDR_reg 	[0:1];
	reg		[27:0]	SRAM_ADDR_regn;
	reg				SRAM_WEn_reg	[0:1];
	reg				SRAM_WEn_regn;
	reg				SRAM_OEn_reg	[0:1];
	reg				SRAM_BWan_reg	[0:1];
	reg				SRAM_BWbn_reg	[0:1];
	reg				SRAM_BWcn_reg	[0:1];
	reg				SRAM_BWdn_reg	[0:1];
	always @(posedge SRAM_CLK)
	begin
		SRAM_ADDR_reg[1] <= SRAM_ADDR_reg[0];
		SRAM_WEn_reg[1] <= SRAM_WEn_reg[0];
		SRAM_OEn_reg[1] <= SRAM_OEn_reg[0];
		SRAM_BWan_reg[1] <= SRAM_BWan_reg[0];
		SRAM_BWbn_reg[1] <= SRAM_BWbn_reg[0];
		SRAM_BWcn_reg[1] <= SRAM_BWcn_reg[0];
		SRAM_BWdn_reg[1] <= SRAM_BWdn_reg[0];
		
		SRAM_ADDR_reg[0] <= SRAM_ADDR;
		SRAM_WEn_reg[0] <= SRAM_WEn;
		SRAM_OEn_reg[0] <= SRAM_OEn;
		SRAM_BWan_reg[0] <= SRAM_BWan;
		SRAM_BWbn_reg[0] <= SRAM_BWbn;
		SRAM_BWcn_reg[0] <= SRAM_BWcn;
		SRAM_BWdn_reg[0] <= SRAM_BWdn;
	end
	
	always @(negedge SRAM_CLK)
	begin
		SRAM_ADDR_regn <= SRAM_ADDR_reg[1];
		SRAM_WEn_regn <= SRAM_WEn_reg[1];
	end
	
	always @(posedge SRAM_CLK)
		if(!SRAM_WEn_reg[1])
		begin
			if(!SRAM_BWan_reg[1])
				ram_da[SRAM_ADDR_reg[1]] <= SRAM_DA;
				
			if(!SRAM_BWbn_reg[1])
				ram_db[SRAM_ADDR_reg[1]] <= SRAM_DB;
				
			if(!SRAM_BWcn_reg[1])
				ram_dc[SRAM_ADDR_reg[1]] <= SRAM_DC;
				
			if(!SRAM_BWdn_reg[1])
				ram_dd[SRAM_ADDR_reg[1]] <= SRAM_DD;
		end

	//reg				SRAM_OEn_reg	[0:1];
	assign		SRAM_DA = (!SRAM_WEn_regn)? 9'HZZZ : ram_da[SRAM_ADDR_regn];
	assign		SRAM_DB = (!SRAM_WEn_regn)? 9'HZZZ : ram_db[SRAM_ADDR_regn];
	assign		SRAM_DC = (!SRAM_WEn_regn)? 9'HZZZ : ram_dc[SRAM_ADDR_regn];
	assign		SRAM_DD = (!SRAM_WEn_regn)? 9'HZZZ : ram_dd[SRAM_ADDR_regn];
	
endmodule