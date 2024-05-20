// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module risc_cpu (
	input 				clk    , 
	input 				rst    , 

	output wire 		rd     ,
	output wire 		wr     ,
	output wire 		halt   ,
	output wire 		fetch  ,

	// addr
	output wire [12:0] 	addr   ,
	output wire [12:0] 	ir_addr,
	output wire [12:0] 	pc_addr,
	inout  wire [7:0] 	data   ,

	// op
	output wire [2:0] opcode
	
);
	wire [7:0] alu_out ;
	wire [7:0] accum   ;


	wire zero ;
	wire inc_pc;
	wire load_acc;
	wire load_pc;
	wire load_ir;
	wire data_ena;
	wire contr_ena;
	wire alu_ena;

	clk_gen inst_clk_gen (
		.clk    (clk),
		.rst    (rst),
		.fetch  (fetch),
		.alu_en (alu_en)
		);

	register inst_register (
		.clk(clk), 
		.rst(rst), 
		.data(data), 
		.ena(load_ir), 
		.opc_iraddr({opcode, ir_addr})
		);

	accum inst_accum (
		.clk(clk), 
		.rst(rst), 
		.ena(load_acc), 
		.data(alu_out), 
		.accum(accum)
		);
	alu inst_alu (
		.clk     (clk),
		.alu_en  (alu_en),
		.opcode  (opcode),
		.data    (data),
		.accum   (accum),
		.alu_out (alu_out),
		.zero    (zero)
		);
	machinectl inst_machinectl (
		.clk(clk), 
		.rst(rst), 
		.fetch(fetch), 
		.ena(contr_ena)
		);

	machin inst_machin (
		.clk         (clk),
		.ena         (contr_ena),
		.zero        (zero),
		.opcode      (opcode),
		.inc_pc      (inc_pc),
		.load_acc    (load_acc),
		.load_pc     (load_pc),
		.rd          (rd),
		.wr          (wr),
		.load_ir     (load_ir),
		.datactl_ena (data_ena),
		.halt        (halt)
		);
	datactl inst_datactl (
		.in(alu_out), 
		.data_ena(data_ena), 
		.data(data)
		);
	adr inst_adr (
		.fetch(fetch), 
		.ir_addr(ir_addr), 
		.pc_addr(pc_addr), 
		.addr(addr)
		);
	counter inst_counter (
		.clk(inc_pc), 
		.rst(rst), 
		.ir_addr(ir_addr), 
		.load(load_pc), 
		.pc_addr(pc_addr)
		);

endmodule