`include "defines.v"

module csr(

	input	wire										clk,
	input wire										rst,
	
	
	input wire                    we_i,
	input wire[11:0]              waddr_i,
	input wire[11:0]              raddr_i,
	input wire[`RegBus]           data_i,
	
	input wire[31:0]              excepttype_i,
	input wire[`RegBus]           current_inst_addr_i,
	
	output reg[`RegBus]           data_o,
	output wire[`RegBus]				mstatus_o,
	output wire[`RegBus]				mepc_o,
	output wire[`RegBus]				mie_o,
	output wire[`RegBus]				mip_o,
	output wire[`RegBus]				mtvec_o,
	
	output reg[1:0]					curr_mode
);

	reg[`RegBus]				fflags;	//浮点累计异常					//
	reg[`RegBus]				frm;		//浮点动态舍入模式					//
	reg[`RegBus]				fcsr;		//浮点控制和状态寄存器					//
	reg[`RegBus]				mstatus;	//机器模式状态寄存器*
	reg[`RegBus]				misa;		//机器模式指令集架构寄存器					//
	reg[`RegBus]				mie;		//机器模式终端使能寄存器*
	reg[`RegBus]				mtvec;		//机器模式异常入口基地址寄存器*
	reg[`RegBus]				mscratch;	//机器模式擦写寄存器*
	reg[`RegBus]				mepc;		//机器模式异常PC寄存器*
	reg[`RegBus]				mcause;	//机器模式异常原因寄存器*
	reg[`RegBus]				mtval;		//机器模式异常值寄存器*
	reg[`RegBus]				mip;		//机器模式中断等待寄存器*
	reg[`RegBus]				mcycle;	//周期计数低32位*
	reg[`RegBus]				mcycleh;	//周期计数高32位*
	reg[`RegBus]				minstret;	//退休指令计数器的低32位*
	reg[`RegBus]				minstreth;	//退休指令计数器的高32位*
	reg[`RegBus]				mvendorid;	//机器模式供应商编号寄存器					//
	reg[`RegBus]				marchid;	//机器模式架构编号寄存器					//
	reg[`RegBus]				mimpid;	//机器模式硬件实现编号寄存器					//
	reg[`RegBus]				mhartid;	//Hart编号寄存器

	initial begin
		misa <= 32'h40001100;
		mvendorid <= 32'h00000000;
		marchid <= 32'h00000000;
		mimpid <= 32'h00000000;
		mhartid <= 32'h00000000;			// 对于单核cpu，只有hart 0
		mstatus <= 32'h00000000;			// 上电之后默认全0
		curr_mode <= `m_mode;				// 上电之后默认为机器模式
	end
	
	assign mstatus_o = mstatus;
	assign mepc_o = mepc;
	assign mie_o = mie;
	assign mip_o = mip;
	assign mtvec_o = mtvec;


	always @ (posedge clk) begin
		if(rst == `RstEnable) begin
//			mstatus <= 32'h00000008;
			mie <= `ZeroWord;
			mtvec <= `ZeroWord;
			mscratch <= `ZeroWord;
			mepc <= `ZeroWord;
			mcause <= `ZeroWord;
			mtval <= `ZeroWord;
			mip <= `ZeroWord;
			mcycle <= `ZeroWord;
			mcycleh <= `ZeroWord;
			minstret <= `ZeroWord;
			minstreth <= `ZeroWord;
			marchid <= `ZeroWord;
			mhartid <= `ZeroWord;
		end else begin
			if(mcycle == 32'hffffffff) begin
				mcycle <= 32'h00000000;
				mcycleh <= mcycleh + 1;
			end else if(mcycle != 32'hffffffff) begin
				mcycle <= mcycle + 1;
			end
			if(we_i == `WriteEnable) begin
				case (waddr_i) 
					`CSR_REG_FFLAGS:		begin
						fflags <= data_i ;
					end
					`CSR_REG_FRM:	begin
						frm <= data_i ;
					end
					`CSR_REG_FCSR:	begin
						fcsr <= data_i ;
					end
					`CSR_REG_MSTATUS:	begin
						mstatus <= data_i ;
					end
					`CSR_REG_MISA:	begin
						misa <= data_i ;
					end
					`CSR_REG_MIE:	begin
						mie <= data_i ;
					end
					`CSR_REG_MTVEC:	begin
						mtvec <= data_i ;
					end
					`CSR_REG_MSCRATCH:	begin
						mscratch <= data_i ;
					end
					`CSR_REG_MEPC:	begin
						mepc <= data_i ;
					end
					`CSR_REG_MCAUSE:	begin
						mcause <= data_i ;
					end
					`CSR_REG_MTVAL:	begin
						mtval <= data_i ;
					end
					`CSR_REG_MIP:	begin
						mip <= data_i ;
					end
					`CSR_REG_MCYCLE:	begin
						mcycle <= data_i ;
					end
					`CSR_REG_MCYCLEH:	begin
						mcycleh <= data_i ;
					end
					`CSR_REG_MINSTRET:	begin
						minstret <= data_i ;
					end
					`CSR_REG_MINSTRETH:	begin
						minstreth <= data_i ;
					end
					`CSR_REG_MVENDORID:	begin
						mvendorid <= data_i ;
					end
					`CSR_REG_MARCHID:	begin
						marchid <= data_i ;
					end
					`CSR_REG_MIMPID:	begin
						mimpid <= data_i ;
					end
					`CSR_REG_MHARTID:	begin
						mhartid <= data_i ;
					end
					default: 	begin
					end			
				endcase  //case addr_i	
			end    //if
			
			if(excepttype_i[31] == 1'b1) begin						// Interrupt
				case (excepttype_i[3:0])
					4'd11:		begin										//external interrupt
							mcause <= excepttype_i;
							mepc <= current_inst_addr_i + 4;
							mstatus[7] <= mstatus[3];			//MPIE <= MIE
							mstatus[3] <= 1'b0;					//关中断
//							mstatus[12:11] <= curr_mode;		//previous mode is u-mode
							mstatus[12:11] <= `u_mode;
							curr_mode <= `m_mode;
//							mip[11] <= 1'b1;
					end
					4'd7:			begin										// timer interrupt
							mcause <= excepttype_i;
							mepc <= current_inst_addr_i + 4;
							mstatus[7] <= mstatus[3];			//MPIE <= MIE
							mstatus[3] <= 1'b0;					//关中断
//							mstatus[12:11] <= curr_mode;		//previous mode is u-mode
							mstatus[12:11] <= `u_mode;
							curr_mode <= `m_mode;
					end
					4'd0:			begin										// software interrupt
							mcause <= excepttype_i;
							mepc <= current_inst_addr_i + 4;
							mstatus[7] <= mstatus[3];			//MPIE <= MIE
							mstatus[3] <= 1'b0;					//关中断
//							mstatus[12:11] <= curr_mode;		//previous mode is u-mode
							mstatus[12:11] <= `u_mode;
							curr_mode <= `m_mode;
					end
				endcase
			end else if(excepttype_i[31] == 1'b0) begin			// Not Interrupt
				case (excepttype_i[30:0])		
					{3'b0, 28'h0000008}:		begin				//ecall from u-mode
						mcause <= {3'b0, 28'h000000b};
						mepc <= current_inst_addr_i;
						mstatus[7] <= mstatus[3];			//MPIE <= MIE
						mstatus[3] <= 1'b0;					//关中断
//						mstatus[12:11] <= curr_mode;		//previous mode is u-mode
						mstatus[12:11] <= `u_mode;
						curr_mode <= `m_mode;
					end
					{3'b0, 28'h0000002}:		begin				//inst invalid
						mcause <= {3'b0, 28'h0000002};
						mepc <= current_inst_addr_i;
						mstatus[7] <= mstatus[3];			//MPIE <= MIE
						mstatus[3] <= 1'b0;					//关中断
//						mstatus[12:11] <= curr_mode;		//previous mode is u-mode
						mstatus[12:11] <= `u_mode;
						curr_mode <= `m_mode;
						mtval <= current_inst_addr_i;
					end
					{3'b0, 28'h000000a}:		begin				//mret
						mcause <= {3'b0, 28'h000000a};
						mstatus[3] <= mstatus[7];			//MIE <= MPIE
						mstatus[7] <= 1'b1;					//MPIE = 1
//						mstatus[12:11] <= `m_mode;			//previous mode is m-mode
						curr_mode <= mstatus[12:11];
					end
				endcase
			end
		end    //if
	end      //always
			
	always @ (*) begin
		if(rst == `RstEnable) begin
			data_o = `ZeroWord;
		end else begin
				case (raddr_i) 
					`CSR_REG_FFLAGS:		begin
						data_o = fflags ;
					end
					`CSR_REG_FRM:	begin
						data_o = frm ;
					end
					`CSR_REG_FCSR:	begin
						data_o = fcsr ;
					end
					`CSR_REG_MSTATUS:	begin
						data_o = mstatus ;
					end
					`CSR_REG_MISA:	begin
						data_o = misa ;
					end
					`CSR_REG_MIE:	begin
						data_o = mie ;
					end
					`CSR_REG_MTVEC:	begin
						data_o = mtvec ;
					end
					`CSR_REG_MSCRATCH:	begin
						data_o = mscratch ;
					end
					`CSR_REG_MEPC:	begin
						data_o = mepc ;
					end
					`CSR_REG_MCAUSE:	begin
						data_o = mcause ;
					end
					`CSR_REG_MTVAL:	begin
						data_o = mtval ;
					end
					`CSR_REG_MIP:	begin
						data_o = mip ;
					end
					`CSR_REG_MCYCLE:	begin
						data_o = mcycle ;
					end
					`CSR_REG_MCYCLEH:	begin
						data_o = mcycleh ;
					end
					`CSR_REG_MINSTRET:	begin
						data_o = minstret ;
					end
					`CSR_REG_MINSTRETH:	begin
						data_o = minstreth ;
					end
					`CSR_REG_MVENDORID:	begin
						data_o = mvendorid ;
					end
					`CSR_REG_MARCHID:	begin
						data_o = marchid ;
					end
					`CSR_REG_MIMPID:	begin
						data_o = mimpid ;
					end
					`CSR_REG_MHARTID:	begin
						data_o = mhartid ;
					end
					default: 	begin
					end			
				endcase  //case addr_i			
		end    //if
	end      //always

endmodule
