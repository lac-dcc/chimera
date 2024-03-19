`include "i2c_macro.inc"
module	adv7513_config
(	
	input	wire 			CLOCK10,
	input	wire 			RESETN,
	input	wire	[1:1]	KEY_safe,
	input	wire	[10:0]	configure_sz,	// 配置表的数量
	output	wire			configuring,	// 正在配置过程中
	output					adv7513_SIOC,
	inout					adv7513_SIOD
);

	// 检查下降/上升沿
	reg		[1:1]	kKEY_safe;
	always @(posedge CLOCK10)
		kKEY_safe <= KEY_safe;
	// 判断合上/断开
	wire	[1:1]	KEY_up = (~kKEY_safe&KEY_safe);
	wire	[1:1]	KEY_dn = (kKEY_safe & ~KEY_safe);	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 然后是adv7513
	wire	[`I2C_SLV_ADDR_WIDTH-1:0]	adv7513_i2c_slave = 8'H72;	// slave 的地址
	reg		[`I2C_REG_ADDR_WIDTH-1:0]	adv7513_i2c_reg_addr;	// 需要操作的寄存器地址
	wire	[`I2C_REG_DATA_WIDTH-1:0]	adv7513_i2c_rdata;		// 读取数据
	wire								adv7513_i2c_rdata_valid;	 // 读取数据有效
	reg									adv7513_i2c_read_req;	// 读取请求
	reg		[`I2C_REG_DATA_WIDTH-1:0]	adv7513_i2c_wdata;		// 写入的数据
	reg									adv7513_i2c_write_req;	// 写入请求
	wire								adv7513_i2c_fail;	// 操作失败
	wire								adv7513_i2c_ready;	// 空闲，允许读写操作
	wire								adv7513_i2c_wait_ack; // 正在等待ACK信号
	wire								adv7513_i2c_wait_sda; // 正在等待SDA信号
	// 配置表
	// 按下按钮1， 启动配置表写入
	reg		[9:0]			adv7513_setting_addr;
	reg						cur_adv7513_i2c_setting_valid;
	wire	[31:0]			adv7513_i2c_setting_q;
	adv7513_i2c_setting		adv7513_i2c_setting_inst(.clock(CLOCK10),.address(adv7513_setting_addr),.q(adv7513_i2c_setting_q));
	/////////////////////
	reg		[3:0]			cstate;
	reg		[3:0]			counter;
	assign					configuring = (cstate!=0);
	// 延时计数器
	reg		[31:0]			delay;
	//////////////////////////////////
	always @(posedge CLOCK10)
		if(!RESETN)
		begin
			adv7513_setting_addr <= 0;
			cur_adv7513_i2c_setting_valid <= 0;
			cstate <= 0;
		end
		else 
		begin
			case(cstate)
				0: begin
					// 如果按下按钮，就要开始配置写入
					if(KEY_dn[1])
					begin
						adv7513_setting_addr <= 0;
						cstate <= 1;
						counter <= 0;
					end
				end
				
				// 闲置3个clock，读取rom
				1: begin
					if(counter>=6)
					begin
						counter <= 0;
						cstate <= 2;	// 
					end
					else
						counter <= counter + 1;
				end
				
				// 如果i2c控制器没有被占用，就要启用，生成一个valid脉冲
				2: begin
					if(adv7513_i2c_ready)
					begin
						// 如果此时的I2C指令不是延时，就要执行
						if(adv7513_i2c_setting_q!=32'HFFFF_FFFF)
						begin
							cur_adv7513_i2c_setting_valid <= 1;
							cstate <= 3;
						end
						// 否则就是delay
						else
						begin
							cstate <= 6;
							cur_adv7513_i2c_setting_valid <= 0;
							delay <= 0;
						end
					end
				end
				
				// 撤销valid信号
				3: begin
					cur_adv7513_i2c_setting_valid <= 0;
					cstate <= 4;
				end
				
				// 等待i2c控制器执行完成
				4: begin
					if(adv7513_i2c_ready)
						cstate <= 5;
				end
				
				// 继续下一个寄存器的配置，或者跳出配置
				5: begin
					// 如果全部完成，就要回到idle状态
					if(adv7513_setting_addr>=(configure_sz-1))
					begin
						adv7513_setting_addr <= 0;
						cstate <= 0;
						cur_adv7513_i2c_setting_valid <= 0;
					end
					// 否则启动下一步i2c操作
					else
					begin
						adv7513_setting_addr <= adv7513_setting_addr + 1;	// ROM读取地址加1
						cstate <= 1;
						cur_adv7513_i2c_setting_valid <= 0;
					end
				end
				// 延时的cstate
				6: begin
					if(delay>=32'D2000000)
					begin
						delay <= 0;
						cstate <= 5;
					end
					else
						delay <= delay + 1;
				end
				// 
				default: begin
					cstate <= 0;
					cur_adv7513_i2c_setting_valid <= 0;
					adv7513_setting_addr <= 0;
				end
			endcase
		end
	////////////////
	always @(posedge CLOCK10)
	begin
		if(cur_adv7513_i2c_setting_valid)
		begin
			adv7513_i2c_reg_addr <= adv7513_i2c_setting_q[15:8];
			adv7513_i2c_wdata <= adv7513_i2c_setting_q[7:0];
		end
		adv7513_i2c_write_req <= cur_adv7513_i2c_setting_valid && (adv7513_i2c_setting_q[16]==`I2C_WRITE_CMD);
		adv7513_i2c_read_req <= cur_adv7513_i2c_setting_valid && (adv7513_i2c_setting_q[16]==`I2C_READ_CMD);
	end
	////////////////////////////////
	i2c_user_fsm	i2c_adv7513_mdl(.sys_clk(CLOCK10),.sys_rst_n(RESETN),
									.i2c_sck(adv7513_SIOC),.i2c_sda(adv7513_SIOD),
									.i2c_slave(adv7513_i2c_slave),.i2c_reg_addr(adv7513_i2c_reg_addr),
									.i2c_wdata(adv7513_i2c_wdata),.i2c_write_req(adv7513_i2c_write_req),
									.i2c_read_req(adv7513_i2c_read_req),
									.i2c_wait_ack(adv7513_i2c_wait_ack),.i2c_ready(adv7513_i2c_ready),
									.i2c_wait_sda(adv7513_i2c_wait_sda),.i2c_fail(adv7513_i2c_fail),
									.i2c_as_sccb(0)
									);

endmodule