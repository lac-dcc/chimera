// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

// CNN指令集架构的解析器
module cnn_inst_parser
#(parameter	DATA_WIDTH = 32,    // 数据位宽
  parameter	FRAC_WIDTH = 16,	// 小数部分
  parameter RAM_LATENCY = 2,	// ram的IP核读取需要延时
  parameter MAC_LATENCY = 2,	// ram的IP核读取需要延时
  parameter	DIV_LATENCY = 50,	// 除法器的延时
  parameter	DMI_LATENCY = 2,	// 除法器的延时
  parameter	DATA_UNIT = {{(DATA_WIDTH-FRAC_WIDTH-1){1'B0}}, 1'B1, {FRAC_WIDTH{1'B0}}}, // 固定的单位1 
  parameter	DATA_ZERO = {DATA_WIDTH{1'B0}},	// 固定的0值
  parameter	INST_WIDTH = 128	// 指令的长度
)
(
	input	wire						clk, rst_n,	// 时钟和复位信号
	input	wire	[INST_WIDTH-1:0]	cnn_inst,	// CNN的指令
	input	wire						cnn_inst_en,	// 指令使能标志
	output	reg							cnn_inst_ready,	// 指令执行完成标志
	output	reg		[DATA_WIDTH-1:0]	cnn_inst_time,	// 计量指令执行时间
	// DDR接口
	output	wire						DDR_WRITE_CLK,
	output	wire	[DATA_WIDTH-1:0]	DDR_WRITE_ADDR,
	output	wire	[DATA_WIDTH-1:0]	DDR_WRITE_DATA,
	output	wire						DDR_WRITE_REQ,
	input	wire						DDR_WRITE_READY,
	output	wire						DDR_READ_CLK,
	output	wire	[DATA_WIDTH-1:0]	DDR_READ_ADDR,
	output	wire						DDR_READ_REQ,
	input	wire						DDR_READ_READY,
	input	wire	[DATA_WIDTH-1:0]	DDR_READ_DATA,
	input	wire						DDR_READ_DATA_VALID
);
	
	// ddr的读写接口
	reg		[31:0]	ddr_read_addr;
	reg				ddr_read_req;
	wire			ddr_read_ready;
	wire	[31:0]	ddr_read_data;
	wire			ddr_read_data_valid;
	reg		[31:0]	ddr_write_addr;
	wire			ddr_write_req;
	wire			ddr_write_ready;
	wire	[31:0]	ddr_write_data;
	///////////
	assign			DDR_WRITE_CLK = clk;
	assign			DDR_WRITE_ADDR = ddr_write_addr;
	assign			DDR_WRITE_DATA = ddr_write_data;
	assign			DDR_WRITE_REQ = ddr_write_req;
	assign			ddr_write_ready = DDR_WRITE_READY;
	
	wire			ddr_write_data_valid = ddr_write_ready && ddr_write_req;	// 表示一次数据成功写入
	//
	assign			DDR_READ_CLK = clk;
	assign			DDR_READ_ADDR = ddr_read_addr;
	assign			DDR_READ_REQ = ddr_read_req;
	assign			ddr_read_ready = DDR_READ_READY;
	assign			ddr_read_data = DDR_READ_DATA;
	assign			ddr_read_data_valid = DDR_READ_DATA_VALID;
	
	//
	reg		[31:0]	ddr_write_row;	// 计量DDR回写时候的行计数
	reg		[31:0]	ddr_write_col;	// 计量DDR回写时候的列计数
	
	///////////////
	
/* CNN指令集架构的指令表

	[127:124][123:92][91:60][59:28][27:0]
		OP 		$1		$2		$3		MNPK
		指令名	地址	地址	地址	参数
ADD		0		$1		$2		$3		M/N/0/0		==> $3 = $1+$2
ADDi	1		$1		i		$3		M/N/0/0		==> $3 = $1+i
SUB		2		$1		$2		$3		M/N/0/0		==> $3 = $1-$2
SUBi	3		$1		i		$3		M/N/0/0		==> $3 = $1-i
MULT	4		$1		$2		$3		M/N/P/0		==> $3 = $1x$2
MULTi	5		$1		i		$3		M/N/0/0		==> $3 = $1xi
DOT		6		$1		$2		$3		M/N/0/0		==> $3 = $1.$2
CONV	7		$1		$2		$3		M/N/Km/Kn	==> $3 = $1*$2
POOL	8		$1		mode	$3		M/N/Pm/Pn	==> $3 = pooling($1)	// mode = max/mean
SIGM	9		$1		xx		$3		M/N/0/0		==> $3 = sigmoid($1)
RELU	10		$1		xx		$3		M/N/0/0		==> $3 = ReLU($1)
TANH	11		$1		xx		$3		M/N/0/0		==> $3 = tanh($1)
GRAY	12		$1		xx		$3		M/N/0/0		==> $3 = gray($1)	// RGB565-->灰度图
TRAN	13		$1		xx		$3		M/N/0/0		==> $3 = tran($1)	// 
ADDs	14		$1		$2		$3		M/N/0/0		==> $3 = $1 + $2 x ones(M, N)	// 进行矩阵matrix和标量scalar的加法
SUBs	15		$1		$2		$3		M/N/0/0		==> $3 = $1 - $2 x ones(M, N)	// 进行矩阵matrix和标量scalar的减法
*/
	parameter		ADD = 0;		// 加法
	parameter		ADDi = 1;		// 立即数加法
	parameter		SUB = 2;		// 减法
	parameter		SUBi = 3;		// 立即数减法
	parameter		MULT = 4;		// 乘法
	parameter		MULTi = 5;		// 立即数乘法
	parameter		DOT = 6;		// 矩阵点乘
	parameter		CONV = 7;		// 2D卷积
	parameter		POOL = 8;		// 2D池化
	parameter		SIGM = 9;		// sigmoid函数
	parameter		RELU = 10;		// ReLU函数
	parameter		TANH = 11;		// tanh函数
	parameter		GRAY = 12;		// RGB--灰度图转换
	parameter		TRAN = 13;		// 转置
	parameter		ADDs = 14;		// 矩阵+标量
	parameter		SUBs = 15;		// 矩阵-标量

	reg		[3:0]	OP;	// 指令名
	reg		[31:0]	Dollar1;	// 参数1
	reg		[31:0]	Dollar2;	// 参数2
	reg		[31:0]	Dollar3;	// 参数3
	reg		[7:0]	M;	// 参数1的行尺寸
	reg		[7:0]	N;	// 参数1的列尺寸	/ 参数2的行尺寸
	reg		[7:0]	P;	// 参数2的列尺寸
	reg		[5:0]	Km, Kn;	// 卷积核的行列尺寸
	reg		[5:0]	Pm, Pn;	// 池化核的行列尺寸
	reg		[127:0]	OP_EN;	// 一长串OP使能链
	//
	reg		[31:0]	IMM;	// 立即数
	reg		[31:0]	MODE;	// POOL池化的模式：平均[0] / maxpool[1]
	reg		signed	[31:0]	SCALAR;	// 读取到的$2标量
	// 加载CNN的指令
	always @(posedge clk)
	begin
		OP_EN <= {OP_EN[126:0], cnn_inst_en};
		if(cnn_inst_en)
		begin
			OP <= cnn_inst[127:124];
			Dollar1 <= cnn_inst[123:92];
			Dollar2 <= cnn_inst[91:60];
			Dollar3 <= cnn_inst[59:28];
			M <= cnn_inst[27:20];
			N <= cnn_inst[19:12];
			P <= cnn_inst[11:4];
			Km <= cnn_inst[11:6];
			Kn <= cnn_inst[5:0];
			Pm <= cnn_inst[11:6];
			Pn <= cnn_inst[5:0];
			IMM <= cnn_inst[91:60];
			MODE <= cnn_inst[91:60];	
		end
	end
	
	// 三段数据缓存	// 之所以要缓存下$1/$2一行的数据，是考虑到DDR的读写（连续地址可以burst，很快）
	// 之所以要缓存  $3的数据，是因为DDR的写入有延时
	wire	[31:0]		cnn_scfifo_256pts_Dollar1_q;
	wire				cnn_scfifo_256pts_Dollar1_rdreq;
	wire				cnn_scfifo_256pts_Dollar1_rdempty;
	wire	[7:0]		cnn_scfifo_256pts_Dollar1_rdusedw;
	wire	[31:0]		cnn_scfifo_256pts_Dollar1_data;
	wire				cnn_scfifo_256pts_Dollar1_wrreq;
	wire	[31:0]		cnn_scfifo_256pts_Dollar2_q;
	reg					cnn_scfifo_256pts_Dollar2_rdreq;
	wire				cnn_scfifo_256pts_Dollar2_rdempty;
	wire	[7:0]		cnn_scfifo_256pts_Dollar2_rdusedw;
	wire	[31:0]		cnn_scfifo_256pts_Dollar2_data;
	wire				cnn_scfifo_256pts_Dollar2_wrreq;
	wire	[31:0]		cnn_scfifo_256pts_Dollar3_q;
	wire				cnn_scfifo_256pts_Dollar3_rdreq;
	wire				cnn_scfifo_256pts_Dollar3_rdempty;
	wire	[7:0]		cnn_scfifo_256pts_Dollar3_rdusedw;
	wire	[31:0]		cnn_scfifo_256pts_Dollar3_data;
	wire				cnn_scfifo_256pts_Dollar3_wrreq;
	cnn_scfifo_256pts	cnn_scfifo_256pts_Dollar1(
							.clock(clk),
							.data(cnn_scfifo_256pts_Dollar1_data),
							.rdreq(cnn_scfifo_256pts_Dollar1_rdreq),
							.wrreq(cnn_scfifo_256pts_Dollar1_wrreq),
							.empty(cnn_scfifo_256pts_Dollar1_rdempty),
							.full(),
							.q(cnn_scfifo_256pts_Dollar1_q),
							.usedw(cnn_scfifo_256pts_Dollar1_rdusedw)
						);
	cnn_scfifo_256pts	cnn_scfifo_256pts_Dollar2(
							.clock(clk),
							.data(cnn_scfifo_256pts_Dollar2_data),
							.rdreq(cnn_scfifo_256pts_Dollar2_rdreq),
							.wrreq(cnn_scfifo_256pts_Dollar2_wrreq),
							.empty(cnn_scfifo_256pts_Dollar2_rdempty),
							.full(),
							.q(cnn_scfifo_256pts_Dollar2_q),
							.usedw(cnn_scfifo_256pts_Dollar2_rdusedw)
						);
	cnn_scfifo_256pts	cnn_scfifo_256pts_Dollar3(
							.clock(clk),
							.data(cnn_scfifo_256pts_Dollar3_data),
							.rdreq(cnn_scfifo_256pts_Dollar3_rdreq),
							.wrreq(cnn_scfifo_256pts_Dollar3_wrreq),
							.empty(cnn_scfifo_256pts_Dollar3_rdempty),
							.full(),
							.q(cnn_scfifo_256pts_Dollar3_q),
							.usedw(cnn_scfifo_256pts_Dollar3_rdusedw)
						);
						
	// 接入DDR接口
	assign			ddr_write_data = cnn_scfifo_256pts_Dollar3_q;
	assign			ddr_write_req = !cnn_scfifo_256pts_Dollar3_rdempty;
	assign			cnn_scfifo_256pts_Dollar3_rdreq = ddr_write_data_valid;
	always @(posedge clk)
		if(OP_EN[0])
		begin
			ddr_write_col <= 0;
			ddr_write_row <= 0;
		end
		else
		begin
			if(OP==ADD || OP==SUB || OP==ADDi || OP==SUBi || OP==MULTi || OP==DOT || OP==SIGM || OP==RELU || OP==TANH || OP==GRAY || OP==ADDs || OP==SUBs)
			begin
				if(ddr_write_data_valid)
				begin
					if(ddr_write_col>=(N-1))
					begin
						ddr_write_col <= 0;
						ddr_write_row <= ddr_write_row + 1;
					end
					else
						ddr_write_col <= ddr_write_col + 1;
				end
			end
			else if(OP==MULT)
			begin
				if(ddr_write_data_valid)
				begin
					if(ddr_write_col>=(P-1))
					begin
						ddr_write_col <= 0;
						ddr_write_row <= ddr_write_row + 1;
					end
					else
						ddr_write_col <= ddr_write_col + 1;
				end
			end
			else if(OP==CONV)
			begin
				if(ddr_write_data_valid)
				begin
					if(ddr_write_col>=(N-Kn))
					begin
						ddr_write_col <= 0;
						ddr_write_row <= ddr_write_row + 1;
					end
					else
						ddr_write_col <= ddr_write_col + 1;
				end
			end
			else if(OP==POOL)
			begin
				if(ddr_write_data_valid)
				begin
					if(ddr_write_col>=((N>>>1)-1))
					begin
						ddr_write_col <= 0;
						ddr_write_row <= ddr_write_row + 1;
					end
					else
						ddr_write_col <= ddr_write_col + 1;
				end
			end
			else if(OP==TRAN)
			begin
				if(ddr_write_data_valid)
				begin
					if(ddr_write_col>=(M-1))
					begin
						ddr_write_col <= 0;
						ddr_write_row <= ddr_write_row + 1;
					end
					else
						ddr_write_col <= ddr_write_col + 1;
				end
			end
		end
		
	// 生成DDR写入地址
	always @(posedge clk)
	begin
		if(OP_EN[1])
			ddr_write_addr <= Dollar3;
		else if(ddr_write_data_valid)
			ddr_write_addr <= ddr_write_addr + 1;
	end
	//////////////////////////////////////////////////////////////////////////////////					
	// 使用FSM控制CNN的计算
	reg		[5:0]	cstate;
	reg		[5:0]	substate;
	reg		[5:0]	delay;
	reg		[31:0]	GPC0;	// 通用计数器 -- general proposal counter
	reg		[31:0]	GPC1;	// 通用计数器 -- general proposal counter
	reg		[31:0]	GPC2;	// 通用计数器 -- general proposal counter
	reg		[31:0]	GPC3;	// 通用计数器 -- general proposal counter
	reg		[31:0]	GPC4;	// 通用计数器 -- general proposal counter
	reg		[31:0]	GPC5;	// 通用计数器 -- general proposal counter
	parameter		IDLE = 0;	// 空闲状态
	parameter		ExADD = 1;	// 执行加法
	parameter		ExADDi = 2;	// 执行立即数加法
	parameter		ExSUB = 3;	// 执行减法
	parameter		ExSUBi = 4;	// 执行立即数减法
	parameter		ExMulti = 5;	// 执行立即数乘法
	parameter		ExMult = 6;	// 执行矩阵乘法
	parameter		ExDOT = 7;	// 执行矩阵点乘运算
	parameter		ExConv = 8;	// 执行卷机操作
	parameter		ExPool = 9;	// 执行池化pooling操作
	parameter		ExReLU = 11;	// 执行ReLU激活函数
	parameter		ExSigmoid = 10;	// 执行sigmoid激活函数
	parameter		ExTanh = 12;	// 执行tanh激活函数
	parameter		ExTran = 14;	// 执行矩阵转置函数
	parameter		ExGray = 13;	// 执行灰度图转换函数
	parameter		ExADDs = 15;	// 执行矩阵+标量的函数
	parameter		ExSUBs = 16;	// 执行矩阵-标量的函数
	always @(posedge clk)
		if(!rst_n)
			reset_system_task;
		else
		begin
			case(cstate)
				// 闲置状态
				IDLE: begin
					idle_task;
				end
				
				// 加法
				ExADD: begin
					ex_add_sub_task;
				end
				
				// 减法
				ExSUB: begin
					ex_add_sub_task;
				end
				
				// 加上立即数
				ExADDi: begin
					ex_add_sub_imm_task;
				end
				
				// 减去立即数
				ExSUBi: begin
					ex_add_sub_imm_task;
				end
				
				// 执行ReLU激活函数
				ExReLU: begin
					ex_add_sub_imm_task;	// 可以参照立即数加减算法
				end
				
				
				// 执行sigmoid激活函数
				ExSigmoid: begin
					ex_add_sub_imm_task;	// 可以参照立即数加减算法
				end
				
				
				// 执行tanh激活函数
				ExTanh: begin
					ex_add_sub_imm_task;	// 可以参照立即数加减算法
				end
				
				// 执行矩阵点乘运算
				ExDOT: begin
					ex_add_sub_task;	// 可以参考加减法的运算
				end
				
				// 执行立即数乘法
				ExMulti: begin
					ex_add_sub_imm_task;	// 可以参照立即数加减算法
				end
				
				// 执行矩阵2-D卷积运算(注意是3x3的valid卷积！)
				ExConv: begin
					ex_conv_task;	// 执行卷积操作
				end
				
				// 执行矩阵的pooling池化运算（注意是2x2的pooling）
				ExPool: begin
					ex_pool_task;	// 执行pooling池化操作
				end
				
				// 执行矩阵乘法运算
				ExMult: begin
					ex_mult_task;	// 执行矩阵的乘法运算
				end
				
				// 执行矩阵转置函数
				ExTran: begin
					ex_tran_task;	// 执行转置
				end
				
				// 执行RGB565转换成灰度图的运算
				ExGray: begin
					ex_add_sub_imm_task;	// 可以参照立即数加减算法
				end
					
				// 执行矩阵±标量的函数
				ExADDs: begin
					ex_add_sub_scalar_task;	//
				end
				
				// 执行矩阵-标量的函数
				ExSUBs: begin
					ex_add_sub_scalar_task;	//
				end
				
				//
				default: begin
					reset_system_task;
				end
			endcase
			
		end
////////////////////////////////////////////////
// 执行各种操作
	// 激活函数 的计算
	wire		[31:0]			ddr_read_data_rho;	// 经过激活函数的变换
	reg			[127:0]			ddr_read_data_valid_shifter;	// 需要较大的寄存器链
	// 2018-04-05: 查出来一个bug，如果不在接收到cnn_inst_shifter的时候将ddr_read_data_valid_shifter复位，可能会有问题！
	always @(posedge clk)
		if(cnn_inst_en)
			ddr_read_data_valid_shifter <= 0;
		else
			ddr_read_data_valid_shifter <= {ddr_read_data_valid_shifter[126:0], ddr_read_data_valid};
	// 例化激活函数的计算器
	int_cordic_tanh_sigm_rtl	int_cordic_tanh_sigm_rtl_inst(
									.sys_clk(clk),
									.sys_rst_n(rst_n),
									.src_x(ddr_read_data),
									.rho(ddr_read_data_rho),
									.algorithm({(OP==TANH), (OP==SIGM)})
								);

	wire	signed	[31:0]		dot_a = (cstate==ExMulti)? IMM : cnn_scfifo_256pts_Dollar1_q;
	wire	signed	[31:0]		dot_b = ddr_read_data;
	wire	signed	[63:0]		dot_c = dot_a * dot_b;
	// 路由联通
	//////////////////////////////////////////////////////////////////////////////////
	// 首先是要缓存矩阵乘法中，$1的一行向量
	wire	[31:0]		cnn_ram_256pts_inst_4_q;
	wire				cnn_ram_256pts_inst_4_wren;
	wire	[31:0]		cnn_ram_256pts_inst_4_data;
	reg		[7:0]		cnn_ram_256pts_inst_4_wraddress;
	reg		[7:0]		cnn_ram_256pts_inst_4_rdaddress;
	cnn_ram_256pts		cnn_ram_456pts_inst_4(
							.clock(clk),
							.data(cnn_ram_256pts_inst_4_data),
							.rdaddress(cnn_ram_256pts_inst_4_rdaddress),
							.wraddress(cnn_ram_256pts_inst_4_wraddress),
							.wren(cnn_ram_256pts_inst_4_wren),
							.q(cnn_ram_256pts_inst_4_q)
						);
	// 将$1里面的一行数据写入到RAM进行缓存
	always @(posedge clk)
		if(cstate==ExMult && substate==0)
			cnn_ram_256pts_inst_4_wraddress <= 0;
		else if(cstate==ExMult && substate<=2 && ddr_read_data_valid)
			cnn_ram_256pts_inst_4_wraddress <= cnn_ram_256pts_inst_4_wraddress + 1;	// 地址加1
	
	assign	cnn_ram_256pts_inst_4_wren = (cstate==ExMult && substate<=2 && ddr_read_data_valid);
	assign	cnn_ram_256pts_inst_4_data = ddr_read_data;
	
	// 然后是向量的MAC操作
	always @(posedge clk)
		if(cstate==ExMult && substate<=2)
			cnn_ram_256pts_inst_4_rdaddress <= 0;
		else if(cstate==ExMult && substate>=3)
		begin
			if(ddr_read_data_valid)
				if(cnn_ram_256pts_inst_4_rdaddress>=(N-1))
					cnn_ram_256pts_inst_4_rdaddress <= 0;
				else
					cnn_ram_256pts_inst_4_rdaddress <= cnn_ram_256pts_inst_4_rdaddress + 1;
		end
		
	// 需要将ddr_read_data打两排
	reg		[31:0]		ddr_read_data_prev	[0:5];
	integer		l;
	always @(posedge clk)
	begin
		for(l=0; l<5; l=l+1)
			ddr_read_data_prev[l+1] <= ddr_read_data_prev[l];
		ddr_read_data_prev[0] <= ddr_read_data;
	end
	
	// 计算现在MAC有多少元素了
	reg		[31:0]				vec_mac_elem_cnt;
	always @(posedge clk)
		if(cstate==ExMult && (substate<=2 || substate==8))
			vec_mac_elem_cnt <= 0;
		else if(ddr_read_data_valid_shifter[1])
			vec_mac_elem_cnt <= (vec_mac_elem_cnt>=(N-1))? 0 : vec_mac_elem_cnt + 1;
			
	// 然后是MAC操作，实现向量乘法
	// 2018-03-09：查出bug，发现是因为MAC操作少加了一组！
	wire	signed		[31:0]	vec_mac_a = ddr_read_data_prev[1];
	wire	signed		[31:0]	vec_mac_b = cnn_ram_256pts_inst_4_q;
	wire	signed		[63:0]	vec_mac_c = vec_mac_a*vec_mac_b;
	reg		signed		[31:0]	vec_mac_result;
	reg							vec_mac_result_en;
	always @(posedge clk)
		if(cstate==ExMult && (substate<=2 || substate==8))
			vec_mac_result <= 0;
		else if(ddr_read_data_valid_shifter[1] && vec_mac_elem_cnt>0)
			vec_mac_result <= vec_mac_result + vec_mac_c[DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH];
		else if(ddr_read_data_valid_shifter[1] && vec_mac_elem_cnt==0)
			vec_mac_result <= vec_mac_c[DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH];
	
	always @(posedge clk)
		vec_mac_result_en <= (cstate==ExMult && substate>=3 && substate<8) && (ddr_read_data_valid_shifter[1] && vec_mac_elem_cnt==(N-1));
	
	// 然后是要实现CONV卷积和Pool池化操作需要的RAM
	// 然后需要RAM来缓存上一行的数据
	wire	[31:0]		cnn_ram_256pts_inst_0_q;
	wire				cnn_ram_256pts_inst_0_wren;
	wire	[31:0]		cnn_ram_256pts_inst_0_data;
	wire	[7:0]		cnn_ram_256pts_inst_0_wraddress;
	wire	[7:0]		cnn_ram_256pts_inst_0_rdaddress;
	wire	[31:0]		cnn_ram_256pts_inst_1_q;
	wire				cnn_ram_256pts_inst_1_wren;
	wire	[31:0]		cnn_ram_256pts_inst_1_data;
	wire	[7:0]		cnn_ram_256pts_inst_1_wraddress;
	wire	[7:0]		cnn_ram_256pts_inst_1_rdaddress;
	wire	[31:0]		cnn_ram_256pts_inst_2_q;
	wire				cnn_ram_256pts_inst_2_wren;
	wire	[31:0]		cnn_ram_256pts_inst_2_data;
	wire	[7:0]		cnn_ram_256pts_inst_2_wraddress;
	wire	[7:0]		cnn_ram_256pts_inst_2_rdaddress;
	cnn_ram_256pts		cnn_ram_256pts_inst_0(
							.clock(clk),
							.data(cnn_ram_256pts_inst_0_data),
							.rdaddress(cnn_ram_256pts_inst_0_rdaddress),
							.wraddress(cnn_ram_256pts_inst_0_wraddress),
							.wren(cnn_ram_256pts_inst_0_wren),
							.q(cnn_ram_256pts_inst_0_q)
						);
	cnn_ram_256pts		cnn_ram_256pts_inst_1(
							.clock(clk),
							.data(cnn_ram_256pts_inst_1_data),
							.rdaddress(cnn_ram_256pts_inst_1_rdaddress),
							.wraddress(cnn_ram_256pts_inst_1_wraddress),
							.wren(cnn_ram_256pts_inst_1_wren),
							.q(cnn_ram_256pts_inst_1_q)
						);
	cnn_ram_256pts		cnn_ram_256pts_inst_2(
							.clock(clk),
							.data(cnn_ram_256pts_inst_2_data),
							.rdaddress(cnn_ram_256pts_inst_2_rdaddress),
							.wraddress(cnn_ram_256pts_inst_2_wraddress),
							.wren(cnn_ram_256pts_inst_2_wren),
							.q(cnn_ram_256pts_inst_2_q)
						);
	//
	
	reg		[5:0]		taps_cnt;	// 用来指示现在那个ram是最新的数据
	reg		[7:0]		pixs_cnt;	// 水平方向上的坐标
	always @(posedge clk)
		if(!((cstate==ExConv && substate>=2 && substate<7) || (cstate==ExPool)))
		begin
			taps_cnt <= 0;
			pixs_cnt <= 0;
		end
		else if(ddr_read_data_valid)
		begin
			pixs_cnt <= (pixs_cnt>=(N-1))? 0 : (pixs_cnt+1);	// 循环记录
			if(pixs_cnt>=(N-1))
			begin
				if((cstate==ExConv))
				begin
					if(taps_cnt>=(Km-1))
						taps_cnt <= 0;
					else
						taps_cnt <= taps_cnt + 1;
				end
				else if((cstate==ExPool))
				begin
					if(taps_cnt>=(Pm-1))
						taps_cnt <= 0;
					else
						taps_cnt <= taps_cnt + 1;
				end
			end
		end
	assign				cnn_ram_256pts_inst_0_data = ddr_read_data;
	assign				cnn_ram_256pts_inst_0_wraddress = pixs_cnt;
	assign				cnn_ram_256pts_inst_0_rdaddress = (pixs_cnt==0)? (N-1) : (pixs_cnt-1);	// 这里用的很精髓！可以获取刚刚才写入的像素数据
	assign				cnn_ram_256pts_inst_0_wren = (taps_cnt==0) && ddr_read_data_valid;
	assign				cnn_ram_256pts_inst_1_data = ddr_read_data;
	assign				cnn_ram_256pts_inst_1_wraddress = pixs_cnt;
	assign				cnn_ram_256pts_inst_1_rdaddress = (pixs_cnt==0)? (N-1) : (pixs_cnt-1);
	assign				cnn_ram_256pts_inst_1_wren = (taps_cnt==1) && ddr_read_data_valid;
	assign				cnn_ram_256pts_inst_2_data = ddr_read_data;
	assign				cnn_ram_256pts_inst_2_wraddress = pixs_cnt;
	assign				cnn_ram_256pts_inst_2_rdaddress = (pixs_cnt==0)? (N-1) : (pixs_cnt-1);
	assign				cnn_ram_256pts_inst_2_wren = (taps_cnt==2) && ddr_read_data_valid;
	
	// 然后是卷积窗口的运算（MAC，使用加法树来优化时序）
	// 这里的参数被写死也是不太好的！但是想不到更好的方法了，RAM已经代替了shift register有更好的性能了
	reg		signed		[31:0]		cnn_conv_kernel	[0:8];	// 卷积核的参数
	reg		signed		[31:0]		cnn_conv_data	[0:8];	// 卷积窗口里面的数据
	reg		signed		[63:0]		cnn_conv_mult	[0:8];	// 卷积窗口内的数据和卷积核的乘积，使用加法树
	reg		signed		[31:0]		cnn_conv_sum_p	[0:2];	// 加法树
	reg		signed		[31:0]		cnn_conv_sum;			// 卷积的结果
	// 下面是pooling的池化操作
	reg		signed		[31:0]		cnn_pool_data	[0:3];	// 池化窗口；里面的数据
	reg		signed		[31:0]		cnn_pool_shad	[0:3];	// 池化窗口；里面的数据（重复一个clock
	reg		signed		[31:0]		cnn_pool_max_p	[0:1];	// 最大值
	reg		signed		[31:0]		cnn_pool_avr_p	[0:1];	// 平均值
	reg		signed		[31:0]		cnn_pool_out;	// pooling的输出
	/*  [ 0 1 2 ]
		[ 3 4 5 ]
		[ 6 7 8 ]
	*/
	// taps_cnt一定要多打两排！
	reg		[5:0]	taps_cnt_prev	[0:5];
	integer			m;
	always @(posedge clk)
	begin
		for(m=0; m<5; m=m+1)	
			taps_cnt_prev[m+1] <= taps_cnt_prev[m];
		taps_cnt_prev[0] <= taps_cnt;
	end
	// 首先需要构造卷积窗口
	always @(posedge clk)
		if(ddr_read_data_valid_shifter[2])	// 观察，RAM的addr->q需要两个clock的拍数
		begin
			cnn_conv_data[0] <= cnn_conv_data[1];
			cnn_conv_data[1] <= cnn_conv_data[2];
			cnn_conv_data[3] <= cnn_conv_data[4];
			cnn_conv_data[4] <= cnn_conv_data[5];
			cnn_conv_data[6] <= cnn_conv_data[7];
			cnn_conv_data[7] <= cnn_conv_data[8];
			case(taps_cnt_prev[2])
				2: begin
					cnn_conv_data[2] <= cnn_ram_256pts_inst_0_q;
					cnn_conv_data[5] <= cnn_ram_256pts_inst_1_q;
					cnn_conv_data[8] <= cnn_ram_256pts_inst_2_q;
				end
				
				0: begin
					cnn_conv_data[2] <= cnn_ram_256pts_inst_1_q;
					cnn_conv_data[5] <= cnn_ram_256pts_inst_2_q;
					cnn_conv_data[8] <= cnn_ram_256pts_inst_0_q;
				end
				
				1: begin
					cnn_conv_data[2] <= cnn_ram_256pts_inst_2_q;
					cnn_conv_data[5] <= cnn_ram_256pts_inst_0_q;
					cnn_conv_data[8] <= cnn_ram_256pts_inst_1_q;
				end
			endcase
			//
			// 然后是池化操作的数据
			cnn_pool_data[0] <= cnn_pool_data[1];
			cnn_pool_data[2] <= cnn_pool_data[3];
			case(taps_cnt_prev[2])
				1: begin
					cnn_pool_data[1] <= cnn_ram_256pts_inst_0_q;
					cnn_pool_data[3] <= cnn_ram_256pts_inst_1_q;
				end
				0: begin
					cnn_pool_data[1] <= cnn_ram_256pts_inst_1_q;
					cnn_pool_data[3] <= cnn_ram_256pts_inst_0_q;
				end
			endcase
		end
	
	// 然后是乘法器数据输出
	integer		p;
	always @(posedge clk)
	begin
		for(p=0; p<9; p=p+1)
			cnn_conv_mult[p] <= (cnn_conv_data[p]*cnn_conv_kernel[8-p]);
		for(p=0; p<4; p=p+1)
			cnn_pool_shad[p] <= cnn_pool_data[p];
	end
	// 然后是加法树
	always @(posedge clk)
	begin
		cnn_conv_sum_p[0] <= cnn_conv_mult[0][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH] + cnn_conv_mult[1][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH] + cnn_conv_mult[2][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH];
		cnn_conv_sum_p[1] <= cnn_conv_mult[3][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH] + cnn_conv_mult[4][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH] + cnn_conv_mult[5][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH];
		cnn_conv_sum_p[2] <= cnn_conv_mult[6][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH] + cnn_conv_mult[7][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH] + cnn_conv_mult[8][DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH];
		// 加法树加起来
		cnn_conv_sum <= cnn_conv_sum_p[0] + cnn_conv_sum_p[1] + cnn_conv_sum_p[2];
		//
		// 池化操作
		cnn_pool_avr_p[0] <= (cnn_pool_shad[0] + cnn_pool_shad[1])>>>1;
		cnn_pool_avr_p[1] <= (cnn_pool_shad[2] + cnn_pool_shad[3])>>>1;
		cnn_pool_max_p[0] <= (cnn_pool_shad[0]>cnn_pool_shad[1])? cnn_pool_shad[0] : cnn_pool_shad[1];
		cnn_pool_max_p[1] <= (cnn_pool_shad[2]>cnn_pool_shad[3])? cnn_pool_shad[2] : cnn_pool_shad[3];
		// 汇总
		cnn_pool_out <= (MODE==0)? ((cnn_pool_avr_p[0]+cnn_pool_avr_p[1])>>>1) : 
						(cnn_pool_max_p[0]>cnn_pool_max_p[1])? cnn_pool_max_p[0] : cnn_pool_max_p[1];
	end
	// 
	// 另外，需要屏蔽掉最开始的Kn-1个数据
	// 还要屏蔽掉队开始的Km-1行数据
	reg					[31:0]		cnn_conv_sum_pix_cnt;	// 需要有一个计数器
	reg					[31:0]		cnn_conv_sum_tap_cnt;	// 需要有一个计数器
	always @(posedge clk)
		if(!((cstate==ExConv && substate>=2 && substate<7) || (cstate==ExPool)))	// 这里的substate==7是中途查出来的，主要是kernel读取后需要有个延时
		begin
			cnn_conv_sum_pix_cnt <= 0;
			cnn_conv_sum_tap_cnt <= 0;
		end
		else if(ddr_read_data_valid_shifter[6])
		begin
			cnn_conv_sum_pix_cnt <= (cnn_conv_sum_pix_cnt>=N-1)? 0 : (cnn_conv_sum_pix_cnt+1);	// 统计卷及有效数值的个数
			if(cnn_conv_sum_pix_cnt>=N-1)
				cnn_conv_sum_tap_cnt <= cnn_conv_sum_tap_cnt + 1;
		end
		
	// 补充： 灰度图转换操作
	reg		[7:0]	RGB888_R;
	reg		[7:0]	RGB888_G;
	reg		[7:0]	RGB888_B;
	always @(posedge clk)
	begin
		RGB888_R <= {ddr_read_data[15:11], 3'B000};
		RGB888_G <= {ddr_read_data[10:5], 2'B00};
		RGB888_B <= {ddr_read_data[4:0], 3'B000};
	end
	// RGB to YUV
	reg		[16:0]	YUV422_Y_reg;// = 66*RGB888_R + 129 * RGB888_G + 25*RGB888_B;
	reg		[16:0]	YUV422_Cb_reg;// = -38*RGB888_R - 74*RGB888_G + 112*RGB888_B;
	reg		[16:0]	YUV422_Cr_reg;// = 112*RGB888_R - 94*RGB888_G - 18*RGB888_B;
	// set_multicycle_path -- 理论上，两个时钟计算一次即可
	// 不过，在芯片 5CSEBA6U23I7 上面，似乎不必太在意，因为65MHz时钟比较慢(Fmax=81.63MHz)
	// 或者可以打一拍看看，将MAC运算拆分为 * / + 两步进行 ==> 171.79MHz
	reg		[16:0]	RGB888_R_66;
	reg		[16:0]	RGB888_R_38;
	reg		[16:0]	RGB888_R_112;
	reg		[16:0]	RGB888_G_129;
	reg		[16:0]	RGB888_G_74;
	reg		[16:0]	RGB888_G_94;
	reg		[16:0]	RGB888_B_25;
	reg		[16:0]	RGB888_B_112;
	reg		[16:0]	RGB888_B_18;
	reg		[8:0]	YUV422_Y;
	reg		[8:0]	YUV422_Cb;
	reg		[8:0]	YUV422_Cr;
	always @(posedge clk)
	begin
		RGB888_R_66 <= 9'D66*RGB888_R;
		RGB888_R_38 <= 9'D38*RGB888_R;
		RGB888_R_112 <= 9'D112*RGB888_R;
		RGB888_G_129 <= 9'D129*RGB888_G;
		RGB888_G_74 <= 9'D74*RGB888_G;
		RGB888_G_94 <= 9'D94*RGB888_G;
		RGB888_B_25 <= 9'D25*RGB888_B;
		RGB888_B_112 <= 9'D112*RGB888_B;
		RGB888_B_18 <= 9'D18*RGB888_B;
		
		YUV422_Y_reg <= RGB888_R_66 + RGB888_G_129 + RGB888_B_25;
		YUV422_Cb_reg <= - RGB888_R_38 - RGB888_G_74 + RGB888_B_112;
		YUV422_Cr_reg <= RGB888_R_112 - RGB888_G_94 - RGB888_B_18;
		
		// 加上偏移量
		YUV422_Y <= (YUV422_Y_reg>>>8) + 16;	// 16~235
		YUV422_Cb <= (YUV422_Cb_reg>>>8) + 128;	// 16~240
		YUV422_Cr <= (YUV422_Cr_reg>>>8) + 128;	// 16~240
			
	end
	
	wire	[7:0]	YUV422_Y_valid = (YUV422_Y<16)? 16 : (YUV422_Y>235)? 235 : YUV422_Y;
	wire	[7:0]	YUV422_Cb_valid = (YUV422_Cb<16)? 16 : (YUV422_Cb>240)? 240 : YUV422_Cb;
	wire	[7:0]	YUV422_Cr_valid = (YUV422_Cr<16)? 16 : (YUV422_Cr>240)? 240 : YUV422_Cr;
	
	
	/////////// 输出的FIFO操作
	assign			cnn_scfifo_256pts_Dollar1_data = ddr_read_data;
	assign			cnn_scfifo_256pts_Dollar1_wrreq = ddr_read_data_valid && 
														(	(cstate==ExADD && substate<=2) ||
															(cstate==ExSUB && substate<=2) ||
															(cstate==ExDOT && substate<=2) 
														);
	assign			cnn_scfifo_256pts_Dollar1_rdreq = ddr_read_data_valid && 
														(	(cstate==ExADD && substate>=3) ||
															(cstate==ExSUB && substate>=3) ||
															(cstate==ExDOT && substate>=3)
														);
	assign			cnn_scfifo_256pts_Dollar3_data = 	(cstate==ExADD)? (cnn_scfifo_256pts_Dollar1_q + ddr_read_data) : 
														(cstate==ExSUB)? (cnn_scfifo_256pts_Dollar1_q - ddr_read_data) : 
														(cstate==ExDOT)? (dot_c[DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH]) : 
														(cstate==ExADDi)? (ddr_read_data + IMM) : 
														(cstate==ExSUBi)? (ddr_read_data - IMM) : 
														(cstate==ExADDs)? (ddr_read_data + SCALAR) : 
														(cstate==ExSUBs)? (ddr_read_data - SCALAR) : 
														(cstate==ExMult)? vec_mac_result : 
														(cstate==ExConv)? cnn_conv_sum : 
														(cstate==ExPool)? cnn_pool_out : 
														(cstate==ExTran)? ddr_read_data : 
														(cstate==ExGray)? ({{DATA_WIDTH{1'B0}}, YUV422_Y_valid, {FRAC_WIDTH{1'B0}}}) : 
														(cstate==ExMulti)? (dot_c[DATA_WIDTH+FRAC_WIDTH-1:FRAC_WIDTH]) : 
														(cstate==ExReLU)? (ddr_read_data[31]? 32'H0000_0000 : ddr_read_data) : 
														(cstate==ExSigmoid)? ddr_read_data_rho : 
														(cstate==ExTanh)? ddr_read_data_rho : 
														32'H0000_0000;
	assign			cnn_scfifo_256pts_Dollar3_wrreq = 	(
															ddr_read_data_valid && 
															(	(cstate==ExADD && substate>=3) ||
																(cstate==ExSUB && substate>=3) ||
																(cstate==ExDOT && substate>=3) ||
																(cstate==ExSUBi) || 
																(cstate==ExADDi) ||
																(cstate==ExMulti) ||
																(cstate==ExTran) ||
																(cstate==ExReLU) ||
																(cstate==ExADDs && substate<3) ||
																(cstate==ExSUBs && substate<3)
															)
														) ||
														(
															ddr_read_data_valid_shifter[28] && 
															(	(cstate==ExSigmoid) ||
																(cstate==ExTanh) 
															)
														) ||
														(
															ddr_read_data_valid_shifter[6] && 
															(	(cstate==ExConv && substate>=3 && cnn_conv_sum_pix_cnt>=(Kn-1) && cnn_conv_sum_tap_cnt>=(Km-1)) ||
																(cstate==ExPool && cnn_conv_sum_pix_cnt[0] && cnn_conv_sum_tap_cnt[0])
															)
														) ||
														(
															ddr_read_data_valid_shifter[2] && 
															(	cstate==ExMult && vec_mac_result_en
															)
														) ||
														(
															ddr_read_data_valid_shifter[3] && 
															(	cstate==ExGray	 	
															)
														);
														
														
	
////////////////////////
// 各种gtak
// 首先	是系统复位的task
task reset_system_task;
begin
	cstate <= IDLE;
	substate <= 0;	// 为了让指令执行更加正确，需要在外部FSM里面嵌入子FSM
	cnn_inst_ready <= 1;	// 可以接受指令
	// 撤销DDR读取使能信号
	ddr_read_req <= 0;
	// 撤销DDR写入信号
	//ddr_write_req <= 0;
	// $1/$2/$3三个FIFO的读取信号
	//cnn_scfifo_256pts_Dollar3_rdreq <= 0;
end
endtask

// 空闲状态下的task
task idle_task;
begin
	// 根据指令的OP字段选择跳转逻辑
	if(OP_EN[0])
	begin
		case(OP)
			ADD: begin
				cstate <= ExADD;	//	 执行加法操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			SUB: begin
				cstate <= ExSUB;	//	 执行减法操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			ADDi: begin
				cstate <= ExADDi;	//	 执行立即数加法操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			SUBi: begin
				cstate <= ExSUBi;	//	 执行立即数减法操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			RELU: begin
				cstate <= ExReLU;	//	 执行RELU操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			SIGM: begin
				cstate <= ExSigmoid;	//	 执行sigmoid操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			TANH: begin
				cstate <= ExTanh;	//	 执行tanh操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			DOT: begin
				cstate <= ExDOT;	//	 执行矩阵点乘操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			MULTi: begin
				cstate <= ExMulti;	//	 执行矩阵立即数乘法操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			CONV: begin
				cstate <= ExConv;	//	 执行矩阵2D valid卷积操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			POOL: begin
				cstate <= ExPool;	//	 执行矩阵2D valid卷积操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
				
			MULT: begin
				cstate <= ExMult;	//	 执行矩阵乘法操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
				
			TRAN: begin
				cstate <= ExTran;	//	 执行矩阵转置操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			GRAY: begin
				cstate <= ExGray;	//	 执行RGB565/灰度图转换操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			ADDs: begin
				cstate <= ExADDs;	//	 执行矩阵+标量操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			SUBs: begin
				cstate <= ExSUBs;	//	 执行矩阵-标量操作
				substate <= 0;
				GPC0 <= 0;
				GPC1 <= 0;
				cnn_inst_ready <= 0;	// not ready了
			end
			
			default: begin
				reset_system_task;
			end
		
		endcase
	end
end
endtask

// 执行加/减法操作
task ex_add_sub_task;
begin
	case(substate)
		0: begin
			// 如果完成了ADD， 那么跳出
			if(GPC0>=M)
				reset_system_task;
			// 否则就要每行每行的执行
			else
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 1;
				ddr_read_addr <= Dollar1 + (GPC0*N);	// 生成$1的读取地址
				ddr_read_req <= 1;
			end
		end
		
		1: begin
			// 如果$1的一行数据读取完成，就要开始读取$2
			if(GPC1>=(N-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				substate <= 2;
				ddr_read_req <= 0;	// 撤销DDR读取指令
			end
			// 否则就是要继续读取$1的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + 1;
					ddr_read_req <= 1;
				end
			end
		end
		
		// 等待$1-fifo里面有满满一行的数据
		2: begin
			if(cnn_scfifo_256pts_Dollar1_rdusedw>=N)
			begin
				substate <= 3;
				ddr_read_addr <= Dollar2 + (GPC0*N);	// 生成$2的读取地址
				ddr_read_req <= 1;
			end
		end
		
		// 实现$2的一行数据读取
		3: begin
			if(GPC1>=(N-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 4;
				ddr_read_req <= 0;	// 撤销DDR读取指令
				// 生成DDR回写地址
				//ddr_write_addr <= Dollar3 + (GPC0*N);	// $3的回写地址
			end
			// 否则就是要继续读取$2的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + 1;
					ddr_read_req <= 1;
				end
			end
		end
		
		// 回写$3的数据，将N列的数据全部写入即可
		4: begin
			if(ddr_write_data_valid && ddr_write_col>=(N-1))
			begin
				substate <= 0;
				GPC0 <= GPC0 + 1;
				GPC1 <= 0;
				GPC2 <= 0;
			end
		end
		
		// 
		default: begin
			reset_system_task;
		end
	endcase
end
endtask

// 执行立即数加减法操作
task ex_add_sub_imm_task;
begin
	case(substate)
		0: begin
			// 如果完成了ADD， 那么跳出
			if(GPC0>=M)
				reset_system_task;
			// 否则就要每行每行的执行
			else
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 1;
				ddr_read_addr <= Dollar1 + (GPC0*N);	// 生成$1的读取地址
				ddr_read_req <= 1;
			end
		end
		
		1: begin
			// 如果$1的一行数据读取完成，就要开始输出$3
			if(GPC1>=(N-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				substate <= 2;
				ddr_read_req <= 0;	// 撤销DDR读取指令
				// 生成DDR回写地址
				//ddr_write_addr <= Dollar3 + (GPC0*N);	// $3的回写地址
			end
			// 否则就是要继续读取$1的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + 1;
					ddr_read_req <= 1;
				end
			end
		end
		
		
		// 回写$3的数据，将N列的数据全部写入即可
		2: begin
			if(ddr_write_data_valid && ddr_write_col>=(N-1))
			begin
				substate <= 0;
				GPC0 <= GPC0 + 1;
				GPC1 <= 0;
				GPC2 <= 0;
			end
		end
		
		// 
		default: begin
			reset_system_task;
		end
	endcase
end
endtask

////////////////////////////////////////////
// 2D-valid卷积操作
task ex_conv_task;
begin
	case(substate)
		// 首先读取卷积核
		0: begin
			// 如果读取完成，就要开始图像的读取 & 卷积
			if(GPC0>=(Km*Kn))
			begin
				GPC0 <= 0; 
				substate <= 7;
				delay <= 0;
				ddr_read_req <= 0;
			end
			// 否则就要持续度去卷积核
			else
			begin
				substate <= 1;
				ddr_read_addr <= Dollar2 + GPC0;	// 生成$2（卷积核参数）的读取地址
				ddr_read_req <= 1;
			end
		end
		
		1: begin
			if(ddr_read_ready)
				ddr_read_req <= 0;
			if(ddr_read_data_valid)
			begin
				GPC0 <= GPC0 + 1;
				substate <= 0;		// 回到0状态，要在发动一次kernel读取
				cnn_conv_kernel[GPC0] <= ddr_read_data;
			end
		end
		
		// 注意，这里需要延时一会儿！
		// 因为后面的卷积计算的时候参考了rdata_valid[6]，所以一定要有delay一下才行！
		7: begin
			if(delay>=8)
				substate <= 2;
			else
				delay <= delay + 1;
		end
		
		
		// 开始读取图像
		2: begin
			// 如果完成了卷积计算， 那么跳出
			if(GPC0>=M)
				reset_system_task;
			// 否则就要每行每行的执行
			else
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 3;
				ddr_read_addr <= Dollar1 + (GPC0*N);	// 生成$1的读取地址
				ddr_read_req <= 1;
			end
		end
		
		3: begin
			// 如果$1的Km行数据读取完成，就要开始输出$3
			// 而且已经读了Km行了
			if(GPC1>=(N-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				GPC0 <= GPC0 + 1;	// 读取行加1
				ddr_read_addr <= ddr_read_addr + 1;	//  读取地址加1
				if(GPC0>=(Km-1))
				begin
					substate <= 4;
					ddr_read_req <= 0;	// 撤销DDR读取指令
					// 生成DDR回写地址
					//ddr_write_addr <= Dollar3 + ((GPC0-Km+1)*(N-Kn+1));	// $3的回写地址
					GPC2 <= 0;	// GPC2置零
				end
			end
			// 否则就是要继续读取$1的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + 1;
					ddr_read_req <= 1;
				end
			end
		end
		
		
		// 回写$3的数据，将N列的数据全部写入即可
		4: begin
			if(ddr_write_data_valid && ddr_write_col>=(N-Kn))
			begin
				substate <= 2;
				GPC1 <= 0;
				GPC2 <= 0;
			end
		end
		
		// 
		default: begin
			reset_system_task;
		end
	endcase
	
	
end
endtask

///////////////////////////////////////////////
// 池化操作
task ex_pool_task;
begin
	case(substate)
		// 开始读取图像
		0: begin
			// 如果完成了卷积计算， 那么跳出
			if(GPC0>={M>>>1, 1'B0})
				reset_system_task;
			// 否则就要每行每行的执行
			else
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 1;
				ddr_read_addr <= Dollar1 + (GPC0*N);	// 生成$1的读取地址
				ddr_read_req <= 1;
			end
		end
		
		1: begin
			// 如果$1的行数据读取完成，就要开始输出$3
			if(GPC1>=(N-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				GPC0 <= GPC0 + 1;	// 读取行加1
				ddr_read_addr <= ddr_read_addr + 1;	//  读取地址加1
				if(GPC0[0])	// 因为 是2x2的pooling操作，所以可以直接看[0]最低位的H/L电平
				begin
					substate <= 2;
					ddr_read_req <= 0;	// 撤销DDR读取指令
					// 生成DDR回写地址
					//ddr_write_addr <= Dollar3 + ((GPC0>>>1)*(N>>>1));	// $3的回写地址
					GPC2 <= 0;	// GPC2置零
				end
			end
			// 否则就是要继续读取$1的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + 1;
					ddr_read_req <= 1;
				end
			end
		end
		
		// 回写$3的数据，将N列的数据全部写入即可
		2: begin
			if(ddr_write_data_valid && ddr_write_col>=((N>>>1)-1))
			begin
				substate <= 0;
				GPC1 <= 0;
				GPC2 <= 0;
			end
		end
		// 
		default: begin
			reset_system_task;
		end
	endcase
	

end
endtask

///////////////////////////////////////////////////////////////
// 矩阵乘法运算
task ex_mult_task;
begin
	case(substate)
		0: begin
			// 如果完成了MULT， 那么跳出
			if(GPC0>=M)
				reset_system_task;
			// 否则就要每行每行的执行
			else
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 1;
				ddr_read_addr <= Dollar1 + (GPC0*N);	// 生成$1的读取地址
				ddr_read_req <= 1;
			end
		end
		
		1: begin
			// 如果$1的一行数据读取完成，就要开始读取$2
			if(GPC1>=(N-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				substate <= 2;
				delay <= 0;
				ddr_read_req <= 0;	// 撤销DDR读取指令
			end
			// 否则就是要继续读取$1的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + 1;
					ddr_read_req <= 1;
				end
			end
		end
		
		// 等待$1-fifo里面有满满一行的数据
		2: begin
			if(cnn_ram_256pts_inst_4_wraddress>=N)
			begin
				//  开始循环读取$2的每一列数据(进入8状态，进行短暂的停顿，为了防止出现bug)
				substate <= 8;
				delay <= 0;
				GPC2 <= 0;
				ddr_read_req <= 0;
			end
		end
		
		//
		8: begin
			if(delay>=5)
				substate <= 3;
			else
				delay <= delay + 1;
		end
		
		// 读取$2的每一列数据
		3: begin
			if(GPC2>=P)
			begin
				substate <= 5;		// 如果每一列都读取完毕，那么就要开始C行向量传输
				GPC0 <= GPC0 + 1;
				GPC4 <= 0;	// 用来统计发送的C向量长度
			end
			// 否则启动一列数据的读取
			else
			begin
				ddr_read_addr <= Dollar2 + GPC2;
				substate <= 4;
				GPC3 <= 0;
				ddr_read_req <= 1;
			end
		end
		
		// 持续读取
		4: begin
			if(ddr_read_ready)
			begin
				if(GPC3>=(N-1))
				begin
					substate <= 3;
					GPC2 <= GPC2 + 1;
					ddr_read_req <= 0;	// 这里关闭ddr读取使能很关键！
				end
				else
				begin
					GPC3 <= GPC3 + 1;
					ddr_read_addr <= ddr_read_addr + P;
					ddr_read_req <= 1;
				end
			end
		end
		
		// 回写$3的数据，将N列的数据全部写入即可
		5: begin
			if(ddr_write_data_valid && ddr_write_col>=(P-1))
			begin
				substate <= 0;
			end
		end
		
		// 
		default: begin
			reset_system_task;
		end
	endcase
end
endtask
////////////////////////////////////////////////////////////////////////////////////

// 执行矩阵转置操作
task ex_tran_task;
begin
	case(substate)
		0: begin
			// 如果完成了ADD， 那么跳出
			if(GPC0>=N)
				reset_system_task;
			// 否则就要每列每列的进行读取
			else
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 1;
				ddr_read_addr <= Dollar1 + GPC0;	// 生成$1的读取地址
				ddr_read_req <= 1;
			end
		end
		
		1: begin
			// 如果$1的一列数据读取完成，就要开始输出$3
			if(GPC1>=(M-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				substate <= 2;
				ddr_read_req <= 0;	// 撤销DDR读取指令
				// 生成DDR回写地址
				//ddr_write_addr <= Dollar3 + (GPC0);	// $3的回写地址
			end
			// 否则就是要继续读取$1的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + N;	// 因为读取的时候是按列读取的
					ddr_read_req <= 1;
				end
			end
		end
		
		
		// 回写$3的数据，将N列的数据全部写入即可（因为是转置，所以一定要注意！）
		2: begin
			if(ddr_write_data_valid && ddr_write_col>=(M-1))
			begin
				substate <= 0;
				GPC0 <= GPC0 + 1;
				GPC1 <= 0;
				GPC2 <= 0;
			end
		end
		// 
		default: begin
			reset_system_task;
		end
	endcase
end
endtask

// 执行矩阵和标量的加减法操作
task ex_add_sub_scalar_task;
begin
	case(substate)
		0: begin
			// 如果完成了ADD， 那么跳出
			if(GPC0>=M)
				reset_system_task;
			// 否则就要每行每行的执行
			else
			begin
				GPC1 <= 0;
				GPC2 <= 0;
				substate <= 3;
				ddr_read_addr <= Dollar2 ;	// 生成$2的读取地址
				ddr_read_req <= 1;
			end
		end
		// 等待$2的读取请求完成
		3: begin
			if(ddr_read_ready)
			begin
				ddr_read_req <= 0;
				substate <= 4;
			end
		end
		// 等待$2的数据读取出来
		4: begin
			if(ddr_read_data_valid)
			begin
				SCALAR <= ddr_read_data;	// 读取到的标量
				ddr_read_addr <= Dollar1 + (GPC0*N);	// 生成$1的读取地址
				ddr_read_req <= 1;
				substate <= 1;
			end
		end
		
		1: begin
			// 如果$1的一行数据读取完成，就要开始输出$3
			if(GPC1>=(N-1) && ddr_read_ready)
			begin
				GPC1 <= 0;
				substate <= 2;
				ddr_read_req <= 0;	// 撤销DDR读取指令
				// 生成DDR回写地址
				//ddr_write_addr <= Dollar3 + (GPC0*N);	// $3的回写地址
			end
			// 否则就是要继续读取$1的当前行
			else
			begin
				if(ddr_read_ready)
				begin
					GPC1 <= GPC1 + 1;
					ddr_read_addr <= ddr_read_addr + 1;
					ddr_read_req <= 1;
				end
			end
		end
		
		
		// 回写$3的数据，将N列的数据全部写入即可
		2: begin
			if(ddr_write_data_valid && ddr_write_col>=(N-1))
			begin
				substate <= 0;
				GPC0 <= GPC0 + 1;
				GPC1 <= 0;
				GPC2 <= 0;
			end
		end
		
		// 
		default: begin
			reset_system_task;
		end
	endcase

end
endtask

////////////////////////////////////////////////////////////////////////////////////

	reg		[31:0]		ddr_write_cnt;	// 统计DDR写入的次数
	always @(posedge clk)
		if(cnn_inst_ready)
			ddr_write_cnt <= 0;
		else if(ddr_write_req && ddr_write_ready)
			ddr_write_cnt <= ddr_write_cnt + 1;

	wire	signed	[31:0]	ddr_write_data_signed = ddr_write_data;
////////////////////////////////////////////////////////////////////////////////////
// 指令执行时间
	always @(posedge clk)
		if(cnn_inst_en)
			cnn_inst_time <= 0;
		else if(!cnn_inst_ready)
			cnn_inst_time <= cnn_inst_time + 1;
	
endmodule
	