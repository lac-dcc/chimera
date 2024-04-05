`timescale 1ns/1ps

module kamikaze_fetch(clk_i,
		rst_i,
		
		im_addr_o,
		im_data_i,
		
		instr_o,
		instr_valid_o,
		is_compressed_instr_o,
		
		pc_o);
		
	input clk_i;
	input rst_i;
	input [31:0] im_data_i; 
	output [31:0] instr_o;
	output [31:0] im_addr_o;
	output instr_valid_o;
	output is_compressed_instr_o;
	output [31:0] pc_o;
	output [31:0] pc_next_o;
	//input stall_i; /* IF 停止信号 */
	
	wire [30:0] word_address = im_addr_o[31:2];
	reg stall_i = 0;
	
	reg [31:0] pc;
	reg [31:0] pc_4;
	reg [2:0] pc_add;
	reg [2:0] pc_add_prev;
	
	
	reg [31:0] last_instr; /* 一级缓冲 */
	reg is_compressed_instr;
	reg fetch_start;	
	
	assign is_compressed_instr_o = is_compressed_instr;
	
	reg align_wait;	/* 对齐等待 */
	
	assign instr_valid_o = !align_wait && !illegal_instr_c && fetch_start;
	localparam CPU_START = 32'h0; /* 启动地址 */
	
	assign im_addr_o = pc_4[1]? (pc_4 + 2'b10): pc_4; /* 舍入 */
	assign stall_requiring = (pc_add_prev == 2) && (pc[1:0] == 2'b00); /* 16位对齐等待，防止冲数据 */
	
	assign pc_o = pc;
	
	reg [31:0]instr_t; /* 临时存放 */
	
	wire illegal_instr_c;/* 错误的压缩指令 */
	
	always @(posedge clk_i or negedge rst_i)
	begin
		if(!rst_i)
		begin
			pc_4 <= {CPU_START[31:2], 2'b00};
			pc <= {CPU_START[31:2], 2'b00};/* PC 比 pc_4 滞后1 CLK */
			fetch_start <= 0;
			pc_add_prev <= 4;
			last_instr <= 32'h0;
			align_wait = CPU_START[1];
		end
		else
		begin
			if(!stall_i)
			begin	
				if(fetch_start == 1'b0)
				begin
					fetch_start <= 1'b1; /* 取 0 指令 */
					pc_4 <= pc_4 + 16'h4;
				end
				else
				begin
					if(align_wait)
						align_wait <= 0;
						
					pc_4 <= pc_4 + pc_add;
					pc <= pc + pc_add;
				
					if(!stall_requiring)
						last_instr <= im_data_i;
					
					pc_add_prev <= pc_add;
				end
			end
		end
	end
	
	always @*
	begin
		if(pc[1:0] == 2'b00)
		begin
			if(stall_requiring)
			begin
				if(last_instr[1:0] != 2'b11) /* 对齐的压缩指令 */
				begin
					is_compressed_instr <= 1;
					instr_t = last_instr[15:0];
				end
				else
				begin
					is_compressed_instr <= 0;
					instr_t = last_instr[31:0];
				end
			end
			else
			begin
				if(im_data_i[1:0] != 2'b11) /* 对齐的压缩指令 */
				begin
					is_compressed_instr <= 1;
					instr_t = im_data_i[15:0];
				end
				else
				begin
					is_compressed_instr <= 0;
					instr_t = im_data_i[31:0];
				end
			end
		end
		else
		begin //pc[1:0] == 10
			if(last_instr[17:16] != 2'b11) /* 不对齐的压缩指令 */
			begin
				is_compressed_instr <= 1;
				instr_t = last_instr[31:16];
			end
			else			/* 不对齐的非压缩指令 */
			begin
				is_compressed_instr <= 0;
				instr_t = {im_data_i[15:0], last_instr[31:16]};
			end
		end
						
		pc_add = is_compressed_instr? 2: 4;
	end
	
	kamikaze_compress_decoder c_dec(.instr_i(instr_t), .instr_o(instr_o), .illegal_instr_o(illegal_instr_c));
	/* 解码压缩指令 */
	
	/* 这地方得有个分支预测器，你说我是直接预测全部不跳好，还是预测全部跳好呢？ */
	
endmodule
