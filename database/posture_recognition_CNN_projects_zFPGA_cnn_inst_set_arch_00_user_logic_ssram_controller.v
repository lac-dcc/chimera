module ssram_controller
(
	input	wire						CLOCK_0deg,
	input	wire						CLOCK_pideg,
	input	wire						reset_reset_n,		// 系统时钟/复位
	output	wire						ssram_avalon_clock_clk,
	output	reg							ssram_avalon_reset_n,
	input	wire	[27:0]				ssram_avalon_address,
	input	wire	[31:0]				ssram_avalon_writedata,
	input	wire						ssram_avalon_write_n,
	input	wire						ssram_avalon_read_n,
	output	reg		[31:0]				ssram_avalon_readdata,
	output	reg							ssram_avalon_readdatavalid,
	output	reg							ssram_avalon_waitrequest,
	
	// ssram
	output	reg		[27:0]				ssram_pins_addr,
	inout			[8:0]				ssram_pins_da,
	inout			[8:0]				ssram_pins_db,
	inout			[8:0]				ssram_pins_dc,
	inout			[8:0]				ssram_pins_dd,
	output	reg							ssram_pins_adv,
	output	reg							ssram_pins_ce_n,
	output	reg							ssram_pins_ce2,
	output	reg							ssram_pins_ce2_n,
	output	wire						ssram_pins_clk,
	output	reg							ssram_pins_clken,
	output	reg							ssram_pins_oe_n,
	output	reg							ssram_pins_we_n,
	output	reg							ssram_pins_bwa_n,
	output	reg							ssram_pins_bwb_n,
	output	reg							ssram_pins_bwc_n,
	output	reg							ssram_pins_bwd_n,
	output	reg							ssram_pins_mode,
	output	reg							ssram_pins_zz
);

	wire			afi_phy_clk = CLOCK_0deg;	// 系统时钟/复位
	assign			ssram_pins_clk = CLOCK_pideg;
	//pll_sram		pll_sram_mdl(.inclk0(CLOCK27),.c0(afi_phy_clk),.c1(ssram_pins_clk));	
	
	always @(posedge afi_phy_clk)
		ssram_avalon_reset_n <= reset_reset_n;

	// 片选始终有效，时钟有效，输出有效，地址&数据有效，低功耗关闭，字节有效
	always @(posedge afi_phy_clk)
	begin
		//ssram_pins_ce_n <= 0;
		ssram_pins_ce2 <= 1;
		ssram_pins_ce2_n <= 0;
		ssram_pins_clken <= 0;
		//ssram_pins_oe_n <= 0;
		ssram_pins_adv <= 0;
		ssram_pins_zz <= !reset_reset_n;
		ssram_pins_bwa_n <= 0;
		ssram_pins_bwb_n <= 0;
		ssram_pins_bwc_n <= 0;
		ssram_pins_bwd_n <= 0;
		ssram_pins_mode <= 0;
	end
	// 写SSRAM的数据
	reg			[31:0]				ssram_pins_d_reg;
	// 没有burst，avalon接口那儿不会同时给出read/write请求
	always @(posedge afi_phy_clk)
	begin
		ssram_pins_addr <= ssram_avalon_address;
		ssram_pins_d_reg <= ssram_avalon_writedata;
		ssram_pins_we_n <= ssram_avalon_write_n;
		ssram_pins_ce_n <= ssram_avalon_write_n & ssram_avalon_read_n;
	end
	// 把SSRAM中读取的数据传递出来！
	reg			[2:0]				ssram_avalon_read_n_shifter;
	reg			[31:0]				ssram_pins_d_read;
	always @(posedge afi_phy_clk)
		if(!ssram_avalon_reset_n)
			ssram_avalon_read_n_shifter <= 3'B111;
		else
			ssram_avalon_read_n_shifter <= {ssram_avalon_read_n_shifter[1:0], ssram_avalon_read_n};
	
	// 要把读取的数据和读取的地址进行同步
	reg			[31:0]				ssram_avalon_address_shifter	[0:3];
	always @(posedge afi_phy_clk)
	begin
		ssram_avalon_address_shifter[3] <= ssram_avalon_address_shifter[2];
		ssram_avalon_address_shifter[2] <= ssram_avalon_address_shifter[1];
		ssram_avalon_address_shifter[1] <= ssram_avalon_address_shifter[0];
		ssram_avalon_address_shifter[0] <= ssram_avalon_address;
	end
	// 生成oe_n信号
	always @(posedge afi_phy_clk)
		ssram_pins_oe_n <= ssram_avalon_read_n_shifter[0];	// 2017-12-30: 提前给出oe使能信号！
	
	reg				ssram_avalon_readdatavalid_j;
	reg	 	[31:0]	ssram_avalon_readdata_j;
	always @(negedge afi_phy_clk)
	begin
		ssram_avalon_readdatavalid_j <= !ssram_avalon_read_n_shifter[2];
		ssram_avalon_readdata_j <= {ssram_pins_da[7:0], ssram_pins_db[7:0], ssram_pins_dc[7:0], ssram_pins_dd[7:0]};
	end
	
	always @(posedge afi_phy_clk)
	begin
		ssram_avalon_readdatavalid <= ssram_avalon_readdatavalid_j;
		ssram_avalon_readdata <= ssram_avalon_readdata_j;
	end
	
	always @(posedge afi_phy_clk)
		ssram_avalon_waitrequest <= 0;

	// 要写入SSRAM的数据必须延迟两拍！这是因为这是1个数据port，但是读取2拍延迟！
	reg			[2:0]				ssram_avalon_write_n_shifter;
	reg			[31:0]				ssram_avalon_writedata_shifter [0:2];
	always @(posedge afi_phy_clk)
		if(!reset_reset_n)
		begin
			ssram_avalon_write_n_shifter <= 3'B111;
			ssram_avalon_writedata_shifter[0] <= 0;
			ssram_avalon_writedata_shifter[1] <= 0;
			ssram_avalon_writedata_shifter[2] <= 0;
		end
		else
		begin
			ssram_avalon_write_n_shifter <= {ssram_avalon_write_n_shifter[1:0], ssram_avalon_write_n};
			ssram_avalon_writedata_shifter[0] <= ssram_avalon_writedata;
			ssram_avalon_writedata_shifter[1] <= ssram_avalon_writedata_shifter[0];
			ssram_avalon_writedata_shifter[2] <= ssram_avalon_writedata_shifter[1];
		end
////////////////////////////////////////
// Avalon
	assign	ssram_avalon_clock_clk = afi_phy_clk;
	
// SSRAM
	//assign	ssram_pins_clk = afi_phy_clk;
	assign	ssram_pins_da = !ssram_avalon_write_n_shifter[2]? {1'B0, ssram_avalon_writedata_shifter[2][31:24]} : 9'HZZZ;
	assign	ssram_pins_db = !ssram_avalon_write_n_shifter[2]? {1'B0, ssram_avalon_writedata_shifter[2][23:16]} : 9'HZZZ;
	assign	ssram_pins_dc = !ssram_avalon_write_n_shifter[2]? {1'B0, ssram_avalon_writedata_shifter[2][15:8]} : 9'HZZZ;
	assign	ssram_pins_dd = !ssram_avalon_write_n_shifter[2]? {1'B0, ssram_avalon_writedata_shifter[2][7:0]} : 9'HZZZ;

endmodule