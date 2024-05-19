// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

`include "i2c_macro.inc"
module i2c_user_fsm(
	input 	wire 		sys_clk, sys_rst_n,
	// i2c 接口
	output				i2c_sck,
	inout				i2c_sda,
	// 用户接口(slave & 寄存器地址)
	input	[`I2C_SLV_ADDR_WIDTH-1:0]	i2c_slave,	// slave 的地址
	input	[`I2C_REG_ADDR_WIDTH-1:0]	i2c_reg_addr,	// 需要操作的寄存器地址
	// 读写
	output	[`I2C_REG_DATA_WIDTH-1:0]	i2c_rdata,		// 读取数据
	output								i2c_rdata_valid,	 // 读取数据有效
	input								i2c_read_req,	// 读取请求
	input	[`I2C_REG_DATA_WIDTH-1:0]	i2c_wdata,		// 写入的数据
	input								i2c_write_req,	// 写入请求
	output								i2c_fail,	// 操作失败
	output								i2c_ready,	// 空闲，允许读写操作
	output								i2c_wait_ack,	// 正在等待ACK信号
	output								i2c_wait_sda,	// 正在等待SDA信号
	input								i2c_as_sccb		// 表示把i2c当做sccb用
	);
	
	reg		[`I2C_CLK_BASE_COUNT-1:0]	i2c_base_cnt;	// 基础计数器
	// 基础计数器
	reg		i2c_base_cnt_clr_n;	// 清除基础计数器的信号 // 后面的FSM在不同状态间跳转会生成清零信号
	always @(posedge sys_clk)
		if(!sys_rst_n || !i2c_base_cnt_clr_n)
			i2c_base_cnt <= 0;
		else if(i2c_base_cnt >= (`I2C_SCK_FREQ_FACTR-1))
			i2c_base_cnt <= 0;
		else
			i2c_base_cnt <= i2c_base_cnt + 1;
	
	// 	四个状态的FSM，作为主控
	reg		[2:0]	cstate;
	parameter		IDLE = 0;	// 闲置状态
	parameter		READ = 1;	// 读取状态
	parameter		WRITE = 2;	// 写入状态
	parameter		FINISH = 3;	// 操作完成状态
	parameter		FAIL = 4;	// 操作失败
	// 状态机跳转
	always @(posedge sys_clk)
		if(!sys_rst_n)
			init_system_task;
		else
		begin
			case(cstate)
				IDLE: begin
					// 如果接收到读取请求，那么清除基础计数器，然后跳转到READ
					if(i2c_read_req)
						jump_to_read_task;
					// 如果接收到写入请求，那么跳转到WIRTE
					else if(i2c_write_req)
						jump_to_write_task;
					else
						init_system_task;
				end
				// 读写操作
				READ: begin
					do_read_task;
				end
				WRITE: begin
					do_write_task;
				end				
				// 操作结束
				FINISH: begin
					init_system_task;
				end
				// 失败
				FAIL: begin
					do_fail_task;
				end
				// 否则强行进入FAIL阶段，强制结束这个愚蠢的会话
				default: begin
					do_fail_task;
				end
			endcase		
		end
/////////////////////////////////////////////////////////
// 还要有一些变量用来判断状态跳转
reg		[9:0]	ack_delay_cnt;	// 等待ACK信号的延时计数器
reg				ack_signal_cap;	// 捕捉到ACK信号
reg		[9:0]	rw_state_in_cnt;	// 状态内计数
reg		[4:0]	four_phase_cnt;	// 每个bit都有四相位计数器
// I2C的串行时钟和串行数据
reg				i2c_sck_reg;
reg				i2c_sda_reg;
// slave地址和register地址
reg		[`I2C_SLV_ADDR_WIDTH-1:0]	i2c_slave_reg;	// slave 的地址
reg		[`I2C_SLV_ADDR_WIDTH-1:0]	i2c_slave_reg2;	// slave 的地址2
reg		[`I2C_REG_ADDR_WIDTH-1:0]	i2c_reg_addr_reg;	// 需要操作的寄存器地址
reg		[`I2C_REG_DATA_WIDTH-1:0]	i2c_reg_data_reg;	// 需要操作的寄存器数据
// 状态机里面还要嵌套状态机
reg		[4:0]	rw_state;	// 读写状态（计数器）
parameter		RW_IDLE = 15;	// 闲置状态
parameter		RW_START = 0;	// start状态
parameter		RW_DEV_ADDR = 1;	// device地址（LSB是R/W读写标志位）
parameter		RW_ACK_START = 2;	// 等待START+DEV_ADDR --> ACK信号的状态
parameter		RW_REG_ADDR = 3;	// register 的地址
parameter		RW_ACK_REG = 4;	// 等待 REG_ADDR --> ACK信号的状态
parameter		RW_IDLE2 = 5;	// 针对读取，需要第二阶段的START信号
parameter		RW_START2 = 6;	// 针对读取，需要第二阶段的START信号
parameter		RW_DEV_ADDR2 = 7;	// 针对读取，需要第二阶段的DEV_ADDR，此时加入READ标记
parameter		RW_ACK_ADDR2 = 8;	// 加入2阶段地址插入的ACK捕获
parameter		RW_DATA = 9;	// 数据交互阶段（读写）
parameter		RW_ACK_DATA = 10;	// 等待  数据交互阶段（读写） --> ACK信号的状态
parameter		RW_STOP = 11;	// 停止状态
parameter		RW_FAIL = 12;	// 挂掉了（从机未响应）
parameter		RW_NO_ACK = 13;	// 读取操作中，master需要产生一个no_ack信号
parameter		RW_STOP_SCCB = 14; // 在SCCB协议中，2相位写入之后需要STOP一下，才能做2相位的读取
///////////////////////////////////////////
// 任务描述
// 系统复位任务
task init_system_task;
begin
	cstate <= IDLE;
	ack_delay_cnt <= 0;	// 清零ACK等待计数器
	i2c_base_cnt_clr_n <= 1;	// 不要清除计数器
	rw_state <= RW_IDLE;	// 闲置
	rw_state_in_cnt <= 0;
	// 拉高时钟和数据线
	i2c_sck_reg <= 1;
	i2c_sda_reg <= 1;
	// 清除四相位计数器
	four_phase_cnt <= 0;
	// 清除ACK捕捉信号
	ack_signal_cap <= 0;
end
endtask
/////////////////////////////////////////////////////////
// 如果接收到读取请求，那么清除基础计数器，然后跳转到READ
task jump_to_read_task;
begin
	cstate <= READ;
	i2c_base_cnt_clr_n <= 0;
	ack_delay_cnt <= 0;	// 清零ACK等待计数器
	rw_state <= RW_IDLE;	// 闲置
	rw_state_in_cnt <= 0;
	// 拉高时钟和数据线
	i2c_sck_reg <= 1;
	i2c_sda_reg <= 1;
	// 锁存slave 的地址 & 需要操作的寄存器地址
	i2c_slave_reg <= i2c_slave+`I2C_WRITE_FLAG;
	i2c_reg_addr_reg <= i2c_reg_addr;
	// 2阶段的地址传输
	i2c_slave_reg2 <= i2c_slave+`I2C_READ_FLAG;
	// 清除四相位计数器
	four_phase_cnt <= 0;
	// 清除ACK捕捉信号
	ack_signal_cap <= 0;
end
endtask
// 如果接收到写入请求，那么清除基础计数器，然后跳转到WRITE
task jump_to_write_task;
begin
	cstate <= WRITE;
	i2c_base_cnt_clr_n <= 0;
	ack_delay_cnt <= 0;	// 清零ACK等待计数器
	rw_state <= RW_IDLE;	// 闲置
	rw_state_in_cnt <= 0;
	// 拉高时钟和数据线
	i2c_sck_reg <= 1;
	i2c_sda_reg <= 1;
	// 锁存slave 的地址 & 需要操作的寄存器地址 & 需要写入的寄存器数据
	i2c_slave_reg <= i2c_slave+`I2C_WRITE_FLAG;
	i2c_reg_addr_reg <= i2c_reg_addr;
	i2c_reg_data_reg <= i2c_wdata;
	// 清除四相位计数器
	four_phase_cnt <= 0;
	// 清除ACK捕捉信号
	ack_signal_cap <= 0;
end
endtask
///////////////////////////////////////////////////////////////////
reg		[9:0]	i2c_bit_cnt;	// bit计数器
reg		[`I2C_REG_DATA_WIDTH-1:0]	i2c_rdata_shift;	// 移位寄存器
// 读取操作
task do_read_task;
begin
	i2c_base_cnt_clr_n <= 1;	// 撤销基础计数器的清零信号
	if(i2c_base_cnt==(`I2C_SCK_FREQ_FACTR-1))
	begin
		case(rw_state)
			RW_IDLE: begin 
				if(four_phase_cnt==0)
					i2c_sck_reg <= 1;	// IDLE的时候，时钟永远都是高电位
				////////////////////////////
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_START;	// 跳到启动
					rw_state_in_cnt <= 0;
					// 拉低数据线，产生START信号
					i2c_sda_reg <= 0;
					// 清除bit计数器
					i2c_bit_cnt <= 0;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				else
					four_phase_cnt <= four_phase_cnt + 1;
			end
			RW_START: begin
				// sck先掉下来，防止出现冲突！
				if(four_phase_cnt==2)
					i2c_sck_reg <= 0;
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_DEV_ADDR;	// 跳到发送设备地址
					rw_state_in_cnt <= 0;
					// 产生slave地址写入 // 数据串出
					i2c_sda_reg <= i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-1];
					i2c_slave_reg <= {i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-2:0], 1'B1};
					// 清除bit计数器
					i2c_bit_cnt <= 0;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				else
					four_phase_cnt <= four_phase_cnt + 1;				
			end
			RW_DEV_ADDR: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					if(i2c_bit_cnt>=(`I2C_SLV_ADDR_WIDTH-1))
					begin
						// 传输完数据后，就要进入ACK阶段
						rw_state <= RW_ACK_START;
						// 清除ACK捕捉信号
						ack_signal_cap <= 0;
						ack_delay_cnt <= 0;
					end
					else 
					begin
						// 计数器+1，并且输出数据
						i2c_bit_cnt <= i2c_bit_cnt+1;
						i2c_sda_reg <= i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-1];
						i2c_slave_reg <= {i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-2:0], 1'B1};			
					end
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end	
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 等待slave响应
			RW_ACK_START: begin
				// SCLK保持为高，直到发现ACK响应，或者超时
				// 就是说4相位计数器会卡在1的位置，一直到SDA响应，或者超时
				// 如果延时累加超过极限了，就要跳出，认为从机挂掉了
				if(ack_delay_cnt>=`I2C_ACK_TOLR_DELAY)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
					ack_delay_cnt <= 0;
				end
				// 否则，没有超时，可以继续等待 & 跳转
				else
				begin
					// 延时计数进行累加
					ack_delay_cnt <= ack_delay_cnt+1;
					// 时钟翻转
					if(four_phase_cnt==0 || four_phase_cnt==2)
						i2c_sck_reg <= ~i2c_sck_reg;
					// 捕捉从机响应
					else if(four_phase_cnt==1)
						ack_signal_cap <= ~i2c_sda;
					// 否则就是一大堆逻辑
					if(four_phase_cnt==3)
					begin
						// 清除四相位计数器
						four_phase_cnt <= 0;
						// 状态跳转！
						if(ack_signal_cap==1 || i2c_as_sccb)
						begin
							// 接收到ACK信号，进行状态跳转
							rw_state <= RW_REG_ADDR;
							// 串出数据
							i2c_sda_reg <= i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-1];
							i2c_reg_addr_reg <= {i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-2:0], 1'B1};	
							// 清除ACK捕捉信号
							ack_signal_cap <= 0;
							// 清除bit计数器
							i2c_bit_cnt <= 0;
						end
					end
					// 4相位计数器进行累加操作
					else if(four_phase_cnt!=1)
						four_phase_cnt <= four_phase_cnt + 1;
					else if(four_phase_cnt==1 && (!i2c_sda||i2c_as_sccb))
						four_phase_cnt <= four_phase_cnt + 1;
				end
			end
			// 然后是传输register地址
			RW_REG_ADDR: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					if(i2c_bit_cnt>=(`I2C_REG_ADDR_WIDTH-1))
					begin
						// 传输完数据后，就要进入ACK阶段
						rw_state <= RW_ACK_REG;
						// 清除ACK捕捉信号
						ack_signal_cap <= 0;
						ack_delay_cnt <= 0;
					end
					else 
					begin
						// 计数器+1，并且输出数据
						i2c_bit_cnt <= i2c_bit_cnt+1;
						i2c_sda_reg <= i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-1];
						i2c_reg_addr_reg <= {i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-2:0], 1'B1};	
					end
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end	
				// 4相位计数器进行累加操作
				else				
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 等待slave响应
			RW_ACK_REG: begin
				// SCLK保持为高，直到发现ACK响应，或者超时
				// 就是说4相位计数器会卡在1的位置，一直到SDA响应，或者超时
				// 如果延时累加超过极限了，就要跳出，认为从机挂掉了
				if(ack_delay_cnt>=`I2C_ACK_TOLR_DELAY)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
					ack_delay_cnt <= 0;
				end
				else
				begin
					// 延时计数进行累加
					ack_delay_cnt <= ack_delay_cnt+1;
					// 时钟翻转
					if(four_phase_cnt==0 || four_phase_cnt==2)
						i2c_sck_reg <= ~i2c_sck_reg;
					// 捕捉从机响应
					else if(four_phase_cnt==1)
						ack_signal_cap <= ~i2c_sda;
					// 否则就是一大堆逻辑
					if(four_phase_cnt==3)
					begin
						// 清除四相位计数器
						four_phase_cnt <= 0;
						// 状态跳转！
						if(ack_signal_cap==1 && !i2c_as_sccb)
						begin
							// 接收到ACK信号，进行状态跳转，进入到2阶段的RW_IDLE2,用来产生START信号
							rw_state <= RW_IDLE2;
							// 拉低数据线，产生START信号
							//i2c_sck_reg <= 1; //时钟先不要翻转，在下一个state的时候在翻转
							i2c_sda_reg <= 1;
							// 清除ACK捕捉信号
							ack_signal_cap <= 0;
							// 清除bit计数器
							i2c_bit_cnt <= 0;
						end
						// 否则如果是SCCB，需要先STOP一下
						else if(i2c_as_sccb)
						begin
							// 接收到ACK信号，进行状态跳转，进入到2阶段的RW_IDLE2,用来产生START信号
							rw_state <= RW_STOP_SCCB;
							// 拉低数据线，产生START信号
							//i2c_sck_reg <= 1; //时钟先不要翻转，在下一个state的时候在翻转
							i2c_sda_reg <= 0;
							// 清除ACK捕捉信号
							ack_signal_cap <= 0;
							// 清除bit计数器
							i2c_bit_cnt <= 0;
						end
					end
					// 4相位计数器进行累加操作
					else if(four_phase_cnt!=1)
						four_phase_cnt <= four_phase_cnt + 1;
					else if(four_phase_cnt==1 && (!i2c_sda || i2c_as_sccb))
						four_phase_cnt <= four_phase_cnt + 1;
				end
			end
			// SCCB需要一个STOP阶段
			RW_STOP_SCCB: begin
				// sck先翻上去，生成一个STOP！
				if(four_phase_cnt==1)
					i2c_sck_reg <= 1;
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_IDLE2;
					rw_state_in_cnt <= 0;
					i2c_sda_reg <= 1;
					// 清除bit计数器
					i2c_bit_cnt <= 0;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 回到I2C
			RW_IDLE2: begin 
				if(four_phase_cnt==0)
					i2c_sck_reg <= 1;	// IDLE的时候，时钟永远都是高电位
				////////////////////////////
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_START2;	// 跳到启动
					rw_state_in_cnt <= 0;
					// 拉低数据线，产生START信号
					i2c_sda_reg <= 0;
					// 清除bit计数器
					i2c_bit_cnt <= 0;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				else
					four_phase_cnt <= four_phase_cnt + 1;
			end
			// 第二阶段的START标记
			RW_START2: begin
				// sck先掉下来，防止出现冲突！
				if(four_phase_cnt==2)
					i2c_sck_reg <= 0;
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_DEV_ADDR2;	// 跳到发送设备地址
					rw_state_in_cnt <= 0;
					// 产生slave地址写入 // 数据串出
					i2c_sda_reg <= i2c_slave_reg2[`I2C_SLV_ADDR_WIDTH-1];
					i2c_slave_reg2 <= {i2c_slave_reg2[`I2C_SLV_ADDR_WIDTH-2:0], 1'B1};
					// 清除bit计数器
					i2c_bit_cnt <= 0;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				else
					four_phase_cnt <= four_phase_cnt + 1;				
			end
			// 然后是传输2阶段的slave地址
			RW_DEV_ADDR2: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					if(i2c_bit_cnt>=(`I2C_REG_ADDR_WIDTH-1))
					begin
						// 传输完数据后，就要进入ACK阶段
						rw_state <= RW_ACK_ADDR2;
						// 清除ACK捕捉信号
						ack_signal_cap <= 0;
						ack_delay_cnt <= 0;
					end
					else 
					begin
						// 计数器+1，并且输出数据
						i2c_bit_cnt <= i2c_bit_cnt+1;
						i2c_sda_reg <= i2c_slave_reg2[`I2C_REG_ADDR_WIDTH-1];
						i2c_slave_reg2 <= {i2c_slave_reg2[`I2C_REG_ADDR_WIDTH-2:0], 1'B1};	
					end
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end	
				// 4相位计数器进行累加操作
				else				
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 等待slave响应
			RW_ACK_ADDR2: begin
				// SCLK保持为高，直到发现ACK响应，或者超时
				// 就是说4相位计数器会卡在1的位置，一直到SDA响应，或者超时
				// 如果延时累加超过极限了，就要跳出，认为从机挂掉了
				if(ack_delay_cnt>=`I2C_ACK_TOLR_DELAY)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
					ack_delay_cnt <= 0;
				end
				else
				begin
					// 延时计数进行累加
					ack_delay_cnt <= ack_delay_cnt+1;
					// 时钟翻转
					if(four_phase_cnt==0 || four_phase_cnt==2)
						i2c_sck_reg <= ~i2c_sck_reg;
					// 捕捉从机响应
					else if(four_phase_cnt==1)
						ack_signal_cap <= ~i2c_sda;
					// 否则就是一大堆逻辑
					if(four_phase_cnt==3)
					begin
						// 清除四相位计数器
						four_phase_cnt <= 0;
						// 状态跳转！
						if(ack_signal_cap==1 || i2c_as_sccb)
						begin
							// 接收到ACK信号，进行状态跳转，进入到2阶段的地址传输
							rw_state <= RW_DATA;
							// 串出数据
							i2c_sda_reg <= i2c_slave_reg2[`I2C_REG_ADDR_WIDTH-1];
							i2c_slave_reg2 <= {i2c_slave_reg2[`I2C_REG_ADDR_WIDTH-2:0], 1'B1};	
							// 清除ACK捕捉信号
							ack_signal_cap <= 0;
							// 清除bit计数器
							i2c_bit_cnt <= 0;
						end
					end
					// 4相位计数器进行累加操作
					else if(four_phase_cnt!=1)
						four_phase_cnt <= four_phase_cnt + 1;
					else if(four_phase_cnt==1 && (!i2c_sda || i2c_as_sccb))
						four_phase_cnt <= four_phase_cnt + 1;
				end
			end
			// 读取数据
			RW_DATA: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				//////////////
				// 数据移入
				else if(four_phase_cnt==1)
					i2c_rdata_shift <= {i2c_rdata_shift[`I2C_REG_DATA_WIDTH-2:0], i2c_sda};
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					// 如果接受够了
					if(i2c_bit_cnt==(`I2C_REG_DATA_WIDTH-1))
					begin
						rw_state <= RW_NO_ACK;
						i2c_sda_reg <= 1;		// no-ack信号，中断i2c继续行进
						i2c_bit_cnt <= 0;
					end
					// 否则需要继续串入
					i2c_bit_cnt <= i2c_bit_cnt+1;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 产生no_ack信号
			RW_NO_ACK: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_STOP;
					// 产生STOP信号用
					i2c_sda_reg <= 0;
					// i2c_sck_reg <= 1; 时钟先不要翻转，在下一个state的时候在翻转
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 生成STOP信号
			RW_STOP: begin
				if(four_phase_cnt==0)
					i2c_sck_reg <= 1;	// IDLE的时候，时钟永远都是高电位
				//////////////////////////////
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_IDLE;
					i2c_sda_reg <= 1;
					//i2c_sck_reg <= 1;	
					// 清除四相位计数器
					four_phase_cnt <= 0;
					// 外部状态跳转出去，到FINISH
					cstate <= FINISH;
				end
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 否则强制跳入FAIL
			default: begin
				if(four_phase_cnt==3)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
				end
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
		endcase
	end
end
endtask
//////////////////////////////////////////////////////////////////
// 写入操作
task do_write_task;
begin
	i2c_base_cnt_clr_n <= 1;	// 撤销基础计数器的清零信号
	if(i2c_base_cnt==(`I2C_SCK_FREQ_FACTR-1))
	begin
		case(rw_state)
			RW_IDLE: begin 
				if(four_phase_cnt==0)
					i2c_sck_reg <= 1;	// IDLE的时候，时钟永远都是高电位
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_START;	// 跳到启动
					rw_state_in_cnt <= 0;
					// 拉低数据线，产生START信号
					//i2c_sck_reg <= 1;
					i2c_sda_reg <= 0;
					// 清除bit计数器
					i2c_bit_cnt <= 0;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				else
					four_phase_cnt <= four_phase_cnt + 1;
			end
			RW_START: begin
				// clock先掉下来，防止冲突！
				if(four_phase_cnt==2)
					i2c_sck_reg <= 0;
				////////////////////////
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_DEV_ADDR;	// 跳到发送设备地址
					rw_state_in_cnt <= 0;
					// 产生slave地址写入 // 数据串出
					i2c_sda_reg <= i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-1];
					i2c_slave_reg <= {i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-2:0], 1'B1};
					// 清除bit计数器
					i2c_bit_cnt <= 0;
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				else
					four_phase_cnt <= four_phase_cnt + 1;				
			end
			RW_DEV_ADDR: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					if(i2c_bit_cnt>=(`I2C_SLV_ADDR_WIDTH-1))
					begin
						// 传输完数据后，就要进入ACK阶段
						rw_state <= RW_ACK_START;
						// 清除ACK捕捉信号
						ack_signal_cap <= 0;
						ack_delay_cnt <= 0;
					end
					else 
					begin
						// 计数器+1，并且输出数据
						i2c_bit_cnt <= i2c_bit_cnt+1;
						i2c_sda_reg <= i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-1];
						i2c_slave_reg <= {i2c_slave_reg[`I2C_SLV_ADDR_WIDTH-2:0], 1'B1};			
					end
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end	
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 等待slave响应
			RW_ACK_START: begin
				// SCLK保持为高，直到发现ACK响应，或者超时
				// 就是说4相位计数器会卡在1的位置，一直到SDA响应，或者超时
				// 如果延时累加超过极限了，就要跳出，认为从机挂掉了
				if(ack_delay_cnt>=`I2C_ACK_TOLR_DELAY)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
				end
				else
				begin
					// 延时计数进行累加
					ack_delay_cnt <= ack_delay_cnt+1;
					// 时钟翻转
					if(four_phase_cnt==0 || four_phase_cnt==2)
						i2c_sck_reg <= ~i2c_sck_reg;
					// 捕捉从机响应
					else if(four_phase_cnt==1)
					ack_signal_cap <= ~i2c_sda;
					// 否则就是一大堆逻辑
					if(four_phase_cnt==3)
					begin
						// 清除四相位计数器
						four_phase_cnt <= 0;
						// 状态跳转！
						if(ack_signal_cap==1 || i2c_as_sccb)
						begin
							// 接收到ACK信号，进行状态跳转
							rw_state <= RW_REG_ADDR;
							// 串出数据
							i2c_sda_reg <= i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-1];
							i2c_reg_addr_reg <= {i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-2:0], 1'B1};	
							// 清除ACK捕捉信号
							ack_signal_cap <= 0;
							// 清除bit计数器
							i2c_bit_cnt <= 0;
						end
					end
					// 4相位计数器进行累加操作
					else if(four_phase_cnt!=1)
						four_phase_cnt <= four_phase_cnt + 1;
					else if(four_phase_cnt==1 && (!i2c_sda || i2c_as_sccb))
						four_phase_cnt <= four_phase_cnt + 1;		
				end
			end
			// 然后是传输register地址
			RW_REG_ADDR: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					if(i2c_bit_cnt>=(`I2C_REG_ADDR_WIDTH-1))
					begin
						// 传输完数据后，就要进入ACK阶段
						rw_state <= RW_ACK_REG;
						// 清除ACK捕捉信号
						ack_signal_cap <= 0;
						ack_delay_cnt <= 0;
					end
					else 
					begin
						// 计数器+1，并且输出数据
						i2c_bit_cnt <= i2c_bit_cnt+1;
						i2c_sda_reg <= i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-1];
						i2c_reg_addr_reg <= {i2c_reg_addr_reg[`I2C_REG_ADDR_WIDTH-2:0], 1'B1};	
					end
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end	
				// 4相位计数器进行累加操作
				else				
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 等待slave响应
			RW_ACK_REG: begin
				// SCLK保持为高，直到发现ACK响应，或者超时
				// 就是说4相位计数器会卡在1的位置，一直到SDA响应，或者超时
				// 如果延时累加超过极限了，就要跳出，认为从机挂掉了
				if(ack_delay_cnt>=`I2C_ACK_TOLR_DELAY)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
				end
				else
				begin
					// 延时计数进行累加
					ack_delay_cnt <= ack_delay_cnt+1;
					// 时钟翻转
					if(four_phase_cnt==0 || four_phase_cnt==2)
						i2c_sck_reg <= ~i2c_sck_reg;
					// 捕捉从机响应
					else if(four_phase_cnt==1)
						ack_signal_cap <= ~i2c_sda;
					// 否则就是一大堆逻辑
					if(four_phase_cnt==3)
					begin
						// 清除四相位计数器
						four_phase_cnt <= 0;
						// 状态跳转！
						if(ack_signal_cap==1 || i2c_as_sccb)
						begin
							// 接收到ACK信号，进行状态跳转
							rw_state <= RW_DATA;
							// 串出数据
							i2c_sda_reg <= i2c_reg_data_reg[`I2C_REG_DATA_WIDTH-1];
							i2c_reg_data_reg <= {i2c_reg_data_reg[`I2C_REG_DATA_WIDTH-2:0], 1'B1};	
							// 清除ACK捕捉信号
							ack_signal_cap <= 0;
							// 清除bit计数器
							i2c_bit_cnt <= 0;
						end
					end
					// 4相位计数器进行累加操作
					else if(four_phase_cnt!=1)
						four_phase_cnt <= four_phase_cnt + 1;
					else if(four_phase_cnt==1 && (!i2c_sda || i2c_as_sccb))
						four_phase_cnt <= four_phase_cnt + 1;	
				end
			end
			// 写入数据
			RW_DATA: begin
				// 时钟翻转
				if(four_phase_cnt==0 || four_phase_cnt==2)
					i2c_sck_reg <= ~i2c_sck_reg;
				//////////////
				// 然后是4相位走完的处理逻辑
				if(four_phase_cnt==3)
				begin
					// 如果发送够了
					if(i2c_bit_cnt==(`I2C_REG_DATA_WIDTH-1))
					begin
						rw_state <= RW_ACK_DATA;
						// 清除ACK捕捉信号
						ack_signal_cap <= 0;
						// 清除ACK 等待延时计数器
						ack_delay_cnt <= 0;
					end
					// 否则需要继续串出
					i2c_bit_cnt <= i2c_bit_cnt+1;
					// 串出数据
					i2c_sda_reg <= i2c_reg_data_reg[`I2C_REG_DATA_WIDTH-1];
					i2c_reg_data_reg <= {i2c_reg_data_reg[`I2C_REG_DATA_WIDTH-2:0], 1'B1};	
					// 清除四相位计数器
					four_phase_cnt <= 0;
				end
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
			// 等待slave的ack信号
			RW_ACK_DATA: begin	
				// SCLK保持为高，直到发现ACK响应，或者超时
				// 就是说4相位计数器会卡在1的位置，一直到SDA响应，或者超时
				// 如果延时累加超过极限了，就要跳出，认为从机挂掉了
				if(ack_delay_cnt>=`I2C_ACK_TOLR_DELAY)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
				end
				else
				begin
					// 延时计数进行累加
					ack_delay_cnt <= ack_delay_cnt+1;
					// 时钟翻转
					if(four_phase_cnt==0 || four_phase_cnt==2)
						i2c_sck_reg <= ~i2c_sck_reg;
					// 捕捉从机响应
					else if(four_phase_cnt==1)
						ack_signal_cap <= ~i2c_sda;
					// 否则就是一大堆逻辑
					if(four_phase_cnt==3)
					begin
						// 清除四相位计数器
						four_phase_cnt <= 0;
						// 状态跳转！
						if(ack_signal_cap==1 || i2c_as_sccb)
						begin
							// 接收到ACK信号，进行状态跳转
							rw_state <= RW_STOP;
							// 产生STOP信号！
							i2c_sda_reg <= 0;
							//i2c_sck_reg <= 1;// 时钟先不要翻转
							// 清除ACK捕捉信号
							ack_signal_cap <= 0;
						end
					end
					// 4相位计数器进行累加操作
					else if(four_phase_cnt!=1)
						four_phase_cnt <= four_phase_cnt + 1;
					else if(four_phase_cnt==1 && (!i2c_sda || i2c_as_sccb))
						four_phase_cnt <= four_phase_cnt + 1;	
				end
			end
			// 生成STOP信号
			RW_STOP: begin
				if(four_phase_cnt==0)
					i2c_sck_reg <= 1;	// IDLE的时候，时钟永远都是高电位
				//////////////////////////////
				if(four_phase_cnt==3)
				begin
					rw_state <= RW_IDLE;
					i2c_sda_reg <= 1;	
					//i2c_sck_reg <= 1;
					// 清除四相位计数器
					four_phase_cnt <= 0;
					// 外部状态跳转出去，到FINISH
					cstate <= FINISH;
				end
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end		
			// 否则强制跳入FAIL
			default: begin
				if(four_phase_cnt==3)
				begin
					cstate <= FAIL;
					rw_state <= RW_FAIL;
					four_phase_cnt <= 0;
				end
				// 4相位计数器进行累加操作
				else
					four_phase_cnt <= four_phase_cnt + 1;	
			end
		endcase
	end
end
endtask
///////////////////////////
// 对于运行失败的任务，需要强行产生一个停止信号，终止I2C回话
task do_fail_task;
begin
	// 然后4相位计数完成，跳转到FINISH
	/// 就能产生一个停止信号了，这里有些取巧！
	if(i2c_base_cnt==(`I2C_SCK_FREQ_FACTR-1))
	begin
		// 拉低信号线，时钟线拉高
		i2c_sda_reg <= 0; 
		i2c_sck_reg <= 1;
		if(four_phase_cnt==3)
			cstate <= FINISH;
		else
			four_phase_cnt <= four_phase_cnt + 1;	
	end
end
endtask
//////////////////////////////////////////////////////////////////
// 最后，把各个信号拉出去
// 生成ready & fail信号
assign			i2c_ready = (cstate==IDLE);
assign			i2c_fail = (cstate==FAIL);
// 生成等待ACK信号的（标记）
assign			i2c_wait_ack = ((rw_state==RW_ACK_DATA)|(rw_state==RW_ACK_REG)|(rw_state==RW_ACK_START)|(rw_state==RW_ACK_ADDR2));
// 正在等待SDA信号
assign			i2c_wait_sda = (cstate==READ && rw_state==RW_DATA);
// 串行时钟 & 串行数据信号线
assign			i2c_sck = i2c_sck_reg;
assign			i2c_sda = (i2c_wait_ack|i2c_wait_sda)? 1'BZ : i2c_sda_reg;
// 输出读取的数据
reg		[`I2C_REG_DATA_WIDTH-1:0]	i2c_rdata_reg;		// 读取数据
reg									i2c_rdata_valid_reg;	 // 读取数据有效
always @(posedge sys_clk)
begin
	if(cstate==READ && rw_state==RW_DATA && 
			four_phase_cnt==3 && (i2c_base_cnt==(`I2C_SCK_FREQ_FACTR-1)) &&
			i2c_bit_cnt==(`I2C_REG_DATA_WIDTH-1))
	begin
		i2c_rdata_reg <= i2c_rdata_shift;
		i2c_rdata_valid_reg <= 1;
	end
	else
		i2c_rdata_valid_reg <= 0;
end
// 
assign			i2c_rdata = i2c_rdata_reg;
assign			i2c_rdata_valid = i2c_rdata_valid_reg;
//////////////////////////////////////////////////////////////////////
endmodule
