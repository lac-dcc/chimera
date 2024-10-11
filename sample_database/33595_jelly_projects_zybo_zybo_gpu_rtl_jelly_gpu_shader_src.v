// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//   GPU用シェーダー演算ソース側制御
//
//                                 Copyright (C) 2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// シェーダー演算ソース側制御
module jelly_gpu_shader_src
		#(
			parameter	PC_WIDTH     = 9,
			parameter	IMEM_LATENCY = 2,
			parameter	DMEM_LATENCY = 2
		)
		(
			input	wire					reset,
			input	wire					clk,
			input	wire					cke,
			
			input	wire					start,
			output	wire					busy,
			
			// instruction memory
			output	wire					imem_en,
			output	wire	[PC_WIDTH-1:0]	imem_addr,
			input	wire	[31:0]			imem_rdata,
			
			// register file
			output	wire					dmem0_en,
			output	wire	[7:0]			dmem0_addr,
			input	wire	[31:0]			dmem0_rdata,
			
			output	wire					dmem1_en,
			output	wire	[7:0]			dmem1_addr,
			input	wire	[31:0]			dmem1_rdata,
			
			// sync
			output	wire					sync_out,
			input	wire					sync_in,
			
			// ALU
			output	wire	[1:0]			alu_select,
			output	wire	[1:0]			alu_control,
			output	wire	[31:0]			alu_src0,
			output	wire	[31:0]			alu_src1,
			output	wire					alu_valid,
			input	wire					alu_ready
		);
	
	localparam	[3:0]	OPCODE_END      = 4'h0;
	localparam	[3:0]	OPCODE_NOP      = 4'h1;
	localparam	[3:0]	OPCODE_ALU      = 4'h2;
	localparam	[3:0]	OPCODE_SYNC     = 4'hf;
	
	wire						interlock = (alu_valid && !alu_ready) || (sync_out != sync_in) || !cke;
	
	wire						sig_end;
	
	
	// program counter
	reg		[PC_WIDTH-1:0]		reg_pc;
	reg							reg_pc_valid;
	
	always @(posedge clk) begin
		if ( reset ) begin
			reg_pc       <= {PC_WIDTH{1'b0}};
			reg_pc_valid <= 1'b0;
		end
		else if ( !interlock ) begin 
			if ( sig_end ) begin
				reg_pc       <= {PC_WIDTH{1'b0}};
				reg_pc_valid <= 1'b0;
			end
			else if ( start ) begin
				reg_pc       <= {PC_WIDTH{1'b0}};
				reg_pc_valid <= 1'b1;
			end
			else begin
				reg_pc       <= reg_pc + reg_pc_valid;
			end
		end
	end
	
	
	// instruction fetch
	assign imem_en   = (reg_pc_valid && !interlock);
	assign imem_addr = imem_addr;
	
	wire	[31:0]		sig_if_instruction = imem_rdata;
	
	wire	[3:0]		sig_if_opcode      = sig_if_instruction[3:0];
	wire	[1:0]		sig_if_alu_sel     = sig_if_instruction[5:4];
	wire	[1:0]		sig_if_alu_ctl     = sig_if_instruction[7:6];
	wire	[7:0]		sig_if_src0        = sig_if_instruction[23:16];
	wire	[7:0]		sig_if_src1        = sig_if_instruction[31:24];
	
	reg		[IMEM_LATENCY-1:0]	reg_if_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			reg_if_valid <= {IMEM_LATENCY{1'b0}};
		end
		else if ( !interlock ) begin 
			if ( sig_end ) begin
				reg_if_valid <= {IMEM_LATENCY{1'b0}};
			end
			else begin
				reg_if_valid <= ({reg_pc_valid, reg_if_valid} >> 1);
			end
		end
	end
	
	
	// decode & dmem read
	assign	dmem0_en   = !interlock;
	assign	dmem0_addr = sig_if_src0;
	assign	dmem1_en   = !interlock;
	assign	dmem1_addr = sig_if_src1;
	
	wire	[31:0]	sig_dec_src0 = dmem0_rdata;
	wire	[31:0]	sig_dec_src1 = dmem1_rdata;
	
	
	reg		[DMEM_LATENCY-1:0]	reg_dec_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			reg_dec_valid <= {DMEM_LATENCY{1'b0}};
		end
		else if ( !interlock ) begin 
			if ( sig_end ) begin
				reg_dec_valid <= {DMEM_LATENCY{1'b0}};
			end
			else begin
				reg_dec_valid <= ({reg_if_valid[0], reg_dec_valid} >> 1);
			end
		end
	end
	
	
	reg		[1:0]		reg_dec_alu_sel;
	reg		[1:0]		reg_dec_alu_ctl;
	reg					reg_dec_alu_valid;
	reg					reg_dec_sync;
	reg					reg_dec_end;
	
	always @(posedge clk) begin
		if ( reset ) begin
			reg_dec_alu_sel   <= {2{1'bx}};
			reg_dec_alu_ctl   <= {2{1'bx}};
			reg_dec_alu_valid <= 1'b0;
			reg_dec_sync      <= 1'b0;
			reg_dec_end       <= 1'b0;
		end
		else if ( !interlock ) begin
			reg_dec_alu_sel   <= {2{1'bx}};
			reg_dec_alu_ctl   <= {2{1'bx}};
			reg_dec_alu_valid <= 1'b0;
			reg_dec_sync      <= 1'b0;
			reg_dec_end       <= 1'b0;
			
			if ( reg_if_valid[0] ) begin
				case ( sig_if_opcode )
				OPCODE_ALU:
					begin
						reg_dec_alu_sel   <= sig_if_alu_sel;
						reg_dec_alu_ctl   <= sig_if_alu_ctl;
						reg_dec_alu_valid <= 1'b1;
					end
					
				OPCODE_SYNC:
					begin
						reg_dec_sync      <= 1'b1;
					end
					
				OPCODE_END:
					begin
						reg_dec_end       <= 1'b1;
					end
				endcase
			end
		end
	end
	
	assign sig_end     = reg_dec_end;
	assign sync_out    = reg_dec_sync;
	
	wire	[1:0]		sig_dec_alu_sel;
	wire	[1:0]		sig_dec_alu_ctl;
	wire				sig_dec_alu_valid;
	
	jelly_data_delay
			#(
				.LATENCY		(DMEM_LATENCY-1),
				.DATA_WIDTH		(5),
				.DATA_INIT		(5'bxx_xx_0)
			)
		i_data_delay
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(!interlock),
				
				.in_data		({reg_dec_alu_sel, reg_dec_alu_ctl, reg_dec_alu_valid}),
				
				.out_data		({sig_dec_alu_sel, sig_dec_alu_ctl, sig_dec_alu_valid})
			);
	
	
	// execute
	reg		[1:0]		reg_exe_select;
	reg		[1:0]		reg_exe_control;
	reg		[31:0]		reg_exe_src0;
	reg		[31:0]		reg_exe_src1;
	reg					reg_exe_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			reg_exe_select  <= {2{1'bx}};
			reg_exe_control <= {2{1'bx}};
			reg_exe_src0    <= {32{1'bx}};
			reg_exe_src1    <= {32{1'bx}};
			reg_exe_valid   <= 1'b0;
		end
		else begin
			if ( alu_ready ) begin
				reg_exe_valid <= 1'b0;
			end
			
			if ( !interlock ) begin
				reg_exe_select  <= sig_dec_alu_sel;
				reg_exe_control <= sig_dec_alu_ctl;
				reg_exe_src0    <= sig_dec_src0;
				reg_exe_src1    <= sig_dec_src1;
				reg_exe_valid   <= sig_dec_alu_valid;
			
			end
		end
	end
	
	assign	alu_select  = reg_exe_select;
	assign	alu_control = reg_exe_control;
	assign	alu_src0    = reg_exe_src0;
	assign	alu_src1    = reg_exe_src1;
	assign	alu_valid   = reg_exe_valid;
	
	assign busy = (reg_pc_valid || reg_dec_alu_valid || reg_dec_sync || reg_exe_valid);
	
endmodule


`default_nettype wire


// end of file
