// 使用说明
// https://github.com/roife/dasm


// 一个用于实时反编译mips指令的 Verilog module，目前支持高老板PDF上全部的指令（P6之前的所有指令，除了 syscall/异常/etc 之类的特殊指令）其中，对于j/jal指令，会直接显示跳转的地址。

// 使用方法：将DASM.v文件放置在cpu目录下，在需要的module里面将其实例化。其中：

// instr 为32bit指令
// reg_name为0时表示显示寄存器编号，为1时表示显示寄存器名字（0号寄存器统一用$00表示）
// asm是一个字符串，表示反汇编结果，可以不连。
// pc 表示当前的 pc，用来显示 branch 类指令的地址
// imm_as_dec 表示是否将立即数用十进制显示（默认HEX，用十进制时addi/addiu/slti/sltiu会进行符号扩展，其余进行无符号扩展）

`define lb 	    6'b100000
`define lbu     6'b100100
`define lh	    6'b100001
`define lhu     6'b100101
`define lw	    6'b100011
`define sb	    6'b101000
`define sh	    6'b101001
`define sw	    6'b101011
`define addop	6'b000000
`define addfu	6'b100000
`define addi	6'b001000
`define addiu	6'b001001
`define adduop	6'b000000
`define addufu	6'b100001
`define andop	6'b000000
`define andfu	6'b100100
`define andi	6'b001100
`define beq		6'b000100
`define bgezop	6'b000001
`define bgezrt 5'b00001
`define bgtz	6'b000111
`define blez	6'b000110
`define bltzop	6'b000001
`define bltzrt 5'b00000
`define bne		6'b000101
`define divop	6'b000000
`define divfu	6'b011010
`define divuop	6'b000000
`define divufu	6'b011011
`define j		6'b000010
`define jal		6'b000011
`define jalrop	6'b000000
`define jalrfu 6'b001001
`define jrop	6'b000000
`define jrfu	6'b001000
`define Lui		6'b001111
`define mfhiop	6'b000000
`define mfhifu	6'b010000
`define mfloop	6'b000000
`define mflofu	6'b010010
`define mthiop	6'b000000
`define mthifu	6'b010001
`define mtloop	6'b000000
`define mtlofu	6'b010011
`define multop	6'b000000
`define multfu	6'b011000
`define multuop 6'b000000
`define multufu 6'b011001
`define norop	6'b000000
`define norfu	6'b100111
`define orop	6'b000000
`define orfu	6'b100101
`define ori		6'b001101
`define sllop	6'b000000
`define sllfu	6'b000000
`define sllvop	6'b000000
`define sllvfu	6'b000100
`define sltop	6'b000000
`define sltfu	6'b101010
`define slti	6'b001010
`define sltiu	6'b001011
`define sltuop	6'b000000
`define sltufu	6'b101011
`define sraop	6'b000000
`define srafu	6'b000011
`define sravop	6'b000000
`define sravfu	6'b000111
`define srlop	6'b000000
`define srlfu	6'b000010
`define srlvop	6'b000000
`define srlvfu	6'b000110
`define subop	6'b000000
`define subfu	6'b100010
`define subuop	6'b000000
`define subufu	6'b100011
`define sw		6'b101011
`define xorop	6'b000000
`define xorfu	6'b100110
`define xori	6'b001110

module DASM (
	input [31:0] pc,
    input [31:0] instr,
	input reg_name,
	input imm_as_dec,
    output [32*8-1:0] asm
);

	 wire [5:0]func=instr[5:0], op=instr[31:26];
	 wire [4:0]rs=instr[25:21], rt=instr[20:16], rd=instr[15:11], sha=instr[10:6];
	 wire [15:0] imm=instr[15:0];
	 wire [25:0] target=instr[25:0];

	 wire beq=(op==`beq);
	 wire bgez=(op==`bgezop)&(rt==`bgezrt);
	 wire bgtz=(op==`bgtz);
	 wire blez=(op==`blez);
	 wire bltz=(op==`bltzop)&(rt==`bltzrt);
	 wire bne=(op==`bne);

	 wire j=(op==`j);
	 wire jal=(op==`jal);
	 wire jalr=(op==`jalrop)&(func==`jalrfu);
	 wire jr=(op==`jrop)&(func==`jrfu);

	 wire lb=(op==`lb);
	 wire lbu=(op==`lbu);
	 wire lh=(op==`lh);
	 wire lhu=(op==`lhu);
	 wire lw=(op==`lw);
	 wire sb=(op==`sb);
	 wire sh=(op==`sh);
	 wire sw=(op==`sw);

	 wire lui=(op==`Lui);

	 wire add=(op==`addop)&(func==`addfu);
	 wire addi=(op==`addi);
	 wire addiu=(op==`addiu);
	 wire addu=(op==`adduop)&(func==`addufu);
	 wire And=(op==`andop)&(func==`andfu);
	 wire andi=(op==`andi);
	 wire div=(op==`divop)&(func==`divfu);
	 wire divu=(op==`divuop)&(func==`divufu);
	 wire mfhi=(op==`mfhiop)&(func==`mfhifu);
	 wire mflo=(op==`mfloop)&(func==`mflofu);
	 wire mthi=(op==`mthiop)&(func==`mthifu);
	 wire mtlo=(op==`mtloop)&(func==`mtlofu);
	 wire mult=(op==`multop)&(func==`multfu);
	 wire multu=(op==`multuop)&(func==`multufu);
	 wire Nor=(op==`norop)&(func==`norfu);
	 wire Or=(op==`orop)&(func==`orfu);
	 wire ori=(op==`ori);
	 wire sll=(op==6'b000000)&(func==6'b000000)&(|rd);
	 wire sllv=(op==`sllvop)&(func==`sllvfu);
	 wire slt=(op==`sltop)&(func==`sltfu);
	 wire slti=(op==`slti);
	 wire sltiu=(op==`sltiu);
	 wire sltu=(op==`sltuop)&(func==`sltufu);
	 wire sra=(op==`sraop)&(func==`srafu);
	 wire srav=(op==`sravop)&(func==`sravfu);
	 wire srl=(op==`srlop)&(func==`srlfu);
	 wire srlv=(op==`srlvop)&(func==`srlvfu);
	 wire sub=(op==`subop)&(func==`subfu);
	 wire subu=(op==`subuop)&(func==`subufu);
	 wire Xor=(op==`xorop)&(func==`xorfu);
	 wire xori=(op==`xori);

	function [8*3-1:0] get_reg;
		input [4:0] num;
	begin
		case (num)
			5'b00000: get_reg = reg_name ? "$00" : "$00";
			5'b00001: get_reg = reg_name ? "$at" : "$01";
			5'b00010: get_reg = reg_name ? "$v0" : "$02";
			5'b00011: get_reg = reg_name ? "$v1" : "$03";
			5'b00100: get_reg = reg_name ? "$a0" : "$04";
			5'b00101: get_reg = reg_name ? "$a1" : "$05";
			5'b00110: get_reg = reg_name ? "$a2" : "$06";
			5'b00111: get_reg = reg_name ? "$a3" : "$07";
			5'b01000: get_reg = reg_name ? "$t0" : "$08";
			5'b01001: get_reg = reg_name ? "$t1" : "$09";
			5'b01010: get_reg = reg_name ? "$t2" : "$10";
			5'b01011: get_reg = reg_name ? "$t3" : "$11";
			5'b01100: get_reg = reg_name ? "$t4" : "$12";
			5'b01101: get_reg = reg_name ? "$t5" : "$13";
			5'b01110: get_reg = reg_name ? "$t6" : "$14";
			5'b01111: get_reg = reg_name ? "$t7" : "$15";
			5'b10000: get_reg = reg_name ? "$s0" : "$16";
			5'b10001: get_reg = reg_name ? "$s1" : "$17";
			5'b10010: get_reg = reg_name ? "$s2" : "$18";
			5'b10011: get_reg = reg_name ? "$s3" : "$19";
			5'b10100: get_reg = reg_name ? "$s4" : "$20";
			5'b10101: get_reg = reg_name ? "$s5" : "$21";
			5'b10110: get_reg = reg_name ? "$s6" : "$22";
			5'b10111: get_reg = reg_name ? "$s7" : "$23";
			5'b11000: get_reg = reg_name ? "$t8" : "$24";
			5'b11001: get_reg = reg_name ? "$t9" : "$25";
			5'b11010: get_reg = reg_name ? "$s8" : "$26";
			5'b11011: get_reg = reg_name ? "$s9" : "$27";
			5'b11100: get_reg = reg_name ? "$gp" : "$28";
			5'b11101: get_reg = reg_name ? "$sp" : "$29";
			5'b11110: get_reg = reg_name ? "$fp" : "$30";
			5'b11111: get_reg = reg_name ? "$ra" : "$31";
		endcase
	end
	endfunction

	function [7:0] get_hex;
		input [3:0] num;
	begin
		case (num)
			4'b0000: get_hex = "0";
			4'b0001: get_hex = "1";
			4'b0010: get_hex = "2";
			4'b0011: get_hex = "3";
			4'b0100: get_hex = "4";
			4'b0101: get_hex = "5";
			4'b0110: get_hex = "6";
			4'b0111: get_hex = "7";
			4'b1000: get_hex = "8";
			4'b1001: get_hex = "9";
			4'b1010: get_hex = "A";
			4'b1011: get_hex = "B";
			4'b1100: get_hex = "C";
			4'b1101: get_hex = "D";
			4'b1110: get_hex = "E";
			4'b1111: get_hex = "F";
		endcase
	end
	endfunction

	wire [7:0] sp = 8'b0010_0000;

	wire [4*8-1:0] srs = {sp, get_reg(rs)}, srd = {sp, get_reg(rd)}, srt = {sp, get_reg(rt)};
	wire [4*8-1:0] soff = {get_hex(imm[15:12]), get_hex(imm[11:8]), get_hex(imm[7:4]), get_hex(imm[3:0])};
	wire [5*8-1:0] simm = {sp, get_hex(imm[15:12]), get_hex(imm[11:8]), get_hex(imm[7:4]), get_hex(imm[3:0])};
	wire [31:0] imm32_signed = imm[15] ? -{{16{imm[15]}}, imm} : {16'b0, imm};
	wire [6*8-1:0] simm_dec = {sp, get_hex(imm/10000%10), get_hex(imm/1000%10), get_hex(imm/100%10), get_hex(imm/10%10), get_hex(imm%10)};
	wire [7*8-1:0] simm_dec_signed = {sp, imm[15] ? "-" : " ",
											get_hex(imm32_signed/10000%10), get_hex(imm32_signed/1000%10),
											get_hex(imm32_signed/100%10), get_hex(imm32_signed/10%10), get_hex(imm32_signed%10)};

	wire [4*8-1:0] ssha = {sp, get_hex(sha)};
	// wire [10*8-1:0] saddr = {sp, get_, "_"}
	// wire _rdrsrt = {}

	wire [12*8-1:0] _rd_rs_rt = {srd, srs, srt};
	wire [12*8-1:0] _rd_rt_rs = {srd, srt, srs};
	wire [12*8-1:0] _rd_rt_sha = {srd, srt, ssha};
	wire [15*8-1:0] _rt_rs_imm = {srt, srs, imm_as_dec ? simm_dec : simm};
	wire [15*8-1:0] _rt_rs_imm_signed = {srt, srs, imm_as_dec ? simm_dec_signed : simm};
	wire [31:0] branch_npc = pc + 4 + {{14{imm[15]}}, imm, 2'b0};
	wire [24*8-1:0] _rs_rt_imm = {srs, srt, imm_as_dec ? simm_dec : simm, "[",
														get_hex(branch_npc[31:28]), get_hex(branch_npc[27:24]),
														get_hex(branch_npc[23:20]), get_hex(branch_npc[19:16]),
														get_hex(branch_npc[15:12]), get_hex(branch_npc[11:8]),
														get_hex(branch_npc[7:4]), get_hex(branch_npc[3:0]), "]"};
	wire [20*8-1:0] _rs_imm = {srs, imm_as_dec ? simm_dec : simm, "[",
												get_hex(branch_npc[31:28]), get_hex(branch_npc[27:24]),
											    get_hex(branch_npc[23:20]), get_hex(branch_npc[19:16]),
											    get_hex(branch_npc[15:12]), get_hex(branch_npc[11:8]),
											    get_hex(branch_npc[7:4]), get_hex(branch_npc[3:0]), "]"}; // branch
	wire [10*8-1:0] _rt_imm = {srt, imm_as_dec ? simm_dec : simm};
	wire [8*8-1:0] _rs_rt = {srs, srt};
	wire [9*8-1:0] _target = {" 0", get_hex(target[25:22]), get_hex(target[21:18]),
									get_hex(target[17:14]), get_hex(target[13:10]),
									get_hex(target[9:6]),   get_hex(target[5:2]), get_hex({target[1:0], 2'b0})};
	wire [8*8-1:0] _rd_rs = {srd, srs};
	wire [4*8-1:0] _rs = {srs};
	wire [4*8-1:0] _rd = {srd};
	wire [14*8-1:0] _rt_off_base = {srt, " ", soff, "(", srs[3*8-1:0], ")"};
	wire [4*8-1:0] _rt_rd = {srd};

    function [32*8-1:0] asm_ll;
        input [32*8-1:0] str;
    begin
        asm_ll = str;
        while (!asm_ll[32*8-1 -:8]) asm_ll = asm_ll << 8;
    end
    endfunction

	assign asm = asm_ll(
				beq ? {"beq", _rs_rt_imm} :
				bgez ? {"bgez", _rs_imm} :
				bgtz ? {"bgtz", _rs_imm} :
				blez ? {"blez", _rs_imm} :
				bltz ? {"bltz", _rs_imm} :
				bne ? {"bne", _rs_rt_imm} :
				j ? {"j", _target} :
				jal ? {"jal", _target} :
				jalr ? {"jalr", _rd_rs} :
				jr ? {"jr", _rs} :
				lb ? {"lb", _rt_off_base} :
				lbu ? {"lbu", _rt_off_base} :
				lh ? {"lh", _rt_off_base} :
				lhu ? {"lhu", _rt_off_base} :
				lw ? {"lw", _rt_off_base} :
				sb ? {"sb", _rt_off_base} :
				sh ? {"sh", _rt_off_base} :
				sw ? {"sw", _rt_off_base} :
				lui ? {"lui", _rt_imm} :
				add ? {"add", _rd_rs_rt} :
				addi ? {"addi", _rt_rs_imm_signed} :
				addiu ? {"addiu", _rt_rs_imm_signed} :
				addu ? {"addu", _rd_rs_rt} :
				And ? {"And", _rd_rs_rt} :
				andi ? {"andi", _rt_rs_imm} :
				div ? {"div", _rs_rt} :
				divu ? {"divu", _rs_rt} :
				mfhi ? {"mfhi", _rd} :
				mflo ? {"mflo", _rd} :
				mthi ? {"mthi", _rd} :
				mtlo ? {"mtlo", _rd} :
				mult ? {"mult", _rs_rt} :
				multu ? {"multu", _rs_rt} :
				Nor ? {"Nor", _rd_rs_rt} :
				Or ? {"Or", _rd_rs_rt} :
				ori ? {"ori", _rt_rs_imm} :
				sll ? {"sll", _rd_rt_sha} :
				sllv ? {"sllv", _rd_rt_rs} :
				slt ? {"slt", _rd_rs_rt} :
				slti ? {"slti", _rt_rs_imm_signed} :
				sltiu ? {"sltiu", _rt_rs_imm_signed} :
				sltu ? {"sltu", _rd_rs_rt} :
				sra ? {"sra", _rd_rt_sha} :
				srav ? {"srav", _rd_rt_rs} :
				srl ? {"srl", _rd_rt_sha} :
				srlv ? {"srlv", _rd_rt_rs} :
				sub ? {"sub", _rd_rs_rt} :
				subu ? {"subu", _rd_rs_rt} :
				Xor ? {"Xor", _rd_rs_rt} :
				xori ? {"xori", _rt_rs_imm} :
				"No Instr");

endmodule