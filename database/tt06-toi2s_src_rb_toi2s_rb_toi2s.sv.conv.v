// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

// removed package "toi2s_pkg"
// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:6:1
// removed ["import toi2s_pkg::*;"]
module rb_toi2s (
	clk,
	resetb,
	address,
	data_write_in,
	data_read_out,
	reg_en,
	write_en,
	sys_cfg,
	amp_cfg
);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:9:13
	parameter ADR_BITS = 8;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:12:2
	input wire clk;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:13:2
	input wire resetb;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:14:2
	input wire [ADR_BITS - 1:0] address;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:15:2
	input wire [7:0] data_write_in;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:16:2
	output reg [7:0] data_read_out;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:17:2
	input wire reg_en;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:18:2
	input wire write_en;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:20:2
	// removed localparam type toi2s_pkg_rb_sys_cfg_wire_t
	inout wire [40:0] sys_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:21:2
	// removed localparam type toi2s_pkg_rb_amp_cfg_wire_t
	inout wire [72:0] amp_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:27:1
	reg reg__sys_cfg__enable_stuf;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:28:1
	reg reg__sys_cfg__enable_other;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:29:1
	reg [7:0] reg__sys_cfg__pwm_duty;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:30:1
	reg [5:0] reg__sys_cfg__debug_led;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:31:1
	reg [7:0] reg__sys_cfg__spare_0;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:32:1
	reg [7:0] reg__sys_cfg__spare_1;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:33:1
	reg [7:0] reg__sys_cfg__spare_2;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:36:1
	reg reg__amp_cfg__amp_init;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:37:1
	reg [7:0] reg__amp_cfg__bootmem0;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:38:1
	reg [7:0] reg__amp_cfg__bootmem1;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:39:1
	reg [7:0] reg__amp_cfg__bootmem2;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:40:1
	reg [7:0] reg__amp_cfg__bootmem3;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:41:1
	reg [7:0] reg__amp_cfg__bootmem4;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:42:1
	reg [7:0] reg__amp_cfg__bootmem5;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:43:1
	reg [7:0] reg__amp_cfg__bootmem6;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:44:1
	reg [7:0] reg__amp_cfg__bootmem7;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:46:1
	always @(posedge clk)
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:48:3
		if (resetb == 0) begin
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:52:5
			reg__sys_cfg__enable_stuf <= 1'b0;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:53:5
			reg__sys_cfg__enable_other <= 1'b1;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:54:5
			reg__sys_cfg__pwm_duty <= 8'b10000101;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:55:5
			reg__sys_cfg__debug_led <= 6'b010001;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:56:5
			reg__sys_cfg__spare_0 <= 8'b00010001;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:57:5
			reg__sys_cfg__spare_1 <= 8'b00100010;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:58:5
			reg__sys_cfg__spare_2 <= 8'b00110011;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:61:5
			reg__amp_cfg__amp_init <= 1'b0;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:62:5
			reg__amp_cfg__bootmem0 <= 8'b01000000;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:63:5
			reg__amp_cfg__bootmem1 <= 8'b01001000;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:64:5
			reg__amp_cfg__bootmem2 <= 8'b00110101;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:65:5
			reg__amp_cfg__bootmem3 <= 8'b00001000;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:66:5
			reg__amp_cfg__bootmem4 <= 8'b11111111;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:67:5
			reg__amp_cfg__bootmem5 <= 8'b11111111;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:68:5
			reg__amp_cfg__bootmem6 <= 8'b11111111;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:69:5
			reg__amp_cfg__bootmem7 <= 8'b11111111;
		end
		else
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:73:5
			if (write_en)
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:75:7
				case (address)
					0: begin
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:77:15
						reg__sys_cfg__enable_stuf <= data_write_in[0:0];
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:78:15
						reg__sys_cfg__enable_other <= data_write_in[1:1];
					end
					1:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:80:15
						reg__sys_cfg__pwm_duty <= data_write_in[7:0];
					2:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:82:15
						reg__sys_cfg__debug_led <= data_write_in[5:0];
					3:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:84:15
						reg__sys_cfg__spare_0 <= data_write_in[7:0];
					4:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:86:15
						reg__sys_cfg__spare_1 <= data_write_in[7:0];
					5:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:88:15
						reg__sys_cfg__spare_2 <= data_write_in[7:0];
					17:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:90:15
						reg__amp_cfg__amp_init <= data_write_in[0:0];
					24:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:92:15
						reg__amp_cfg__bootmem0 <= data_write_in[7:0];
					25:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:94:15
						reg__amp_cfg__bootmem1 <= data_write_in[7:0];
					26:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:96:15
						reg__amp_cfg__bootmem2 <= data_write_in[7:0];
					27:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:98:15
						reg__amp_cfg__bootmem3 <= data_write_in[7:0];
					28:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:100:15
						reg__amp_cfg__bootmem4 <= data_write_in[7:0];
					29:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:102:15
						reg__amp_cfg__bootmem5 <= data_write_in[7:0];
					30:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:104:15
						reg__amp_cfg__bootmem6 <= data_write_in[7:0];
					31:
						// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:106:15
						reg__amp_cfg__bootmem7 <= data_write_in[7:0];
				endcase
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:113:1
	always @(posedge clk)
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:115:3
		if (resetb == 0)
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:116:5
			data_read_out <= 8'b00000000;
		else begin
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:119:5
			data_read_out <= 8'b00000000;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:120:5
			case (address)
				0: begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:122:15
					data_read_out[0:0] <= reg__sys_cfg__enable_stuf;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:123:15
					data_read_out[1:1] <= reg__sys_cfg__enable_other;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:124:15
					data_read_out[2:2] <= sys_cfg[38];
				end
				1:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:126:15
					data_read_out[7:0] <= reg__sys_cfg__pwm_duty;
				2:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:128:15
					data_read_out[5:0] <= reg__sys_cfg__debug_led;
				3:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:130:15
					data_read_out[7:0] <= reg__sys_cfg__spare_0;
				4:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:132:15
					data_read_out[7:0] <= reg__sys_cfg__spare_1;
				5:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:134:15
					data_read_out[7:0] <= reg__sys_cfg__spare_2;
				16:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:136:15
					data_read_out[7:0] <= amp_cfg[72-:8];
				17:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:138:15
					data_read_out[0:0] <= reg__amp_cfg__amp_init;
				24:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:140:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem0;
				25:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:142:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem1;
				26:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:144:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem2;
				27:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:146:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem3;
				28:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:148:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem4;
				29:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:150:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem5;
				30:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:152:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem6;
				31:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:154:15
					data_read_out[7:0] <= reg__amp_cfg__bootmem7;
				default:
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:156:17
					data_read_out <= 8'b00000000;
			endcase
		end
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:161:1
	assign sys_cfg[40] = reg__sys_cfg__enable_stuf;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:162:1
	assign sys_cfg[39] = reg__sys_cfg__enable_other;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:163:1
	assign sys_cfg[37-:8] = reg__sys_cfg__pwm_duty;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:164:1
	assign sys_cfg[29-:6] = reg__sys_cfg__debug_led;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:165:1
	assign sys_cfg[23-:8] = reg__sys_cfg__spare_0;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:166:1
	assign sys_cfg[15-:8] = reg__sys_cfg__spare_1;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:167:1
	assign sys_cfg[7-:8] = reg__sys_cfg__spare_2;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:168:1
	assign amp_cfg[64] = reg__amp_cfg__amp_init;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:169:1
	assign amp_cfg[63-:8] = reg__amp_cfg__bootmem0;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:170:1
	assign amp_cfg[55-:8] = reg__amp_cfg__bootmem1;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:171:1
	assign amp_cfg[47-:8] = reg__amp_cfg__bootmem2;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:172:1
	assign amp_cfg[39-:8] = reg__amp_cfg__bootmem3;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:173:1
	assign amp_cfg[31-:8] = reg__amp_cfg__bootmem4;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:174:1
	assign amp_cfg[23-:8] = reg__amp_cfg__bootmem5;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:175:1
	assign amp_cfg[15-:8] = reg__amp_cfg__bootmem6;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/rb_toi2s/rb_toi2s.sv:176:1
	assign amp_cfg[7-:8] = reg__amp_cfg__bootmem7;
endmodule
