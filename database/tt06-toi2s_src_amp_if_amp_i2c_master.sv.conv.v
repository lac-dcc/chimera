// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

// removed package "toi2s_pkg"
// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:19:1
// removed ["import toi2s_pkg::*;"]
module amp_i2c_master (
	clk_in,
	resetb,
	amp_cfg,
	send_cfg,
	sdai,
	sdao,
	scl
);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:22:5
	input clk_in;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:23:5
	input resetb;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:24:5
	// removed localparam type toi2s_pkg_rb_amp_cfg_wire_t
	inout wire [72:0] amp_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:25:5
	input send_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:26:5
	input sdai;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:27:5
	output wire sdao;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:28:5
	output wire scl;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:31:1
	reg [7:0] opcode_mux;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:32:1
	reg [2:0] boot_index;
	always @(*)
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:34:3
		case (boot_index)
			3'b000:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:35:13
				opcode_mux = amp_cfg[63-:8];
			3'b001:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:36:13
				opcode_mux = amp_cfg[55-:8];
			3'b010:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:37:13
				opcode_mux = amp_cfg[47-:8];
			3'b011:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:38:13
				opcode_mux = amp_cfg[39-:8];
			3'b100:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:39:13
				opcode_mux = amp_cfg[31-:8];
			3'b101:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:40:13
				opcode_mux = amp_cfg[23-:8];
			3'b110:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:41:13
				opcode_mux = amp_cfg[15-:8];
			3'b111:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:42:13
				opcode_mux = amp_cfg[7-:8];
		endcase
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:59:4
	localparam [3:0] INIT_ST = 0;
	localparam [3:0] INIT_I2C_ST = 1;
	localparam [3:0] WAIT_TRIGGER_ST = 2;
	localparam [3:0] SEND_I2C_START_ST = 3;
	localparam [3:0] SEND_I2C_ADR_ST = 4;
	localparam [3:0] LOAD_CMD_ST = 5;
	localparam [3:0] DECODE_CMD_ST = 6;
	localparam [3:0] SEND_ADR_MSB_ST = 7;
	localparam [3:0] SEND_ADR_LSB_ST = 8;
	localparam [3:0] LOAD_DATA_ST = 9;
	localparam [3:0] SEND_DATA_ST = 10;
	localparam [3:0] SEND_I2C_STOP_ST = 11;
	localparam [3:0] SET_OFFSET_ST = 12;
	localparam [3:0] DONE_ST = 13;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:75:4
	wire clk;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:76:4
	clk_div #(.DIV(5)) div(
		clk_in,
		resetb,
		clk
	);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:78:4
	wire [7:0] opcode;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:79:4
	assign opcode = opcode_mux;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:80:4
	reg [2:0] boot_next;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:81:4
	reg [3:0] state_reg;
	reg [3:0] next_reg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:82:4
	reg [5:0] i2c_cnt;
	reg [5:0] next_cnt;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:84:4
	reg i2c_scl;
	reg i2c_scl_next;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:85:4
	reg i2c_sda;
	reg i2c_sda_next;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:87:4
	assign sdao = i2c_sda;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:89:4
	assign scl = i2c_scl;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:92:4
	wire [6:0] i2c_address;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:93:4
	assign i2c_address = 7'b0100000;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:97:4
	assign amp_cfg[72:69] = state_reg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:99:4
	wire resend_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:100:4
	reg resend_cfg_next;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:102:4
	always @(posedge clk)
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:103:6
		resend_cfg_next <= amp_cfg[64];
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:106:4
	assign resend_cfg = !resend_cfg_next & amp_cfg[64];
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:108:4
	always @(posedge clk)
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:110:5
		if (!resetb) begin
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:112:7
			state_reg <= INIT_ST;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:113:7
			boot_index <= 3'b000;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:114:7
			i2c_cnt <= 6'b000000;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:115:7
			i2c_scl <= 1;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:116:7
			i2c_sda <= 1;
		end
		else begin
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:120:7
			state_reg <= next_reg;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:121:7
			i2c_cnt <= next_cnt;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:122:7
			boot_index <= boot_next;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:123:7
			i2c_scl <= i2c_scl_next;
			// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:124:7
			i2c_sda <= i2c_sda_next;
		end
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:128:4
	always @(*) begin
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:130:5
		boot_next <= boot_index;
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:131:5
		next_reg <= state_reg;
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:132:5
		next_cnt <= i2c_cnt - 6'b000001;
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:133:5
		i2c_scl_next <= i2c_scl;
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:134:5
		i2c_sda_next <= i2c_sda;
		// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:136:5
		case (state_reg)
			INIT_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:140:13
				boot_next <= 3'b000;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:141:13
				i2c_sda_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:142:13
				i2c_scl_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:143:13
				next_reg <= WAIT_TRIGGER_ST;
			end
			WAIT_TRIGGER_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:147:13
				boot_next <= 3'b000;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:148:13
				i2c_sda_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:149:13
				i2c_scl_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:150:13
				if (send_cfg)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:151:17
					next_reg <= LOAD_CMD_ST;
			end
			LOAD_CMD_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:155:14
				i2c_sda_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:156:14
				i2c_scl_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:158:12
				if (opcode[7] == 1'b0)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:161:15
					next_reg <= SEND_I2C_START_ST;
				else if (opcode[7:6] == 2'b10) begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:165:14
					boot_next <= boot_index + 3'h1;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:166:14
					next_reg <= LOAD_CMD_ST;
				end
				else if (opcode[7:5] == 3'b110)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:169:15
					next_reg <= SEND_I2C_START_ST;
				else
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:171:15
					next_reg <= DONE_ST;
			end
			SEND_I2C_START_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:176:13
				i2c_sda_next <= 0;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:177:13
				i2c_scl_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:178:13
				next_reg <= SEND_I2C_ADR_ST;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:179:13
				next_cnt <= 36;
			end
			SEND_I2C_ADR_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:184:11
				if (i2c_cnt == 0) begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:186:13
					next_reg <= SEND_ADR_LSB_ST;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:187:13
					next_cnt <= 36;
				end
				if (i2c_cnt > 6)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:191:13
					i2c_sda_next <= i2c_address[i2c_cnt[5:2] - 2];
				else if (i2c_cnt > 4)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:193:13
					i2c_sda_next <= 0;
				else
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:195:13
					i2c_sda_next <= 1;
				if (i2c_cnt[1:0] == 2'b00)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:198:14
					i2c_scl_next <= 0;
				else if (i2c_cnt[1:0] == 2'b01)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:200:14
					i2c_scl_next <= 1;
				else if (i2c_cnt[1:0] == 2'b10)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:202:14
					i2c_scl_next <= 1;
				else if (i2c_cnt[1:0] == 2'b11)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:204:14
					i2c_scl_next <= 0;
			end
			SEND_ADR_LSB_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:209:11
				if (i2c_cnt == 0) begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:211:13
					boot_next <= boot_index + 3'b001;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:212:13
					next_reg <= SEND_DATA_ST;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:213:13
					next_cnt <= 36;
				end
				if (i2c_cnt > 2)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:217:13
					i2c_sda_next <= opcode[i2c_cnt[5:2] - 1];
				else
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:219:13
					i2c_sda_next <= 1;
				if (i2c_cnt[1:0] == 2'b00)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:222:14
					i2c_scl_next <= 0;
				else if (i2c_cnt[1:0] == 2'b01)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:224:14
					i2c_scl_next <= 1;
				else if (i2c_cnt[1:0] == 2'b10)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:226:14
					i2c_scl_next <= 1;
				else if (i2c_cnt[1:0] == 2'b11)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:228:14
					i2c_scl_next <= 0;
			end
			LOAD_DATA_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:233:11
				next_reg <= SEND_DATA_ST;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:234:11
				next_cnt <= 20;
			end
			SEND_DATA_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:239:11
				if (i2c_cnt == 0) begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:241:13
					next_reg <= SEND_I2C_STOP_ST;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:242:13
					next_cnt <= 14;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:243:13
					i2c_scl_next <= 1;
				end
				if (i2c_cnt > 2)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:247:13
					i2c_sda_next <= opcode[i2c_cnt[5:2] - 1];
				else
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:249:13
					i2c_sda_next <= 1;
				if (i2c_cnt[1:0] == 2'b00)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:252:14
					i2c_scl_next <= 0;
				else if (i2c_cnt[1:0] == 2'b01)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:254:14
					i2c_scl_next <= 1;
				else if (i2c_cnt[1:0] == 2'b10)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:256:14
					i2c_scl_next <= 1;
				else if (i2c_cnt[1:0] == 2'b11)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:258:14
					i2c_scl_next <= 0;
			end
			SEND_I2C_STOP_ST:
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:263:10
				if (i2c_cnt == 0) begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:265:13
					next_reg <= LOAD_CMD_ST;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:266:13
					boot_next <= boot_index + 3'b001;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:267:13
					i2c_sda_next <= 1;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:268:13
					i2c_scl_next <= 1;
				end
				else if (i2c_cnt > 2) begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:272:13
					i2c_scl_next <= 1;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:273:13
					i2c_sda_next <= 0;
				end
				else if (i2c_cnt == 1) begin
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:277:13
					i2c_scl_next <= 1;
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:278:13
					i2c_sda_next <= 0;
				end
			DONE_ST: begin
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:283:9
				i2c_scl_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:284:9
				i2c_sda_next <= 1;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:285:9
				next_reg <= DONE_ST;
				// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:286:9
				if (resend_cfg)
					// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_i2c_master.sv:287:11
					next_reg <= INIT_ST;
			end
		endcase
	end
endmodule
