// This program was cloned from: https://github.com/gzzyyxh/Quafu
// License: MIT License

`include "defines.v"

module openriscv(

	input	wire										clk,
	input wire										rst,
 
//	input wire[`RegBus]           rom_data_i,
//	output wire[`RegBus]           rom_addr_o,
//	output wire                    rom_ce_o,
	
  //指令wishbone总线
	input wire[`RegBus]           iwishbone_data_i,
	input wire                    iwishbone_ack_i,
	output wire[`RegBus]           iwishbone_addr_o,
	output wire[`RegBus]           iwishbone_data_o,
	output wire                    iwishbone_we_o,
	output wire[3:0]               iwishbone_sel_o,
	output wire                    iwishbone_stb_o,
	output wire                    iwishbone_cyc_o, 
	
  //数据wishbone总线
	input wire[`RegBus]           dwishbone_data_i,
	input wire                    dwishbone_ack_i,
	output wire[`RegBus]           dwishbone_addr_o,
	output wire[`RegBus]           dwishbone_data_o,
	output wire                    dwishbone_we_o,
	output wire[3:0]               dwishbone_sel_o,
	output wire                    dwishbone_stb_o,
	output wire                    dwishbone_cyc_o,
	
	//to plic & clint
	output wire[`RegBus]				latest_mie,
	output wire[`RegBus]				latest_mstatus,
	//from plic
	input wire	interrupt_plic,
	input wire[30:0] exception_code_plic,
	//from clint
	input wire interrupt_clint,
	input wire[30:0] exception_code_clint
);

	wire[`InstAddrBus] pc;
	wire[`InstAddrBus] id_pc_i;
	wire[`InstBus] id_inst_i;
	wire[`InstBus] inst_i;
	wire				branch_flush;
	wire[1:0] curr_mode;
	
	//连接译码阶段ID模块的输出与ID/EX模块的输入
	wire[`AluOpBus] id_aluop_o;
	wire[`AluSelBus] id_alusel_o;
	wire[`RegBus] id_reg1_o;
	wire[`RegBus] id_reg2_o;
	wire id_wreg_o;
	wire[`RegAddrBus] id_wd_o;
	wire[`RegBus] id_link_address_o;
	wire[`RegBus] id_inst_o;
   wire[31:0] id_excepttype_o;
   wire[`RegBus] id_current_inst_address_o;
	
	//连接ID/EX模块的输出与执行阶段EX模块的输入
	wire[`AluOpBus] ex_aluop_i;
	wire[`AluSelBus] ex_alusel_i;
	wire[`RegBus] ex_reg1_i;
	wire[`RegBus] ex_reg2_i;
	wire ex_wreg_i;
	wire[`RegAddrBus] ex_wd_i;
	wire[`RegBus] ex_link_address_i;
	wire[`RegBus] ex_inst_i;
   wire[31:0] ex_excepttype_i;	
   wire[`RegBus] ex_current_inst_address_i;	
	
	//连接执行阶段EX模块的输出与EX/MEM模块的输入
	wire ex_wreg_o;
	wire[`RegAddrBus] ex_wd_o;
	wire[`RegBus] ex_wdata_o;
	wire[`AluOpBus] ex_aluop_o;
	wire[`RegBus] ex_mem_addr_o;
	wire[`RegBus] ex_reg1_o;
	wire[`RegBus] ex_reg2_o;
	wire ex_csr_reg_we_o;
	wire[11:0] ex_csr_reg_write_addr_o;
	wire[`RegBus] ex_csr_reg_data_o;
	wire[31:0] ex_excepttype_o;
	wire[`RegBus] ex_current_inst_address_o;

	//连接EX/MEM模块的输出与访存阶段MEM模块的输入
	wire mem_wreg_i;
	wire[`RegAddrBus] mem_wd_i;
	wire[`RegBus] mem_wdata_i;
	wire[`AluOpBus] mem_aluop_i;
	wire[`RegBus] mem_mem_addr_i;
	wire[`RegBus] mem_reg1_i;
	wire[`RegBus] mem_reg2_i;
	wire mem_csr_reg_we_i;
	wire[11:0] mem_csr_reg_write_addr_i;
	wire[`RegBus] mem_csr_reg_data_i;
	wire[31:0] mem_excepttype_i;	
	wire[`RegBus] mem_current_inst_address_i;	

	//连接访存阶段MEM模块的输出与MEM/WB模块的输入
	wire mem_wreg_o;
	wire[`RegAddrBus] mem_wd_o;
	wire[`RegBus] mem_wdata_o;
	wire mem_csr_reg_we_o;
	wire[11:0] mem_csr_reg_write_addr_o;
	wire[`RegBus] mem_csr_reg_data_o;
	wire[31:0] mem_excepttype_o;
	wire[`RegBus] mem_current_inst_address_o;	
	
	
	//连接MEM/WB模块的输出与回写阶段的输入	
	wire wb_wreg_i;
	wire[`RegAddrBus] wb_wd_i;
	wire[`RegBus] wb_wdata_i;
	wire wb_csr_reg_we_i;
	wire[11:0] wb_csr_reg_write_addr_i;
	wire[`RegBus] wb_csr_reg_data_i;
	wire[31:0] wb_excepttype_i;
	wire[`RegBus] wb_current_inst_address_i;
	
	//连接译码阶段ID模块与通用寄存器Regfile模块
  wire reg1_read;
  wire reg2_read;
  wire[`RegBus] reg1_data;
  wire[`RegBus] reg2_data;
  wire[`RegAddrBus] reg1_addr;
  wire[`RegAddrBus] reg2_addr;
  
	wire[`DoubleRegBus] div_result;
	wire div_ready;
	wire[`RegBus] div_opdata1;
	wire[`RegBus] div_opdata2;
	wire div_start;
	wire div_annul;
	wire signed_div;
	
	wire id_branch_flag_o;
	wire[`RegBus] branch_target_address;
	
	wire[5:0] stall;
	wire stallreq_from_id;	
	wire stallreq_from_ex;
	wire stallreq_from_if;
	wire stallreq_from_mem;	

   wire[`RegBus] csr_data_o;
   wire[11:0] csr_raddr_i;
  
   wire flush;
   wire[`RegBus] new_pc;
	
	wire[`RegBus]	csr_mstatus;
	wire[`RegBus]	csr_mepc;
	wire[`RegBus]	csr_mie;
	wire[`RegBus]	csr_mip;
	wire[`RegBus]	csr_mtvec;

   wire[`RegBus] latest_mepc;
	wire[`RegBus]	latest_mtvec;
	
	wire rom_ce;

	wire[31:0] ram_addr_o;
	wire ram_we_o;
	wire[3:0] ram_sel_o;
	wire[`RegBus] ram_data_o;
	wire ram_ce_o;
	wire[`RegBus] ram_data_i;
  
  //pc_reg例化
	pc_reg pc_reg0(
		.clk(clk),
		.rst(rst),
		.stall(stall),
		.flush(flush),
	   .new_pc(new_pc),
		.branch_flag_i(id_branch_flag_o),
		.branch_target_address_i(branch_target_address),
		.pc(pc),
		.ce(rom_ce),
		.branch_flush(branch_flush)
			
	);
	
//  assign rom_addr_o = pc;

  //IF/ID模块例化
	if_id if_id0(
		.clk(clk),
		.rst(rst),
		.stall(stall),
		.flush(flush),
		.if_pc(pc),
		.if_inst(inst_i),
		.id_pc(id_pc_i),
		.id_inst(id_inst_i),
		.branch_flush(branch_flush)
	);
	
	//译码阶段ID模块
	id id0(
		.rst(rst),
		.pc_i(id_pc_i),
		.inst_i(id_inst_i),
		
		.ex_aluop_i(ex_aluop_o),

		.reg1_data_i(reg1_data),
		.reg2_data_i(reg2_data),


	  //处于执行阶段的指令要写入的目的寄存器信息
		.ex_wreg_i(ex_wreg_o),
		.ex_wdata_i(ex_wdata_o),
		.ex_wd_i(ex_wd_o),

	  //处于访存阶段的指令要写入的目的寄存器信息
		.mem_wreg_i(mem_wreg_o),
		.mem_wdata_i(mem_wdata_o),
		.mem_wd_i(mem_wd_o),
		
		.curr_mode(curr_mode),

		//送到regfile的信息
		.reg1_read_o(reg1_read),
		.reg2_read_o(reg2_read), 	  

		.reg1_addr_o(reg1_addr),
		.reg2_addr_o(reg2_addr), 
	  
		//送到ID/EX模块的信息
		.aluop_o(id_aluop_o),
		.alusel_o(id_alusel_o),
		.reg1_o(id_reg1_o),
		.reg2_o(id_reg2_o),
		.wd_o(id_wd_o),
		.wreg_o(id_wreg_o),
		.inst_o(id_inst_o),
		.branch_flag_o(id_branch_flag_o),
		.branch_target_address_o(branch_target_address),       
		.link_addr_o(id_link_address_o),

		.stallreq(stallreq_from_id),
		
		.excepttype_o(id_excepttype_o),
		.current_inst_address_o(id_current_inst_address_o)
	);

  //通用寄存器Regfile例化
	regfile regfile1(
		.clk (clk),
		.rst (rst),
		.we	(wb_wreg_i),
		.waddr (wb_wd_i),
		.wdata (wb_wdata_i),
		.re1 (reg1_read),
		.raddr1 (reg1_addr),
		.rdata1 (reg1_data),
		.re2 (reg2_read),
		.raddr2 (reg2_addr),
		.rdata2 (reg2_data)
	);

	//ID/EX模块
	id_ex id_ex0(
		.clk(clk),
		.rst(rst),
		
		.stall(stall),
		.flush(flush),
		
		//从译码阶段ID模块传递的信息
		.id_aluop(id_aluop_o),
		.id_alusel(id_alusel_o),
		.id_reg1(id_reg1_o),
		.id_reg2(id_reg2_o),
		.id_wd(id_wd_o),
		.id_wreg(id_wreg_o),
		.id_link_address(id_link_address_o),
		.id_inst(id_inst_o),
		.id_excepttype(id_excepttype_o),
		.id_current_inst_address(id_current_inst_address_o),
	
		//传递到执行阶段EX模块的信息
		.ex_aluop(ex_aluop_i),
		.ex_alusel(ex_alusel_i),
		.ex_reg1(ex_reg1_i),
		.ex_reg2(ex_reg2_i),
		.ex_wd(ex_wd_i),
		.ex_wreg(ex_wreg_i),
		.ex_link_address(ex_link_address_i),
		.ex_inst(ex_inst_i),
		.ex_excepttype(ex_excepttype_i),
		.ex_current_inst_address(ex_current_inst_address_i)
	);		
	
	//EX模块
	ex ex0(
		.rst(rst),
	
		//送到执行阶段EX模块的信息
		.aluop_i(ex_aluop_i),
		.alusel_i(ex_alusel_i),
		.reg1_i(ex_reg1_i),
		.reg2_i(ex_reg2_i),
		.wd_i(ex_wd_i),
		.wreg_i(ex_wreg_i),
		.inst_i(ex_inst_i),
		
		.div_result_i(div_result),
		.div_ready_i(div_ready),
		
		.link_address_i(ex_link_address_i),
		
		.excepttype_i(ex_excepttype_i),
		.current_inst_address_i(ex_current_inst_address_i),
		
		//访存阶段的指令是否要写CP0，用来检测数据相关
		.mem_csr_reg_we(mem_csr_reg_we_o),
		.mem_csr_reg_write_addr(mem_csr_reg_write_addr_o),
		.mem_csr_reg_data(mem_csr_reg_data_o),
	
		//回写阶段的指令是否要写CP0，用来检测数据相关
		.wb_csr_reg_we(wb_csr_reg_we_i),
		.wb_csr_reg_write_addr(wb_csr_reg_write_addr_i),
		.wb_csr_reg_data(wb_csr_reg_data_i),

		.csr_reg_data_i(csr_data_o),
		.csr_reg_read_addr_o(csr_raddr_i),
		
		//向下一流水级传递，用于写CP0中的寄存器
		.csr_reg_we_o(ex_csr_reg_we_o),
		.csr_reg_write_addr_o(ex_csr_reg_write_addr_o),
		.csr_reg_data_o(ex_csr_reg_data_o),	
	  
	  //EX模块的输出到EX/MEM模块信息
		.wd_o(ex_wd_o),
		.wreg_o(ex_wreg_o),
		.wdata_o(ex_wdata_o),
		
		.div_opdata1_o(div_opdata1),
		.div_opdata2_o(div_opdata2),
		.div_start_o(div_start),
		.signed_div_o(signed_div),	
		
		.aluop_o(ex_aluop_o),
		.mem_addr_o(ex_mem_addr_o),
		.reg2_o(ex_reg2_o),
		
		.excepttype_o(ex_excepttype_o),
		.current_inst_address_o(ex_current_inst_address_o),
		
		.stallreq(stallreq_from_ex)  
		
	);

  //EX/MEM模块
  ex_mem ex_mem0(
		.clk(clk),
		.rst(rst),
		.stall(stall),
	   .flush(flush),
	  
		//来自执行阶段EX模块的信息	
		.ex_wd(ex_wd_o),
		.ex_wreg(ex_wreg_o),
		.ex_wdata(ex_wdata_o),
	
	   .ex_aluop(ex_aluop_o),
		.ex_mem_addr(ex_mem_addr_o),
		.ex_reg2(ex_reg2_o),
		
		.ex_csr_reg_we(ex_csr_reg_we_o),
		.ex_csr_reg_write_addr(ex_csr_reg_write_addr_o),
		.ex_csr_reg_data(ex_csr_reg_data_o),
	
      .ex_excepttype(ex_excepttype_o),
		.ex_current_inst_address(ex_current_inst_address_o),	

		//送到访存阶段MEM模块的信息
		.mem_wd(mem_wd_i),
		.mem_wreg(mem_wreg_i),
		.mem_wdata(mem_wdata_i),
		
		.mem_csr_reg_we(mem_csr_reg_we_i),
		.mem_csr_reg_write_addr(mem_csr_reg_write_addr_i),
		.mem_csr_reg_data(mem_csr_reg_data_i),
		
		.mem_aluop(mem_aluop_i),
		.mem_mem_addr(mem_mem_addr_i),
		.mem_reg2(mem_reg2_i),
		
		.mem_excepttype(mem_excepttype_i),
		.mem_current_inst_address(mem_current_inst_address_i)
						       	
	);
	
  //MEM模块例化
	mem mem0(
		.rst(rst),
	
		//来自EX/MEM模块的信息	
		.wd_i(mem_wd_i),
		.wreg_i(mem_wreg_i),
		.wdata_i(mem_wdata_i),
		
		.aluop_i(mem_aluop_i),
		.mem_addr_i(mem_mem_addr_i),
		.reg2_i(mem_reg2_i),
	
		//来自memory的信息
		.mem_data_i(ram_data_i),
		
		.csr_reg_we_i(mem_csr_reg_we_i),
		.csr_reg_write_addr_i(mem_csr_reg_write_addr_i),
		.csr_reg_data_i(mem_csr_reg_data_i),
		
		.excepttype_i(mem_excepttype_i),
		.current_inst_address_i(mem_current_inst_address_i),
		
		.csr_mstatus_i(csr_mstatus),
		.csr_mie_i(csr_mie),
		.csr_mip_i(csr_mip),
		.csr_mepc_i(csr_mepc),
		.csr_mtvec_i(csr_mtvec),
		
		//回写阶段的指令是否要写CP0，用来检测数据相关
		.wb_csr_reg_we(wb_csr_reg_we_i),
		.wb_csr_reg_write_addr(wb_csr_reg_write_addr_i),
		.wb_csr_reg_data(wb_csr_reg_data_i),	  

		
		.csr_reg_we_o(mem_csr_reg_we_o),
		.csr_reg_write_addr_o(mem_csr_reg_write_addr_o),
		.csr_reg_data_o(mem_csr_reg_data_o),	
	  
		//送到MEM/WB模块的信息
		.wd_o(mem_wd_o),
		.wreg_o(mem_wreg_o),
		.wdata_o(mem_wdata_o),

		//送到memory的信息
		.mem_addr_o(ram_addr_o),
		.mem_we_o(ram_we_o),
		.mem_sel_o(ram_sel_o),
		.mem_data_o(ram_data_o),
		.mem_ce_o(ram_ce_o),
		
		.excepttype_o(mem_excepttype_o),
		.csr_mepc_o(latest_mepc),
		.csr_mtvec_o(latest_mtvec),
		.csr_mie_o(latest_mie),
		.csr_mstatus_o(latest_mstatus),
		.current_inst_address_o(mem_current_inst_address_o),
		
		//from plic
		.interrupt_plic(interrupt_plic),
		.exception_code_plic(exception_code_plic),
		//from clint
		.interrupt_clint(interrupt_clint),
		.exception_code_clint(exception_code_clint),
		.curr_mode(curr_mode)
		
	);

  //MEM/WB模块
	mem_wb mem_wb0(
		.clk(clk),
		.rst(rst),
		.stall(stall),
		.flush(flush),

		//来自访存阶段MEM模块的信息	
		.mem_wd(mem_wd_o),
		.mem_wreg(mem_wreg_o),
		.mem_wdata(mem_wdata_o),
		
		.mem_csr_reg_we(mem_csr_reg_we_o),
		.mem_csr_reg_write_addr(mem_csr_reg_write_addr_o),
		.mem_csr_reg_data(mem_csr_reg_data_o),	
	
		//送到回写阶段的信息
		.wb_wd(wb_wd_i),
		.wb_wreg(wb_wreg_i),
		.wb_wdata(wb_wdata_i),
		
		.wb_csr_reg_we(wb_csr_reg_we_i),
		.wb_csr_reg_write_addr(wb_csr_reg_write_addr_i),
		.wb_csr_reg_data(wb_csr_reg_data_i)	
									       	
	);
	
	ctrl ctrl0(
		.rst(rst),
		
	  .excepttype_i(mem_excepttype_o),
	  .csr_mepc_i(latest_mepc),
	  .csr_mtvec_i(latest_mtvec),
	
     .stallreq_from_if(stallreq_from_if),
	  .stallreq_from_id(stallreq_from_id),
	  .stallreq_from_mem(stallreq_from_mem),
	
  	//来自执行阶段的暂停请求
	  .stallreq_from_ex(stallreq_from_ex),
	  .new_pc(new_pc),
	  .flush(flush),
	  .stall(stall)       	
	);
	
	div div0(
		.clk(clk),
		.rst(rst),
	
		.signed_div_i(signed_div),
		.opdata1_i(div_opdata1),
		.opdata2_i(div_opdata2),
		.start_i(div_start),
//		.annul_i(1'b0),
		.annul_i(flush),
	
		.result_o(div_result),
		.ready_o(div_ready)
	);
	
	csr csr0(
		.clk(clk),
		.rst(rst),
		
		.we_i(wb_csr_reg_we_i),
		.waddr_i(wb_csr_reg_write_addr_i),
		.raddr_i(csr_raddr_i),
		.data_i(wb_csr_reg_data_i),
		
		.excepttype_i(mem_excepttype_o),
		.current_inst_addr_i(mem_current_inst_address_o),
		
		.data_o(csr_data_o),

		.mstatus_o(csr_mstatus),
		.mepc_o(csr_mepc),		
		.mie_o(csr_mie),
		.mip_o(csr_mip),		
		.mtvec_o(csr_mtvec),
		
		.curr_mode(curr_mode)
	);
	
	wishbone_bus_if dwishbone_bus_if(
		.clk(clk),
		.rst(rst),
	
		//来自控制模块ctrl
		.stall_i(stall),
		.flush_i(flush),

	
		//CPU侧读写操作信息
		.cpu_ce_i(ram_ce_o),
		.cpu_data_i(ram_data_o),
		.cpu_addr_i(ram_addr_o),
		.cpu_we_i(ram_we_o),
		.cpu_sel_i(ram_sel_o),
		.cpu_data_o(ram_data_i),
	
		//Wishbone总线侧接口
		.wishbone_data_i(dwishbone_data_i),
		.wishbone_ack_i(dwishbone_ack_i),
		.wishbone_addr_o(dwishbone_addr_o),
		.wishbone_data_o(dwishbone_data_o),
		.wishbone_we_o(dwishbone_we_o),
		.wishbone_sel_o(dwishbone_sel_o),
		.wishbone_stb_o(dwishbone_stb_o),
		.wishbone_cyc_o(dwishbone_cyc_o),

		.stallreq(stallreq_from_mem)	       
	
);

	wishbone_bus_if iwishbone_bus_if(
		.clk(clk),
		.rst(rst),
	
		//来自控制模块ctrl
		.stall_i(stall),
		.flush_i(flush),
	
		//CPU侧读写操作信息
		.cpu_ce_i(rom_ce),
		.cpu_data_i(32'h00000000),
		.cpu_addr_i(pc),
		.cpu_we_i(1'b0),
		.cpu_sel_i(4'b1111),
		.cpu_data_o(inst_i),
	
		//Wishbone总线侧接口
		.wishbone_data_i(iwishbone_data_i),
		.wishbone_ack_i(iwishbone_ack_i),
		.wishbone_addr_o(iwishbone_addr_o),
		.wishbone_data_o(iwishbone_data_o),
		.wishbone_we_o(iwishbone_we_o),
		.wishbone_sel_o(iwishbone_sel_o),
		.wishbone_stb_o(iwishbone_stb_o),
		.wishbone_cyc_o(iwishbone_cyc_o),

		.stallreq(stallreq_from_if)
);
endmodule
