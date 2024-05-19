// This program was cloned from: https://github.com/risclite/ARM9-compatible-soft-CPU-core
// License: Apache License 2.0

`timescale 1 ns/1 ns
`define DEL 2
module arm9_compitable_code(
          clk,
          cpu_en,
          cpu_restart,
          fiq,
          irq,
          ram_abort,
          ram_rdata,
          rom_abort,
          rom_data,
          rst,

          ram_addr,
          ram_cen,
          ram_flag,
          ram_wdata,
          ram_wen,
          rom_addr,
          rom_en 
        ); 


input            clk;
input            cpu_en;
input            cpu_restart;
input            fiq;
input            irq;
input            ram_abort;
input  [31:0]     ram_rdata;
input            rom_abort;
input  [31:0]     rom_data;
input            rst;


output [31:0]     ram_addr;
output           ram_cen;
output [3:0]     ram_flag;
output [31:0]     ram_wdata;
output           ram_wen;
output [31:0]     rom_addr;
output           rom_en;


/******************************************************/
//register definition area
/******************************************************/
reg              add_flag;
reg              all_code;
reg    [3:0]     cha_num;
reg              cha_vld;
reg    [31:0]     cmd;
reg    [31:0]     cmd_addr;
reg              cmd_flag;
reg              code_abort;
reg              code_flag;
reg    [31:0]     code_rm;
reg    [31:0]     code_rma;
reg    [4:0]     code_rot_num;
reg    [31:0]     code_rs;
reg    [2:0]     code_rs_flag;
reg    [31:0]     code_rsa;
reg              code_und;
reg              cond_satisfy;
reg              cpsr_c;
reg              cpsr_f;
reg              cpsr_i;
reg    [4:0]     cpsr_m;
reg              cpsr_n;
reg              cpsr_v;
reg              cpsr_z;
reg    [31:0]     dp_ans;
reg              extra_num;
reg              fiq_flag;
reg    [31:0]     go_data;
reg    [5:0]     go_fmt;
reg    [3:0]     go_num;
reg              go_vld;
reg              hold_en_dly;
reg              irq_flag;
reg              ldm_change;
reg    [3:0]     ldm_num;
reg    [3:0]     ldm_sel;
reg              ldm_usr;
reg              ldm_vld;
reg              multl_extra_num;
reg    [31:0]     r0;
reg    [31:0]     r1;
reg    [31:0]     r2;
reg    [31:0]     r3;
reg    [31:0]     r4;
reg    [31:0]     r5;
reg    [31:0]     r6;
reg    [31:0]     r7;
reg    [31:0]     r8_fiq;
reg    [31:0]     r8_usr;
reg    [31:0]     r9_fiq;
reg    [31:0]     r9_usr;
reg    [31:0]     ra_fiq;
reg    [31:0]     ra_usr;
reg    [3:0]     ram_flag;
reg    [31:0]     ram_wdata;
reg    [31:0]     rb_fiq;
reg    [31:0]     rb_usr;
reg    [31:0]     rc_fiq;
reg    [31:0]     rc_usr;
reg    [31:0]     rd;
reg    [31:0]     rd_abt;
reg    [31:0]     rd_fiq;
reg    [31:0]     rd_irq;
reg    [31:0]     rd_svc;
reg    [31:0]     rd_und;
reg    [31:0]     rd_usr;
reg    [31:0]     re;
reg    [31:0]     re_abt;
reg    [31:0]     re_fiq;
reg    [31:0]     re_irq;
reg    [31:0]     re_svc;
reg    [31:0]     re_und;
reg    [31:0]     re_usr;
reg    [63:0]     reg_ans;
reg    [31:0]     rf;
reg              rm_msb;
reg    [31:0]     rn;
reg    [31:0]     rn_register;
reg    [31:0]     rna;
reg    [31:0]     rnb;
reg              rs_msb;
reg    [31:0]     sec_operand;
reg    [10:0]     spsr;
reg    [10:0]     spsr_abt;
reg    [10:0]     spsr_fiq;
reg    [10:0]     spsr_irq;
reg    [10:0]     spsr_svc;
reg    [10:0]     spsr_und;
reg    [4:0]     sum_m;
reg    [31:0]     to_data;
reg    [3:0]     to_num;


/******************************************************/


/******************************************************/
//wire definition area
/******************************************************/
wire   [31:0]     and_ans;
wire   [31:0]     bic_ans;
wire             bit_cy;
wire             bit_ov;
wire             cha_rf_vld;
wire             cmd_is_b;
wire             cmd_is_bx;
wire             cmd_is_dp0;
wire             cmd_is_dp1;
wire             cmd_is_dp2;
wire             cmd_is_ldm;
wire             cmd_is_ldr0;
wire             cmd_is_ldr1;
wire             cmd_is_ldrh0;
wire             cmd_is_ldrh1;
wire             cmd_is_ldrsb0;
wire             cmd_is_ldrsb1;
wire             cmd_is_ldrsh0;
wire             cmd_is_ldrsh1;
wire             cmd_is_mrs;
wire             cmd_is_msr0;
wire             cmd_is_msr1;
wire             cmd_is_mult;
wire             cmd_is_multl;
wire             cmd_is_multlx;
wire             cmd_is_swi;
wire             cmd_is_swp;
wire             cmd_is_swpx;
wire             cmd_ok;
wire   [4:0]     cmd_sum_m;
wire   [31:0]     code;
wire             code_is_b;
wire             code_is_bx;
wire             code_is_dp0;
wire             code_is_dp1;
wire             code_is_dp2;
wire             code_is_ldm;
wire             code_is_ldr0;
wire             code_is_ldr1;
wire             code_is_ldrh0;
wire             code_is_ldrh1;
wire             code_is_ldrsb0;
wire             code_is_ldrsb1;
wire             code_is_ldrsh0;
wire             code_is_ldrsh1;
wire             code_is_mrs;
wire             code_is_msr0;
wire             code_is_msr1;
wire             code_is_mult;
wire             code_is_multl;
wire             code_is_swi;
wire             code_is_swp;
wire   [3:0]     code_rm_num;
wire             code_rm_vld;
wire   [3:0]     code_rn_num;
wire             code_rn_vld;
wire   [3:0]     code_rnhi_num;
wire             code_rnhi_vld;
wire   [3:0]     code_rs_num;
wire             code_rs_vld;
wire   [4:0]     code_sum_m;
wire   [10:0]     cpsr;
wire   [1:0]     cy_high_bits;
wire   [31:0]     eor_ans;
wire             fiq_en;
wire             go_rf_vld;
wire             high_bit;
wire             hold_en;
wire             hold_en_rising;
wire             int_all;
wire             irq_en;
wire   [31:0]     ldm_data;
wire             ldm_rf_vld;
wire   [63:0]     mult_ans;
wire   [31:0]     or_ans;
wire   [31:0]     r8;
wire   [31:0]     r9;
wire   [31:0]     ra;
wire   [31:0]     ram_addr;
wire             ram_cen;
wire             ram_wen;
wire   [31:0]     rb;
wire   [31:0]     rc;
wire   [31:0]     rf_b;
wire   [31:0]     rom_addr;
wire             rom_en;
wire   [31:0]     sum_middle;
wire   [31:0]     sum_rn_rm;
wire             to_rf_vld;
wire             to_vld;
wire             wait_en;


/******************************************************/



/*
下面分析命令。这时通过rom_en/rom_addr，指令已经取入rom_data了。我们把rom_data重命名为code，只是
为了分析之用，没有其他目的。
*/

assign code =  rom_data;

/*
下面一系列code_is_xxx是确认code到底是属于什么指令。应该说，每一个指令都有一个特征标志，如果它
的特征标志吻合，则可以确认这条32 bit的指令是属于什么指令了。那么根据指令，确认下面的行为。

*/

assign code_is_b =  ( code[27:25]==3'b101 );

assign code_is_bx =  ( {code[27:23],code[20],code[7],code[4]}==8'b00010001 );

assign code_is_dp0 =  ( code[27:25]==3'b0 ) & ~code[4] & ( ( code[24:23]!=2'b10 ) | code[20] );	

assign code_is_dp1 =  (code[27:25]==3'b0 ) & ~code[7] & code[4] & ( ( code[24:23]!=2'b10 ) | code[20] );

assign code_is_dp2 =  ( code[27:25]==3'b001 ) & ( ( code[24:23]!=2'b10 ) | code[20] );

assign code_is_ldm =  ( code[27:25]==3'b100 );

assign code_is_ldr0 =  ( code[27:25]==3'b010 );

assign code_is_ldr1 =  ( code[27:25]==3'b011 );

assign code_is_ldrh0 =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1011 ) & ~code[22];

assign code_is_ldrh1 =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1011 ) & code[22];	

assign code_is_ldrsb0 =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1101 ) & ~code[22];

assign code_is_ldrsb1 =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1101 ) & code[22];		

assign code_is_ldrsh0 =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1111 ) & ~code[22];

assign code_is_ldrsh1 =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1111 ) & code[22];	

assign code_is_mrs =  ({code[27:23],code[21:20],code[7],code[4]}==9'b000100000 );

assign code_is_msr0 =  ({code[27:23],code[21:20],code[7],code[4]}==9'b000101000 );

assign code_is_msr1 =  ( code[27:25]==3'b001 ) & ( code[24:23]==2'b10 ) & ~code[20];

assign code_is_mult =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1001 ) & ( code[24:23]==2'b00 );

assign code_is_multl =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1001 ) & ( code[24:23]==2'b01 );	

assign code_is_swi =  ( code[27:25]==3'b111 );

assign code_is_swp =  (code[27:25]==3'b0 ) & ( code[7:4]==4'b1001 ) & ( code[24:23]==2'b10 );	

/*
上面描述的code_is_xxx只是对code进行分类。但是all_code却是对code进行识别。看看它是否是合法指令。
如果它不是合法指令，则会进入undefined instruction中断。

*/

always @ ( code )
if ( code[27:25]==3'b0 )
    if ( ~code[4] )
	    if ( ( code[24:23]==2'b10 ) & ~code[20] )
            if ( ~code[21] )
                all_code =  ( code[19:16]==4'hf ) & ( code[11:0] == 12'b0 );
            else
                all_code =  ( code[18:17] == 2'b0 ) & ( code[15:12]==4'hf ) & ( code[11:4]==8'h0 );
        else
            all_code =  ( code[24:23]!=2'b10 ) | code[20];
    else if ( ~code[7] )
        if ( code[24:20]==5'b10010 )
            all_code =  ( code[19:4]==16'hfff1 );
        else
            all_code =  ( code[24:23]!=2'b10 ) | code[20];
    else if ( code[6:5]==2'b0 )
        if ( code[24:22]==3'b0 )
            all_code =  1'b1;
        else if ( code[24:23]==2'b01 )
            all_code =  1'b1;
        else if ( code[24:23]==2'b10 )
            all_code =  ( code[21:20]==2'b0 ) & ( code[11:8]==4'b0 );
        else
            all_code =  1'b0;
    else if ( code[6:5]==2'b01 )
        if ( ~code[22] )
            all_code =  ( code[11:8]==4'b0 );
        else
            all_code =  1'b1;
	else //if ( ( code[6:5]==2'b10 )|(code[6:5]==2'b11) )
	    if ( code[20] )
		    if ( ~code[22] )
			    all_code =  ( code[11:8]==4'b0 );
			else
			    all_code =  1'b1;
		else
		    all_code =  1'b0;
else if ( code[27:25]==3'b001 )
    if ( (code[24:23]==2'b10) & ~code[20] )
        all_code =  code[21] & ( code[18:17]==2'b0 ) & ( code[15:12]==4'hf );
    else
	    all_code =  ( code[24:23]!=2'b10 ) | code[20];
else if ( code[27:25]==3'b010 )
    all_code =  1'b1;
else if ( code[27:25]==3'b011 )
    all_code =  ~code[4];
else if ( code[27:25]==3'b100 )
    all_code =  1'b1;
else if ( code[27:25]==3'b101 )
    all_code =  1'b1;
else if ( code[27:25]==3'b111 )
    all_code =  code[24];
else 
    all_code =  1'b0;	


/*
下面从寄存器组里取数。下面的case语句是对code指令里[3:0]，也就是Rm进行取数。根据code[3:0]，则
相应寄存器组的数送给code_rma。rf之所以要加上4，是因为这是第二级：rf存放的是code对应地址+4; 而
ARM手册里Rm如果要取R15，则应该取code对应地址+8，所以这里要对rf加上4。

*/

always @ ( code or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7 or r8 or r9 or ra or rb or rc or rd or re or rf )
case ( code[3:0] )
4'h0 : code_rma =  r0;
4'h1 : code_rma =  r1;	
4'h2 : code_rma =  r2;
4'h3 : code_rma =  r3;
4'h4 : code_rma =  r4;
4'h5 : code_rma =  r5;	
4'h6 : code_rma =  r6;
4'h7 : code_rma =  r7;	
4'h8 : code_rma =  r8;
4'h9 : code_rma =  r9;	
4'ha : code_rma =  ra;
4'hb : code_rma =  rb;
4'hc : code_rma =  rc;
4'hd : code_rma =  rd;	
4'he : code_rma =  re;
4'hf : code_rma =  (rf+3'b100);
 endcase

 /*
code_sum_m主要用于LDM/STM指令。LDM/STM的code[15:0]，如果对应bit为1，表示应该加载或储存该寄存器。
这里把code[0]到code[15]加起来，是要得到参与LDM/STM的寄存器总数。

*/

assign code_sum_m =  (code[0]+code[1]+code[2]+code[3]+code[4]+code[5]+code[6]+code[7]+code[8]+code[9]+code[10]+code[11]+code[12]+code[13]+code[14]+code[15]);


/*
下面确定广义的Rm。我们知道，涉及到旋转和相乘都会用到乘法器，那么code_rm就是送给乘法器的一个乘数。
大多数情况是Rm。如果没有Rm域，也可以把常数送给code_rm，code_rm*code_rs(通常为1)还是等于该常数。
这样，保持了结构的一致。
比如：if ( code_is_ldrh1|code_is_ldrsb1|code_is_ldrsh1 )
    它的Rm是一个常数：{code[11:8],code[3:0]};
else if ( code_is_b )	如果指令是一个跳转指令，则跳转的长度由code[23:0]确定
    code_rm =  {{6{code[23]}},code[23:0],2'b0};
else if ( code_is_ldm ) LDM/STM的情况比较特殊；首个第二操作数比较特殊，根据参数：code[24:23]来确定。
    case( code[24:23] )
    2'd0 : code_rm =  {(code_sum_m - 1'b1),2'b0};
    2'd1 : code_rm =  0;
	2'd2 : code_rm =  {code_sum_m,2'b0};
	2'd3 : code_rm =  3'b100;
	endcase	
else if ( code_is_ldr0 ) LDR的某些指令用到了12 bit的常数
    code_rm =  code[11:0];	
else if ( code_is_msr1|code_is_dp2 ) MSR和data processing的某些指令页用到了8 bit的常数
    code_rm =  code[7:0];
else if ( code_is_multl & code[22] & code_rma[31] ) 如果是长乘法指令，code[22]指明是否是有符号乘法 
    code_rm =  ~code_rma + 1'b1;                   如果是有符号乘法的话，那么就要把有符号的Rm转化成无符号的Rm。
else if ( ( (code[6:5]==2'b10) & code_rma[31] ) & (code_is_dp0|code_is_dp1|code_is_ldr1)  )
    code_rm =  ~code_rma;     //下面是对ASR(算术右移)作一下特殊处理，如果Rm的最高位是1，则全体取反，等到移位后，再取反一次，则扩充的0，全变为1了。
else
    code_rm =  code_rma;	
*/

always @ ( code_is_ldrh1 or code_is_ldrsb1 or code_is_ldrsh1 or code or code_is_b or code_is_ldm or code_sum_m or code_is_ldr0 or code_is_msr1 or code_is_dp2 or code_is_multl or code_rma or code_is_dp0 or code_is_dp1 or code_is_ldr1 )
if ( code_is_ldrh1|code_is_ldrsb1|code_is_ldrsh1 )
   	code_rm =  {code[11:8],code[3:0]};
else if ( code_is_b )	
    code_rm =  {{6{code[23]}},code[23:0],2'b0};
else if ( code_is_ldm )
    case( code[24:23] )
    2'd0 : code_rm =  {(code_sum_m - 1'b1),2'b0};
    2'd1 : code_rm =  0;
	2'd2 : code_rm =  {code_sum_m,2'b0};
	2'd3 : code_rm =  3'b100;
	endcase
else if ( code_is_ldr0 )
    code_rm =  code[11:0];	
else if ( code_is_msr1|code_is_dp2 )
    code_rm =  code[7:0];
else if ( code_is_multl & code[22] & code_rma[31] )
    code_rm =  ~code_rma + 1'b1;
else if ( ( (code[6:5]==2'b10) & code_rma[31] ) & (code_is_dp0|code_is_dp1|code_is_ldr1)  )
    code_rm =  ~code_rma;
else
    code_rm =  code_rma;

/*
一般ARM的指令还要用到Rs。Rs一般对应的是：code[11:8]
rf要加上4的原理同code_rma。
*/


always @ ( code or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7 or r8 or r9 or ra or rb or rc or rd or re or rf )
case ( code[11:8] )
4'h0 : code_rsa =  r0;
4'h1 : code_rsa =  r1;	
4'h2 : code_rsa =  r2;
4'h3 : code_rsa =  r3;
4'h4 : code_rsa =  r4;
4'h5 : code_rsa =  r5;	
4'h6 : code_rsa =  r6;
4'h7 : code_rsa =  r7;	
4'h8 : code_rsa =  r8;
4'h9 : code_rsa =  r9;	
4'ha : code_rsa =  ra;
4'hb : code_rsa =  rb;
4'hc : code_rsa =  rc;
4'hd : code_rsa =  rd;	
4'he : code_rsa =  re;
4'hf : code_rsa =  (rf+3'b100);
endcase	 

/*
由于很多命令要用到移位。移位的数目由code_rot_num给出。它根据情况不同。
一般逻辑左移的话：移位数目不变；其他情况：需要取反加一。
但在MSR1和DP2指令里，默认是循环右移，所以移位数目需要循环加一。
（此时的移位数目为：{code[11:8],1'b0}）
*/


always @ ( code_is_dp0 or code_is_ldr1 or code or code_is_dp1 or code_rsa or code_is_msr1 or code_is_dp2 )
if ( code_is_dp0|code_is_ldr1 )
    code_rot_num =  ( code[6:5] == 2'b00 ) ? code[11:7] : ( ~code[11:7]+1'b1 );
else if ( code_is_dp1 )
    code_rot_num =  ( code[6:5] == 2'b00 ) ? code_rsa[4:0] : ( ~code_rsa[4:0]+1'b1 );
else if ( code_is_msr1|code_is_dp2 )
    code_rot_num =  { (~code[11:8]+1'b1),1'b0 };
else
    code_rot_num =  5'b0;

/*
下面开始准备乘法器的第二个操作数：code_rs。
如果是长乘法，而且是有符号乘法的话，那么Rs就要进行符号转换，把它变成无符号数。
如果是乘法指令：code_rs = code_rsa。
除此之外，乘法器就用作旋转了。那么code_rs = 1'b1 << code_rot_num。

*/	

always @ ( code_is_multl or code or code_rsa or code_is_mult or code_rot_num )
if ( code_is_multl )
    if ( code[22] & code_rsa[31] )
	    code_rs =  ~code_rsa + 1'b1;
	else
	    code_rs =  code_rsa;
else if ( code_is_mult )
    code_rs =  code_rsa;
else begin
    code_rs =  32'b0;
	code_rs[code_rot_num] = 1'b1;
    end
	
/*
code_rm * code_rs，结果为：64 bit

*/	
		
assign mult_ans =  code_rm * code_rs;	

/*
下面还要确认那些指令里：code[3:0]是指的是一个寄存器。code指令执行的一个要素是它使用的寄存器没有被上一个指令改写。
所以把本指令的Rm提出来，和下一个要改写寄存器进行比较，如果不等，则code继续执行，否则插入一个空指令。

code_flag是code是否有效的标志。通常情况下code都是有效的，只有在跳转指令时，还驻存在code的指令是无效的.
*/

assign code_rm_vld =  code_flag & ( code_is_msr0|code_is_dp0|code_is_bx|code_is_dp1|code_is_mult|code_is_multl|code_is_swp|code_is_ldrh0|code_is_ldrsb0|code_is_ldrsh0|code_is_ldr1 );

assign code_rm_num =  code[3:0];

assign code_rs_vld =  code_flag & ( code_is_dp1|code_is_mult|code_is_multl );

assign code_rs_num =  code[11:8];

assign code_rn_vld =  code_flag & ( code_is_dp0|code_is_dp1|code_is_multl|code_is_swp|code_is_ldrh0|code_is_ldrh1|code_is_ldrsb0|code_is_ldrsb1|code_is_ldrsh0|code_is_ldrsh1|code_is_dp2|code_is_ldr0|code_is_ldr1|code_is_ldm );

assign code_rn_num =  code[19:16];

assign code_rnhi_vld =  code_flag & ( code_is_mult|code_is_multl|((code_is_ldrh0|code_is_ldrh1|code_is_ldr0|code_is_ldr1)& ~code[20]) );

assign code_rnhi_num =  code[15:12];	

/*
好了，第二级的乘法运算计算完毕，下一步是把相关的数据保存入寄存器，留给第三级使用。
reg_ans是首当其冲。它保存的是乘法的结果。
这里hold_en是什么意思？在ARM指令里，有些指令是不可能一个周期执行完毕的，比如SWP、LDM/STM、MULTL指令。
碰到这样的指令，就需要暂时停止流水线，让这条指令再工作一个周期。hold_en就是标示这样的状态的。
所以一般情况下：reg_ans = mult_ans；但是在LDM/STM时，就需要对reg_ans做额外的处理。
如果是递加存储，则对reg_ans进行递加；否则递减。
在cmd_sum_m == 0时，是对Rn进行回写。此时，强制reg_ans等于code_sum_m。由于这时候的code不是当前的LDM/STM指令
所以要预先把code_sum_m保存下来，这就是sum_m的由来。
*/

always @ ( posedge clk or posedge rst )
if ( rst )
    sum_m <= #`DEL 5'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    sum_m <= #`DEL  code_sum_m;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    reg_ans <= #`DEL 64'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    reg_ans <= #`DEL  mult_ans;
	else if ( cmd_is_ldm )
	    if ( cmd_sum_m==5'b1 )
		    reg_ans[6:2] <= #`DEL sum_m;	
	    else if ( cmd[23] )
		    reg_ans[6:2] <= #`DEL reg_ans[6:2] + 1'b1;
		else
		    reg_ans[6:2] <= #`DEL reg_ans[6:2] - 1'b1;
	else;
else;

/*
在下一级里，Rm和Rs已经不需要用了。但是Rm和Rs的某些信息，在下一级还是需要的。在这里，
我们用寄存器保存下来，以备下一级使用。

code_rs_flag主要保存Rs的一些信息，比如它是否大于32，是否等于32，是否等于0.
rm_msb保存的是Rm的符号位，因为在有符号乘法里，还需要对reg_ans进行取反
rs_msb是Rs的符号位。
*/


always @ ( posedge clk or posedge rst )
if ( rst )
    code_rs_flag <= #`DEL 3'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    if ( code_is_dp1 )
		    code_rs_flag <= #`DEL  {(code_rsa[7:0]>6'd32),(code_rsa[7:0]==6'd32),(code_rsa[7:0]==8'd0)};
		else
		    code_rs_flag <= #`DEL  0;
	else;
else;


always @ ( posedge clk or posedge rst )
if ( rst )
    rm_msb <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
        rm_msb <= #`DEL  code_rma[31];
    else;
else;


always @ ( posedge clk or posedge rst )
if ( rst )
    rs_msb <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
        rs_msb <= #`DEL  code_rsa[31];
    else;
else;	

/*
rom_abort触发取指令中断，但是如果这条指令的前一条指令是跳转指令，这时，就算
rom_abort=1'b1，也不触发取指令中断。所以我们把rom_abort保存下来，如果它对应的指令
能执行，则触发中断；否则不触发中断。

code_und是保存当前指令是否合法的标志。同样，当它对应的指令需要执行时，如果标示它非法，
则进入undefied instruction中断。


*/

always @ ( posedge clk or posedge rst )
if ( rst )
    code_abort <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    code_abort <= #`DEL  rom_abort;
	else;
else;


always @ ( posedge clk or posedge rst )
if ( rst )
    code_und <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    code_und <= #`DEL  ~all_code;
	else;
else;


/*
好了，第二级的操作差不多执行完毕了。下面进入第三级的执行。是不是觉得code_is_xxx这样表示一个指令的方法非常好用。
那么第三级我们还是使用这个方法，标示一个指令到底属于哪一类。首先，我们把code原版拷贝到一个寄存器里。
这个寄存器是：cmd。

一般情况下，如果cmd里面的指令不需要多个周期执行，那么hold_en == 1‘b0，则会把下一条指令code保存入cmd。
如果cmd还需要执行，那么hold_en = 1'b1。能让hold_en等于1的指令有：SWP、MULTL、LDM/STM。

SWP和MULTL需要两个周期完成，那么如果cmd_is_swp为真的话，hold_en = 1；为了很简单的区分swp的两次执行的序号。
我们用cmd[27:25]==3'b110表示swp的下一次swpx。所以在cmd_is_swp时，置位cmd[27:25].那么我们可以认为cmd_is_swpx是
SWP的后半拍。

multl同swp类似。

对于LDM/STM，我采用的方法是：从低到高，依次执行。如果低位的寄存器执行完操作，则对该bit进行清除。直到所有的
cmd[15:0]全为0，则所有的ldm/stm全部执行完毕。


*/

always @ ( posedge clk or posedge rst )
if ( rst )
    cmd <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    cmd <= #`DEL  code;
	else if ( cmd_is_swp ) begin
	    cmd[27:25] <= #`DEL 3'b110;
		cmd[15:12] <= #`DEL cmd[3:0];
		end
	else if ( cmd_is_multl )
	    cmd[27:25] <= #`DEL 3'b110;	   
    else if ( cmd_is_ldm ) begin
	    cmd[0] <= #`DEL 1'b0;
		cmd[1] <= #`DEL cmd[0] ? cmd[1] : 1'b0;
		cmd[2] <= #`DEL (|(cmd[1:0])) ? cmd[2] : 1'b0;
		cmd[3] <= #`DEL (|(cmd[2:0])) ? cmd[3] : 1'b0;		
		cmd[4] <= #`DEL (|(cmd[3:0])) ? cmd[4] : 1'b0;
		cmd[5] <= #`DEL (|(cmd[4:0])) ? cmd[5] : 1'b0;	
		cmd[6] <= #`DEL (|(cmd[5:0])) ? cmd[6] : 1'b0;
		cmd[7] <= #`DEL (|(cmd[6:0])) ? cmd[7] : 1'b0;		
		cmd[8] <= #`DEL (|(cmd[7:0])) ? cmd[8] : 1'b0;
		cmd[9] <= #`DEL (|(cmd[8:0])) ? cmd[9] : 1'b0;	
		cmd[10] <= #`DEL (|(cmd[9:0])) ? cmd[10] : 1'b0;	
		cmd[11] <= #`DEL (|(cmd[10:0])) ? cmd[11] : 1'b0;	    
		cmd[12] <= #`DEL (|(cmd[11:0])) ? cmd[12] : 1'b0;	 
		cmd[13] <= #`DEL (|(cmd[12:0])) ? cmd[13] : 1'b0;	
		cmd[14] <= #`DEL (|(cmd[13:0])) ? cmd[14] : 1'b0;	 
		cmd[15] <= #`DEL (|(cmd[14:0])) ? cmd[15] : 1'b0;	 		
        end	
	else;
else;

assign cmd_is_b =  ( cmd[27:25]==3'b101 );

assign cmd_is_bx =  ( {cmd[27:23],cmd[20],cmd[7],cmd[4]}==8'b00010001 );

assign cmd_is_dp0 =  ( cmd[27:25]==3'b0 ) & ~cmd[4] & ( ( cmd[24:23]!=2'b10 ) | cmd[20] );	

assign cmd_is_dp1 =  (cmd[27:25]==3'b0 ) & ~cmd[7] & cmd[4] & ( ( cmd[24:23]!=2'b10 ) | cmd[20] );

assign cmd_is_dp2 =  ( cmd[27:25]==3'b001 ) & ( ( cmd[24:23]!=2'b10 ) | cmd[20] );

assign cmd_is_ldm =  ( cmd[27:25]==3'b100 );

assign cmd_is_ldr0 =  ( cmd[27:25]==3'b010 );

assign cmd_is_ldr1 =  ( cmd[27:25]==3'b011 );

assign cmd_is_ldrh0 =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1011 ) & ~cmd[22];

assign cmd_is_ldrh1 =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1011 ) & cmd[22];	

assign cmd_is_ldrsb0 =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1101 ) & ~cmd[22];

assign cmd_is_ldrsb1 =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1101 ) & cmd[22];		

assign cmd_is_ldrsh0 =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1111 ) & ~cmd[22];

assign cmd_is_ldrsh1 =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1111 ) & cmd[22];	

assign cmd_is_mrs =  ({cmd[27:23],cmd[21:20],cmd[7],cmd[4]}==9'b000100000 );

assign cmd_is_msr0 =  ({cmd[27:23],cmd[21:20],cmd[7],cmd[4]}==9'b000101000 );

assign cmd_is_msr1 =  ( cmd[27:25]==3'b001 ) & ( cmd[24:23]==2'b10 ) & ~cmd[20];

assign cmd_is_mult =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1001 ) & ( cmd[24:23]==2'b00 );

assign cmd_is_multl =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1001 ) & ( cmd[24:23]==2'b01 );	

assign cmd_is_multlx =  ( cmd[27:24]==4'b1100 );

assign cmd_is_swi =  ( cmd[27:25]==3'b111 );

assign cmd_is_swp =  (cmd[27:25]==3'b0 ) & ( cmd[7:4]==4'b1001 ) & ( cmd[24:23]==2'b10 );	

assign cmd_is_swpx =  ( cmd[27:24]==4'b1101 );

/*
第二级主要以乘法为主；那么第三级是以加法为主。现在就开始为加法准备第二操作数。

第二操作数是从reg_ans里面选取的。
如果是移位，那么根据移位的方式，从reg_ans里面挑出32位的数据，作为第二操作数；
如果是长乘法，第一次送出低32位，第二次送出高32位。
*/



always @ ( cmd_is_dp0 or cmd_is_ldr1 or reg_ans or rm_msb or cmd or cpsr_c or cmd_is_dp1 or code_rs_flag or cmd_is_msr1 or cmd_is_dp2 or cmd_is_multlx )
if ( cmd_is_dp0|cmd_is_ldr1 )
    case(cmd[6:5])
	2'b00 : sec_operand =  reg_ans[31:0];
	2'b01 : sec_operand =  reg_ans[63:32];
	2'b10 : sec_operand =  (rm_msb ? ~reg_ans[63:32] : reg_ans[63:32]); 
    2'b11 : sec_operand =  (cmd[11:7]==5'b0)?{cpsr_c,reg_ans[31:1]} : (reg_ans[63:32]|reg_ans[31:0]);
	endcase
else if ( cmd_is_dp1 )
    case(cmd[6:5])
	2'b00 : sec_operand =  ( code_rs_flag[2:1]!=2'b0 )? 32'b0: reg_ans[31:0];
	2'b01 : sec_operand =  ( code_rs_flag[2:1]!=2'b0 )? 32'b0: ( code_rs_flag[0] ? reg_ans[31:0] : reg_ans[63:32] );
	2'b10 : sec_operand =  ( code_rs_flag[2:1]!=2'b0 )? {32{rm_msb}} : ( code_rs_flag[0] ? (rm_msb? ~reg_ans[31:0] : reg_ans[31:0]) : ( rm_msb ? ~reg_ans[63:32]:reg_ans[63:32] ) );
	2'b11 : sec_operand =  ( code_rs_flag[1]|code_rs_flag[0] ) ? reg_ans[31:0] : ( reg_ans[63:32]|reg_ans[31:0] );
	endcase
else if ( cmd_is_msr1|cmd_is_dp2 )
    sec_operand =  reg_ans[63:32]|reg_ans[31:0];
else if ( cmd_is_multlx )
    sec_operand =  reg_ans[63:32];
else 
	sec_operand =  reg_ans[31:0];	

/*
下面准备加法器的第二个加数：Rn
由于大多数都用的是：cmd[19:16]，乘法指令要用到cmd[15:12]。
那么我们用rna和rnb分别对应。

*/


always @ ( cmd or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7 or r8 or r9 or ra or rb or rc or rd or re or rf )
case ( cmd[15:12] )
4'h0 : rna =  r0;
4'h1 : rna =  r1;	
4'h2 : rna =  r2;
4'h3 : rna =  r3;
4'h4 : rna =  r4;
4'h5 : rna =  r5;	
4'h6 : rna =  r6;
4'h7 : rna =  r7;	
4'h8 : rna =  r8;
4'h9 : rna =  r9;	
4'ha : rna =  ra;
4'hb : rna =  rb;
4'hc : rna =  rc;
4'hd : rna =  rd;	
4'he : rna =  re;
4'hf : rna =  rf;
endcase	

always @ ( cmd or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7 or r8 or r9 or ra or rb or rc or rd or re or rf )
case ( cmd[19:16] )
4'h0 : rnb =  r0;
4'h1 : rnb =  r1;	
4'h2 : rnb =  r2;
4'h3 : rnb =  r3;
4'h4 : rnb =  r4;
4'h5 : rnb =  r5;	
4'h6 : rnb =  r6;
4'h7 : rnb =  r7;	
4'h8 : rnb =  r8;
4'h9 : rnb =  r9;	
4'ha : rnb =  ra;
4'hb : rnb =  rb;
4'hc : rnb =  rc;
4'hd : rnb =  rd;	
4'he : rnb =  re;
4'hf : rnb =  rf;
endcase	 	

/*
一般情况下，可以直接让Rn等于上面的rnb。但是在LDM指令里，有时候Rn对应的寄存器也在加载列表里。
那么Rn在执行LDM指令时，会在加载数据的情况下，被改变。Rn就会发生变化。所以在这里，我们在hold_en有
上升沿的时候，把rnb保存到一个寄存器rn_register里面去。在LDM/STM时，让Rn链接到rn_register上。


*/

always @ ( posedge clk or posedge rst )
if ( rst )
    hold_en_dly <= #`DEL 1'd0;
else if ( cpu_en )
    hold_en_dly <= #`DEL  hold_en;
else;

assign hold_en_rising =  hold_en & ~hold_en_dly;

always @ ( posedge clk or posedge rst )
if ( rst )
    rn_register <= #`DEL 32'd0;
else if ( cpu_en )
    if ( hold_en_rising )
	    rn_register <= #`DEL  rnb;
	else;
else;

/*
现在，来组织Rn。
在BX指令时，需要把Rm送入R15，我们令Rn=0；那么可以把加数送入R15内。
在DP类的MOV指令时，也碰到同bx一样的问题，也可以命令Rn=0来解决。
在乘法指令里，如果不同时进行加法，则Rn=0；
在B指令里， Rn强制等于R15；

*/

always @ ( * )
if ( cmd_is_bx|((cmd_is_dp0|cmd_is_dp1|cmd_is_dp2)&((cmd[24:21]==4'b1101)|(cmd[24:21]==4'b1111)))|(cmd_is_multlx & ~cmd[21]) )
    rn =  0;
else if ( cmd_is_mult|cmd_is_multl )
    if ( cmd[21] )
        rn =  rna;
	else
	    rn =  0;
else if ( cmd_is_b )
    rn =  rf;
else if ( hold_en & hold_en_dly )
    rn =  rn_register;
else
    rn =  rnb;


/*
下面是加法器的各种参量。
第一个判断到底是加法还是减法。1表示加法，0表示减法。
一般的乘法和跳转指令，用的是加法；
如果是长乘法，则根据是否为有符号乘法，如果是有符号乘法，则根据两个乘数的符号位，确定是否为减法。
如果是数据处理DP指令，则根据opcode来确定加/减法。
如果是其他指令，这里主要是数据加载存储指令，加减法由cmd[23]来确定。
*/

always @ ( cmd_is_mult or cmd_is_b or cmd_is_bx or cmd_is_multl or cmd_is_multlx or cmd or rm_msb or rs_msb or cmd_is_dp0 or cmd_is_dp1 or cmd_is_dp2  )
if ( cmd_is_mult|cmd_is_b|cmd_is_bx )
    add_flag =  1'b1;
else if ( cmd_is_multl|cmd_is_multlx )
    add_flag =  cmd[22] ? ~( rm_msb^rs_msb ) : 1'b1;
else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
    add_flag =  (cmd[24:21]==4'b0100)|(cmd[24:21]==4'b0101)|(cmd[24:21]==4'b1011)|(cmd[24:21]==4'b1101);
else
    add_flag =  cmd[23];
	
/*
加法器一般是：a[31:0] + b[31:0] + c，下面确定最后1 bit的c。
对于长乘法，需要两次这样的加法；第一次加reg_ans[31:0]；第二次加：reg_ans[63:32]；
那么第一次的加法的进位C，在第二次加法时，也要用到。multl_extra_num起这个作用。
当cmd_is_multl有效执行时，bit_cy写入multl_extra_num。

*/	

always @ ( posedge clk or posedge rst )
if ( rst )
    multl_extra_num <= #`DEL 1'd0;
else if ( cpu_en )
    if ( cmd_ok & cmd_is_multl )
        multl_extra_num <= #`DEL  bit_cy;
    else
        multl_extra_num <= #`DEL  0;
else;		

/*
下面确定extra_num。
在cmd_is_multlx，表示multl的后续的一个指令。由于reg_ans已经保存了乘法的结果。
只需要进行两次加法，就完成了这条64 bit的长乘指令了。这时，extra_num等于上面的
multl_extra_num。

*/
	

always @ ( cmd_is_mult or cmd_is_multl or cmd_is_dp0 or cmd_is_dp1 or cmd_is_dp2 or cmd or cpsr_c or cmd_is_multlx or multl_extra_num )
if ( cmd_is_mult | cmd_is_multl )
    extra_num = 1'b0;
else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
    case ( cmd[24:21])
	4'b0010 : extra_num = 1'b0;
    4'b0011 : extra_num = 1'b1;
    4'b0100 : extra_num = 1'b0;
    4'b0101 : extra_num = cpsr_c;
    4'b0110 : extra_num = ~cpsr_c;
    4'b0111 : extra_num = cpsr_c;
	4'b1111 : extra_num = 1'b1;
    default: extra_num = 1'b0;
    endcase
else if ( cmd_is_multlx )
    extra_num = multl_extra_num;
else
    extra_num = 1'b0;

/*
下面进行加法运算。
先将后31bit进行相加减，这样做是为了更好的计算OV标志。

*/

assign sum_middle =  add_flag ? ( rn[30:0] + sec_operand[30:0] + extra_num ) : ( rn[30:0] - sec_operand[30:0] - extra_num );	

assign cy_high_bits =  add_flag ? ( rn[31] + sec_operand[31] + sum_middle[31] ) : ( rn[31] - sec_operand[31] - sum_middle[31] );

assign bit_cy =  cy_high_bits[1];

assign high_bit =  cy_high_bits[0];	

assign bit_ov =  bit_cy ^ sum_middle[31];		

assign sum_rn_rm =  {high_bit,sum_middle[30:0]};


/*
下面是对数据处理的结果进行汇总。在数据处理指令里，不仅有加减法运算，还有与，或等逻辑操作。
由于Rn，和第二操作数已经组织完毕，只需用assign语句声明即可。

*/

assign and_ans =  rn & sec_operand;

assign eor_ans =  rn ^ sec_operand;

assign or_ans =  rn | sec_operand;

assign bic_ans =  rn & ~sec_operand;


always @ ( cmd or and_ans or eor_ans or sum_rn_rm or or_ans or bic_ans )
case ( cmd[24:21] )
4'h0 : dp_ans =  and_ans;
4'h1 : dp_ans =  eor_ans;
4'h2 : dp_ans =  sum_rn_rm;
4'h3 : dp_ans =  ~sum_rn_rm;
4'h4 : dp_ans =  sum_rn_rm;
4'h5 : dp_ans =  sum_rn_rm;
4'h6 : dp_ans =  sum_rn_rm;
4'h7 : dp_ans =  ~sum_rn_rm;
4'h8 : dp_ans =  and_ans;
4'h9 : dp_ans =  eor_ans;
4'ha : dp_ans =  sum_rn_rm;
4'hb : dp_ans =  sum_rn_rm;
4'hc : dp_ans =  or_ans;
4'hd : dp_ans =  sum_rn_rm;
4'he : dp_ans =  bic_ans;
4'hf : dp_ans =  sum_rn_rm;
endcase
	
/*
上面已经把ARM7的数据流程描述清楚了。下面，则要使用我们已经组织起来的数据去改写CPSR或寄存器组。
在前面,code和cmd是这两级的主要标志，我们分别给code和cmd一个标志，表明code和cmd是否有效。
code什么时候无效呢？code一般情况下，都是有效的，只有在下面两种情况下无效：
1，中断发生。中断一来，预先取出的指令code变成废指令了。此时，需要从中断向量重新取指令，我们只需
   令code_flag = 0 即可；
2，R15被改写。道理同上，如果PC(R15)改变了，则需要从新的地址取指令，预先取出的指令code自然无效。
   to_rf_vld cha_rf_vld go_rf_vld ldm_rf_vld是各种改变R15的标志，一旦它们有效，R15被放入新值，
   则code也要被置为无效。

*/
	
always @ ( posedge clk or posedge rst )
if ( rst )
    code_flag <= #`DEL 1'd0;
else if ( cpu_en )
    if ( int_all | to_rf_vld | cha_rf_vld | go_rf_vld | ldm_rf_vld )
	    code_flag <= #`DEL  0;
	else
	    code_flag <= #`DEL  1;
else;
	
/*	
cmd_flag同code_flag类似。它是cmd的标志。一旦中断发生，cmd_flag同样要被清零。
一般来说，cmd_flag = code_flag。特殊情况是：R15被改变，这时，它也同样要置位0。
还用一种情况：wait_en。
wait_en标示这样的情况，比如 cmd =(mov r0,#10); code=(mul r1,r1,r0)。也就是
先执行：r0 = 10; 再执行：r1 =r1*r0.但是cod的case引用的R0是不等于10的，如果code
紧随cmd执行的话，一定会有错误的结果。那么我们插入一个空指令。
插入空指令的方法是：cmd_flag = 0; code和code_flag保持不变。由于cmd_flag = 0,不会
对寄存器组和CPSR进行任何改变，但是有了这么一个空指令，#10已经写入R0了。

还有一种情况，如果hold_en=1，那么这时多周期命令还要继续执行，cmd_flag将保持不变。
	
*/	
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_flag <= #`DEL 1'd0;
else if ( cpu_en )
    if ( int_all )
	    cmd_flag <= #`DEL  0;
	else if ( ~hold_en )
	    if ( wait_en | to_rf_vld | cha_rf_vld | go_rf_vld )
		    cmd_flag <= #`DEL  0;
		else
		    cmd_flag <= #`DEL  code_flag;
	else;
else;
	
/*
有了cmd_flag，可以总结一下，一个指令有效执行的条件：
1，没有中断发生，一旦中断发生，则该指令强制取消；
2，cmd_flag有效。cmd是一个有效的cmd。
3，ARM的前面的条件标志满足，这就是下面的cond_satisfy
如果这三个条件满足了，那么我们认为cmd是可以放心的执行的。
*/

always @ ( * )
case ( cmd[31:28] )
4'h0 : cond_satisfy =  ( cpsr_z==1'b1 );
4'h1 : cond_satisfy =  ( cpsr_z==1'b0 );
4'h2 : cond_satisfy =  ( cpsr_c==1'b1 );
4'h3 : cond_satisfy =  ( cpsr_c==1'b0 );
4'h4 : cond_satisfy =  ( cpsr_n==1'b1 );
4'h5 : cond_satisfy =  ( cpsr_n==1'b0 );
4'h6 : cond_satisfy =  ( cpsr_v==1'b1 );
4'h7 : cond_satisfy =  ( cpsr_v==1'b0 );
4'h8 : cond_satisfy =  ( cpsr_c==1'b1 )&(cpsr_z==1'b0);
4'h9 : cond_satisfy =  ( cpsr_c==1'b0 )|(cpsr_z==1'b1);
4'ha : cond_satisfy =  ( cpsr_n==cpsr_v);
4'hb : cond_satisfy =  ( cpsr_n!=cpsr_v);
4'hc : cond_satisfy =  ( cpsr_z==1'b0)&(cpsr_n==cpsr_v);
4'hd : cond_satisfy =  ( cpsr_z==1'b1)|(cpsr_n!=cpsr_v);
4'he : cond_satisfy =  1'b1;
4'hf : cond_satisfy =  1'b0;
endcase



assign cmd_ok =  ~int_all & cmd_flag & cond_satisfy;	
	
/*
只有三条指令：SWP MULTL LDM/STM才会导致hold_en等于1。但前提是这条指令有效，也就是cmd_ok==1。
如果hold_en =1 ；swp->swpx; multl->multlx；ldm/stm会把寄存器的对应值递减，一直到减为0为止
*/


assign cmd_sum_m =  (cmd[0]+cmd[1]+cmd[2]+cmd[3]+cmd[4]+cmd[5]+cmd[6]+cmd[7]+cmd[8]+cmd[9]+cmd[10]+cmd[11]+cmd[12]+cmd[13]+cmd[14]+cmd[15]);


assign hold_en =  cmd_ok & ( cmd_is_swp | cmd_is_multl | ( cmd_is_ldm & (cmd_sum_m !=5'b0) ) );


/*
从下面起讲讲中断。

irq_flag和fiq_flag是用来对irq、fiq进行缓冲。原因是希望irq和fiq中断只发生在有命令执行的时候。
因为如果这两个中断发生在跳转的时候，这时，没有指令在执行，就无法保存跳转地址。以IRQ中断为例，
如果irq==1时，irq_flag = 1。命令执行标志是：cmd_flag，如果它为1'b1，表示有命令执行，这时，可以
消除irq_flag了。

注意：cpu_en用在所有的寄存器描述里面。

*/
always @ ( posedge clk or posedge rst )
if ( rst )
    irq_flag <= #`DEL 1'b0;
else if ( cpu_en )
    if ( irq )
         irq_flag <= #`DEL  1'b1;
    else if ( cmd_flag )
       irq_flag <= #`DEL  1'b0;
    else;
else;


always @ ( posedge clk or posedge rst )
if ( rst )
    fiq_flag <= #`DEL 1'b0;
else if ( cpu_en )
	if ( fiq )
	     fiq_flag <= #`DEL  1'b1;
    else if ( cmd_flag )
	   fiq_flag <= #`DEL  1'b0;
    else;
else;

/*
这两句描述和上面是紧密相连的。以IRQ中断为例：在irq_flag和cmd_flag同时为1时，表示引入了一个IRQ中断。
但是这个中断是否执行，还要看中断禁止标志位：cpsr_i。当cpsr_i==1时，这时，IRQ中断是禁止的，则irq_en
=1'b0，不会让IRQ中断影响系统执行命令；否则IRQ中断如果是允许的，则irq_en = 1；会导入ARM进入IRQ中断。

*/
assign irq_en =  irq_flag & cmd_flag & ~cpsr_i;


assign fiq_en =  fiq_flag & cmd_flag & ~cpsr_f;

/*
int_all是有中断发生的情况。
1，cpu_restart是最高级别的中断，
2，ram_abort是读写RAM发生错误的中断
3，fiq_en,irq_en是上面触发的中断
4，code_abort和code_und是针对code的属性。在这一级，code已经变成了cmd，如果该cmd有效，那么它的这些坏属性就会引导入中断。
5，SWI软中断，和前面的一个区别是：条件一定要满足。

*/

assign int_all =  cpu_restart|ram_abort|fiq_en|irq_en|( cmd_flag & ( code_abort|code_und|(cond_satisfy & cmd_is_swi)));


/*
下面将改写CPSR。
在改写之前，需要赋值给一个寄存器：ldm_change，它是LDM在改变PC后，需要同时加载spsr到cpsr。
由于cmd在后来会不断变化，所以在code进入cmd的同时，把这种情况写入一个寄存器保存

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    ldm_change <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    ldm_change <= #`DEL  code[22] & code[20] & code[15];
	else;
else;

/*
下面讨论cpsr_n。
1，msr指令，把第二操作数直接加载给cpsr。
2，数据处理指令：如果改变了R15，那么同时要把spsr送入cpsr;如果不改变R15，则等于结果的第32位:dp_ans
3，乘法指令，等于加法器输出的最高位
4，LDM指令，在加载R15的情况下，如果状态标志置位，spsr也需要改变。

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_n <= #`DEL 1'd0;
else if ( cpu_en )
    if ( cmd_ok )
	    if ( cmd_is_msr0|cmd_is_msr1 )
		    if ( ~cmd[22] & cmd[19] )
                cpsr_n <= #`DEL  sec_operand[31];
			else;	
		else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
		    if ( cmd[20] )
			    if ( cmd[15:12]==4'hf )
				    cpsr_n <= #`DEL  spsr[10];
				else 
				    cpsr_n <= #`DEL  dp_ans[31];
			else;
		else if ( cmd_is_mult|cmd_is_multlx )
		    if ( cmd[20] )
			    cpsr_n <= #`DEL  sum_rn_rm[31];
			else;
		else if ( cmd_is_ldm & ( cmd_sum_m==5'b0 ) & ldm_change )
		     cpsr_n <= #`DEL  spsr[10];
		else;
	else;
else;

/*
z标志同n标志类似，它是标志结果是否等于0。

*/
always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_z <= #`DEL 1'd0;
else if ( cpu_en )
    if ( cmd_ok )
	    if ( cmd_is_msr0|cmd_is_msr1 )
		    if ( ~cmd[22] & cmd[19] )
                cpsr_z <= #`DEL  sec_operand[30];
			else;	
		else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
		    if ( cmd[20] )
			    if ( cmd[15:12]==4'hf )
				    cpsr_z <= #`DEL  spsr[9];
				else 
				    cpsr_z <= #`DEL  (dp_ans==32'b0);
			else;
		else if ( cmd_is_mult|cmd_is_multl )
		    if ( cmd[20] )
			    cpsr_z <= #`DEL  (sum_rn_rm==32'b0);
			else;
		else if ( cmd_is_multlx & cmd[20] )
		    cpsr_z <= #`DEL   cpsr_z & (sum_rn_rm==32'b0);
		else if ( cmd_is_ldm & ( cmd_sum_m==5'b0 ) & ldm_change )
		     cpsr_z <= #`DEL  spsr[9];
		else;
	else;
else;

/*
c标志是进位标志。
在数据处理指令里，如果是加法运算，c放入bit_cy；如果是减法运算，放入~bit_cy；如果都不是，则放入移位的进位。

*/
always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_c <= #`DEL 1'd0;
else if ( cpu_en )
    if ( cmd_ok )
        if ( cmd_is_msr0|cmd_is_msr1 )
		    if ( ~cmd[22] & cmd[19] )
                cpsr_c <= #`DEL  sec_operand[29];
			else;	
        else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
            if ( cmd[20] )
                if ( cmd[15:12]==4'hf )
                    cpsr_c <= #`DEL  spsr[8];
                else if ( (cmd[24:21]==4'b1011)|(cmd[24:21]==4'b0100)|(cmd[24:21]==4'b0101)|(cmd[24:21]==4'b0011)|(cmd[24:21]==4'b0111) )
				    cpsr_c <= #`DEL  bit_cy;
				else if ( (cmd[24:21]==4'b1010)|(cmd[24:21]==4'b0010)|(cmd[24:21]==4'b0110) )
				    cpsr_c <= #`DEL  ~bit_cy;
				else if ( cmd_is_dp1 & ~code_rs_flag[0] )
				    case ( cmd[6:5] )
				    2'b00 : cpsr_c <= #`DEL  code_rs_flag[2]? 1'b0 : ( code_rs_flag[1]? reg_ans[0] :  reg_ans[32] );
					2'b01 : cpsr_c <= #`DEL  code_rs_flag[2]? 1'b0 : ( code_rs_flag[1]? reg_ans[31] : reg_ans[31] );
					2'b10 : cpsr_c <= #`DEL  code_rs_flag[2]? rm_msb : ( code_rs_flag[1]? rm_msb : ( rm_msb ? ~reg_ans[31]: reg_ans[31]) );
					2'b11 : cpsr_c <= #`DEL  code_rs_flag[1]? cpsr_c : reg_ans[31];
					endcase	
                else if ( cmd_is_dp2 )
                    cpsr_c <= #`DEL  	reg_ans[31];
				else if ( cmd_is_dp0 ) 
				    case ( cmd[6:5] )
				    2'b00 : cpsr_c <= #`DEL  (cmd[11:7]==5'b0) ? cpsr_c : reg_ans[32];
					2'b01 : cpsr_c <= #`DEL  reg_ans[31];
					2'b10 : cpsr_c <= #`DEL  ( rm_msb ? ~reg_ans[31]: reg_ans[31]);
					2'b11 : cpsr_c <= #`DEL  (cmd[11:7]==5'b0) ? reg_ans[0]:reg_ans[31];
					endcase
				else;
			else;
		else if ( cmd_is_ldm & ( cmd_sum_m==5'b0 ) & ldm_change )
		     cpsr_c <= #`DEL  spsr[8];
		else;
	else;
else;


/*
v标志在正常的指令执行中，只有在数据处理指令的加减法操作中，才会被改变。
*/

always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_v <= #`DEL 1'd0;
else if ( cpu_en )
    if ( cmd_ok )
        if ( cmd_is_msr0|cmd_is_msr1 )
		    if ( ~cmd[22] & cmd[19] )
                cpsr_v <= #`DEL  sec_operand[28];
			else;	
        else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
            if ( cmd[20] )
                if ( cmd[15:12]==4'hf )
                    cpsr_v <= #`DEL  spsr[7];
                else if ( (cmd[24:21]==4'd2)|(cmd[24:21]==4'd3)|(cmd[24:21]==4'd4)|(cmd[24:21]==4'd5)|(cmd[24:21]==4'd6)|(cmd[24:21]==4'd7)|(cmd[24:21]==4'd10)|(cmd[24:21]==4'd11) )
                    cpsr_v <= #`DEL  bit_ov;
				else;	
            else;
		else if ( cmd_is_ldm & ( cmd_sum_m==5'b0 ) & ldm_change )
		     cpsr_v <= #`DEL  spsr[7];
        else;
    else;
else;


/*
cpsr_i是CPSR的I控制标志，它是用来控制禁止IRQ中断的。
一般在中断到来时，IRQ中断首先被禁止。
如果要用指令修改CPSR，则只能在特权模式下才能修改。所以如果是用户模式，cpsr_i是不能被修改的。
后面列出了cpsr_i的三种修改情况：
1，MSR，这是把寄存器的值或常数放在CPSR的情况
2，DP，这是在写PC时，顺便把SPSR送入CPSR
3，LDM，这也是在写PC时，顺便把SPSR送入CPSR。

*/


always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_i <= #`DEL 1'd0;
else if ( cpu_en )
    if ( int_all )
        cpsr_i <= #`DEL  1;
    else if ( cmd_ok & ( cpsr_m != 5'b10000 ) )
        if ( cmd_is_msr0|cmd_is_msr1 )
            if ( ~cmd[22] & cmd[16]  )
                cpsr_i <= #`DEL  sec_operand[7];
            else;
        else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
            if ( cmd[20] )
                if 	( cmd[15:12]==4'hf )
                    cpsr_i <= #`DEL  spsr[6];
                else;
            else;
		else if ( cmd_is_ldm & ( cmd_sum_m==5'b0 ) & ldm_change )
		     cpsr_i <= #`DEL  spsr[6];
        else;
    else;
else;

/*
cpsr_f和cpsr_i的情况类似，只是FIQ中断只有在reset中断和FIQ中断到来时，才禁止FIQ中断；
其他情况下，不禁止FIQ中断。

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_f <= #`DEL 1'd0;
else if ( cpu_en )
    if ( cpu_restart | fiq_en ) 
        cpsr_f <= #`DEL  1;
    else if ( cmd_ok & ( cpsr_m != 5'b10000 ) )
        if ( cmd_is_msr0|cmd_is_msr1 )
            if ( ~cmd[22] & cmd[16]  )
                cpsr_f <= #`DEL  sec_operand[6];
            else;
        else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
            if ( cmd[20] )
                if 	( cmd[15:12]==4'hf )
                    cpsr_f <= #`DEL  spsr[5];
                else;
            else;
		else if ( cmd_is_ldm & ( cmd_sum_m==5'b0 ) & ldm_change )
		     cpsr_f <= #`DEL  spsr[5];
        else;
    else;
else;


/*
cpsr_m决定ARM7的工作模式，在各种中断来临后，cpsr_m根据中断进行切换。
由指令修改的方式，和cpsr_i, cpsr_f类似

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_m <= #`DEL 5'b10011;
else if ( cpu_en )
    if ( cpu_restart )
        cpsr_m <= #`DEL  5'b10011;
    else if ( fiq_en )
        cpsr_m <= #`DEL  5'b10001;
    else if ( ram_abort )
        cpsr_m <= #`DEL  5'b10111;
    else if ( irq_en )
        cpsr_m <= #`DEL  5'b10010;
    else if ( cmd_flag & code_abort )
        cpsr_m <= #`DEL  5'b10111;
    else if ( cmd_flag & code_und )
        cpsr_m <= #`DEL  5'b11011;
    else if ( cmd_flag & cond_satisfy & cmd_is_swi )
        cpsr_m <= #`DEL  5'b10011; 
    else if ( cmd_ok & ( cpsr_m != 5'b10000 ) )
        if ( cmd_is_msr0|cmd_is_msr1 )
            if ( ~cmd[22] & cmd[16]  )
                cpsr_m <= #`DEL  sec_operand[4:0];
            else;
        else if ( cmd_is_dp0|cmd_is_dp1|cmd_is_dp2 )
            if ( cmd[20] )
                if 	( cmd[15:12]==4'hf )
                    cpsr_m <= #`DEL  spsr[4:0];
                else;
            else;
		else if ( cmd_is_ldm & ( cmd_sum_m==5'b0 ) & ldm_change )
		     cpsr_m <= #`DEL  spsr[4:0];
        else;
    else;
else;     	

/*
cpsr是上面各项的集合
*/

assign cpsr =  { cpsr_n,cpsr_z,cpsr_c,cpsr_v,cpsr_i,cpsr_f,cpsr_m};	

/*
下面是每种模式的SPSR。SPSR的作用是中断到来时，暂存CPSR。
对于ABT模式，是在读写数据中断和指令读取中断时进入。
由于指令读取错误的优先级是低于fiq和irq的，所以只有在fiq、irq没有发生，code_abort有效时，才进入abt中断。

*/


always @ ( posedge clk or posedge rst )
if ( rst )
    spsr_abt <= #`DEL 11'd0;
else if ( cpu_en )
    if ( ram_abort | ( ~fiq_en & ~irq_en & ( cmd_flag & code_abort ) ) )
	    spsr_abt <= #`DEL  cpsr;
    else if ( cmd_ok & ( cpsr_m==5'b10111) & ( cmd_is_msr0|cmd_is_msr1 ) & cmd[22] )
        spsr_abt <= #`DEL  {{cmd[19]?sec_operand[31:28]:spsr_abt[10:7]},{cmd[16]?{sec_operand[7:6],sec_operand[4:0]}:spsr_abt[6:0]}}; 	
    else;
else;

/*
fiq中断和ram_abort中断的情况比较特殊。
如果两者同时发生，fiq优先处理，但是处理完毕后，必须进入ram_abort的处理。
所以这里fiq中断保存的返回状况是：ram_abort中断的模式。

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    spsr_fiq <= #`DEL 11'd0;
else if ( cpu_en )
    if ( fiq_en )
         if ( ram_abort )
            spsr_fiq <= #`DEL  {cpsr_n,cpsr_z,cpsr_c,cpsr_v,1'b1,cpsr_f,5'b10111};
        else 
            spsr_fiq <= #`DEL  cpsr;
    else if ( cmd_ok & ( cpsr_m==5'b11011) & ( cmd_is_msr0|cmd_is_msr1 ) & cmd[22] )
        spsr_fiq <= #`DEL  {{cmd[19]?sec_operand[31:28]:spsr_fiq[10:7]},{cmd[16]?{sec_operand[7:6],sec_operand[4:0]}:spsr_fiq[6:0]}}; 	
    else;
else;		

/*
irq中断服务于 irq_en有效时

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    spsr_irq <= #`DEL 11'd0;
else if ( cpu_en )
    if ( ~ram_abort & ~fiq_en & irq_en )
	    spsr_irq <= #`DEL  cpsr;
    else if ( cmd_ok & ( cpsr_m==5'b10010) & ( cmd_is_msr0|cmd_is_msr1 ) & cmd[22] )
        spsr_irq <= #`DEL  {{cmd[19]?sec_operand[31:28]:spsr_irq[10:7]},{cmd[16]?{sec_operand[7:6],sec_operand[4:0]}:spsr_irq[6:0]}}; 	
    else;
else;

/*
svc中断是服务于指令swi有效

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    spsr_svc <= #`DEL 11'd0;
else if ( cpu_en )
    if ( ~ram_abort & ~fiq_en & ~irq_en & ( cmd_flag & ~code_abort & ~code_und & (cond_satisfy & cmd_is_swi) ) )
	    spsr_svc <= #`DEL  cpsr;
    else if ( cmd_ok & ( cpsr_m==5'b10011) & ( cmd_is_msr0|cmd_is_msr1 ) & cmd[22] )
        spsr_svc <= #`DEL  {{cmd[19]?sec_operand[31:28]:spsr_svc[10:7]},{cmd[16]?{sec_operand[7:6],sec_operand[4:0]}:spsr_svc[6:0]}}; 	
    else;
else;

/*
und中断是在发现指令是不能识别的代码时发生的中断
*/

always @ ( posedge clk or posedge rst )
if ( rst )
    spsr_und <= #`DEL 11'd0;
else if ( cpu_en )
    if ( ~ram_abort & ~fiq_en & ~irq_en & ( cmd_flag & ~code_abort & code_und ) )
	    spsr_und <= #`DEL  cpsr;
    else if ( cmd_ok & ( cpsr_m==5'b11011) & ( cmd_is_msr0|cmd_is_msr1 ) & cmd[22] )
        spsr_und <= #`DEL  {{cmd[19]?sec_operand[31:28]:spsr_und[10:7]},{cmd[16]?{sec_operand[7:6],sec_operand[4:0]}:spsr_und[6:0]}}; 	
    else;
else;

/*
spsr随着cpsr_m的不同而不同。

*/

always @ ( cpsr_m or spsr_svc or spsr_abt or spsr_irq or spsr_fiq or spsr_und or cpsr )
if ( cpsr_m == 5'b10011 )
    spsr = spsr_svc;
else if ( cpsr_m == 5'b10111 )
    spsr = spsr_abt; 
else if ( cpsr_m == 5'b10010 )
    spsr = spsr_irq;
else if ( cpsr_m == 5'b10001 )
    spsr = spsr_fiq;
else if ( cpsr_m == 5'b11011 )
    spsr = spsr_und;
else
    spsr = cpsr; 

/*
写完了CPSR和SPSR，下面准备写寄存器组。
寄存器的修改有两个来源，一是从寄存器的运算写入；二是加载于存储器，下面准备的是寄存器的运算。
cmd_is_mrs : 把cpsr/spsr送入寄存器组
(cmd_is_dp0|cmd_is_dp1|cmd_is_dp2) : 把数据处理结果dp_ans 送入寄存器组
cmd_is_mult|cmd_is_multl|cmd_is_multlx：乘法的结果送入寄存器组
(cmd_is_ldrh0|cmd_is_ldrh1|cmd_is_ldrsb0|cmd_is_ldrsb1|cmd_is_ldrsh0|cmd_is_ldrsh1|cmd_is_ldr0|cmd_is_ldr1)：这主要是地址回写
cmd_is_ldm ： 也是地址回写。

*/

/*
to_vld解决：写不写的问题
to_num解决：写那一个寄存器的问题
to_data解决：写什么数据的问题。
*/

assign to_vld =  cmd_ok & ( cmd_is_mrs|((cmd_is_dp0|cmd_is_dp1|cmd_is_dp2)&(cmd[24:23]!=2'b10))|cmd_is_mult|cmd_is_multl|cmd_is_multlx|((cmd_is_ldrh0|cmd_is_ldrh1|cmd_is_ldrsb0|cmd_is_ldrsb1|cmd_is_ldrsh0|cmd_is_ldrsh1|cmd_is_ldr0|cmd_is_ldr1)&( cmd[21]| ~cmd[24]))|(cmd_is_ldm &(cmd_sum_m==5'b0)&cmd[21]) );


always @ ( cmd_is_mrs or cmd_is_dp0 or cmd_is_dp1 or cmd_is_dp2 or cmd_is_multl or cmd )
if (cmd_is_mrs|(cmd_is_dp0|cmd_is_dp1|cmd_is_dp2)|cmd_is_multl)
    to_num =  cmd[15:12];
else
    to_num =  cmd[19:16];

	
always @ ( cmd_is_mrs or cmd or spsr or cpsr or cmd_is_dp0 or cmd_is_dp1 or cmd_is_dp2 or dp_ans or sum_rn_rm )
if ( cmd_is_mrs )
    to_data =  cmd[22] ? {spsr[10:7],20'b0,spsr[6:5],1'b0,spsr[4:0]} : {cpsr[10:7],20'b0,cpsr[6:5],1'b0,cpsr[4:0]};
else if (cmd_is_dp0|cmd_is_dp1|cmd_is_dp2)
    to_data =  dp_ans;
else
    to_data =  sum_rn_rm; 	

/*
写入R15的情况比较特殊，只有在dp b bx指令时，才可以修改R15。
*/
	
assign to_rf_vld =  cmd_ok & ( ( (cmd[15:12]==4'hf) & ( (cmd_is_dp0|cmd_is_dp1|cmd_is_dp2) & ( cmd[24:23]!=2'b10 ) ) ) | ( cmd_is_b | cmd_is_bx ) ); 

/*
cha_vld 和 cha_num是用来加载存储器RAM的数据进入寄存器组的，在这一个周期里，才发出读信号，下一个周期里，数据才会得到。
有了cha_vld和cha_num的标示，如果下一个指令需要用到同样的寄存器，那么这时，就发生了数据互锁，不得不插入一个空指令了。

*/	

always @ ( cmd_ok or cmd_is_ldrh0 or cmd_is_ldrh1 or cmd_is_ldrsb0 or cmd_is_ldrsb1 or cmd_is_ldrsh0 or cmd_is_ldrsh1 or cmd_is_ldr0 or cmd_is_ldr1 or cmd or cmd_is_swp )
if ( cmd_ok )
    cha_vld =  (( cmd_is_ldrh0|cmd_is_ldrh1|cmd_is_ldrsb0|cmd_is_ldrsb1|cmd_is_ldrsh0|cmd_is_ldrsh1|cmd_is_ldr0|cmd_is_ldr1 ) & cmd[20])|cmd_is_swp;
else
    cha_vld =  0;

always @ ( cmd )
cha_num =  cmd[15:12];	


assign cha_rf_vld =  cha_vld & ( cha_num==4'hf );

/*
go_vld go_num等于cha_vld cha_num，在下一个周期里，存储在RAM的数据已经取出，可以打包送入寄存器组了

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    go_vld <= #`DEL 1'd0;
else if ( cpu_en )
    go_vld <= #`DEL  cha_vld;
else;



always @ ( posedge clk or posedge rst )
if ( rst )
    go_num <= #`DEL 4'd0;
else if ( cpu_en )
    go_num <= #`DEL  cha_num;
else;

/*
go_fmt是对应于go_vld/go_num的，go_vld回答送不送RAM读取的数据；go_num回答送到哪儿去；
go_fmt则回答怎么送。
因为在ARM7的LDR/LDM/LDRSB/LDRH这些指令里，有的是要写半字，有的写字节，有的要有符号
所以我们把这些信息暂存于go_fmt里，等到写入的时候，按照go_fmt的格式组织写入的数据。
go_fmt[5]指的是送入格式为字；
go_fmt[4]指的是送入格式为半字；
go_fmt[3]指的是送入格式为字节；
go_fmt[2]指的是送入格式为是否有符号
go_fmt[1:0]包含着读地址的最后两位，它为写入半字、字节服务的。

*/


always @ ( posedge clk or posedge rst )
if ( rst )
    go_fmt <= #`DEL 6'd0;
else if ( cpu_en )
   if ( cmd_is_ldr0|cmd_is_ldr1|cmd_is_swp )
        go_fmt <= #`DEL  cmd[22] ?{4'b0010,cmd_addr[1:0]}: {4'b1000,cmd_addr[1:0]};
    else if ( cmd_is_ldrh0|cmd_is_ldrh1 )
        go_fmt <= #`DEL  {4'b0100,cmd_addr[1:0]};
	else if ( cmd_is_ldrsb0|cmd_is_ldrsb1 )
	    go_fmt <= #`DEL  {4'b0011,cmd_addr[1:0]};
	else if ( cmd_is_ldrsh0|cmd_is_ldrsh1 )
        go_fmt <= #`DEL  {4'b0101,cmd_addr[1:0]};
	else if ( cmd_is_ldm )
	    go_fmt <= #`DEL  {4'b1000,cmd_addr[1:0]};
    else;
else;


assign go_rf_vld =  go_vld & (go_num==4'hf);

/*
go_data 则是按照go_fmt指定的格式组织ram_rdata。


*/

always @ ( go_fmt or ram_rdata )
if ( go_fmt[5] )
    go_data =  ram_rdata;
else if ( go_fmt[4] )
    if ( go_fmt[1] )
	    go_data =  {{16{go_fmt[2]&ram_rdata[31]}},ram_rdata[31:16]};
	else
	    go_data =  {{16{go_fmt[2]&ram_rdata[15]}},ram_rdata[15:0]};
else// if ( cha_reg_fmt[3] )
    case(go_fmt[1:0])
    2'b00 : go_data =  { {24{go_fmt[2]&ram_rdata[7]}}, ram_rdata[7:0] };
    2'b01 : go_data =  { {24{go_fmt[2]&ram_rdata[15]}}, ram_rdata[15:8] };	
    2'b10 : go_data =  { {24{go_fmt[2]&ram_rdata[23]}}, ram_rdata[23:16] };	
    2'b11 : go_data =  { {24{go_fmt[2]&ram_rdata[31]}}, ram_rdata[31:24] };	
    endcase	


/*
LDM送入的数据和LDR不同，原因是LDM有时候要导入USR模式下寄存器的数据，这个比较特殊，所以单独列于此。
在(cmd_sum_m!=0)时，用于存储寄存器的数据；在(cmd_sum_m==0)时，用于基址回写。
*/


always @ ( posedge clk or posedge rst )
if ( rst )
    ldm_vld <= #`DEL 1'd0;
else if ( cpu_en )
    ldm_vld <= #`DEL  cmd_ok & cmd_is_ldm & cmd[20] & (cmd_sum_m!=5'b0);
else;

/*
LDM是对一串寄存器操作。我采用的方法是操作完了一个寄存器，把对应位置为0，然后操作下一个
所以ldm_sel比较傻，则是对cmd从低到高，一个一个的判断。

*/

always @ ( cmd )
if ( cmd[0] )
    ldm_sel =  4'h0;
else if ( cmd[1] )
    ldm_sel =  4'h1; 
else if ( cmd[2] )
    ldm_sel =  4'h2; 
else if ( cmd[3] )
    ldm_sel =  4'h3; 
else if ( cmd[4] )
    ldm_sel =  4'h4; 
else if ( cmd[5] )
    ldm_sel =  4'h5; 
else if ( cmd[6] )
    ldm_sel =  4'h6; 
else if ( cmd[7] )
    ldm_sel =  4'h7; 
else if ( cmd[8] )
    ldm_sel =  4'h8; 
else if ( cmd[9] )
    ldm_sel =  4'h9; 
else if ( cmd[10] )
    ldm_sel =  4'ha; 
else if ( cmd[11] )
    ldm_sel =  4'hb; 
else if ( cmd[12] )
    ldm_sel =  4'hc; 
else if ( cmd[13] )
    ldm_sel =  4'hd; 
else if ( cmd[14] )
    ldm_sel =  4'he; 
else if ( cmd[15] )
    ldm_sel =  4'hf; 
else 
    ldm_sel =  4'h0;

	
always @ ( posedge clk or posedge rst )
if ( rst )
    ldm_num <= #`DEL 4'd0;
else if ( cpu_en )
    if ( cmd_is_ldm )
        ldm_num <= #`DEL  ldm_sel;
    else;
else;

/*
ldm_usr是标示一种只对USR模式下的寄存器操作的情况。

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    ldm_usr <= #`DEL 1'd0;
else if ( cpu_en )
    ldm_usr <= #`DEL  cmd_ok & cmd_is_ldm & cmd[20] &  cmd[22] & ~cmd[15];
else;

/*
ldm_data和go_data类似，直接引用。

*/

assign ldm_data =  go_data;

assign ldm_rf_vld =  (ldm_vld & ( ldm_num==4'hf ))|((cmd_ok & cmd_is_ldm & cmd[20])&(ldm_sel==4'hf));	


/*
有了to_vld go_vld 和 ldm_vld，我们可以知道修改寄存器组了。
下面是R0-R7的寄存器，它们只有一个，没有banked。
*/


always @ ( posedge clk or posedge rst )
if ( rst )
    r0 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h0 ) )
	    r0 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h0) )
	    r0 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h0 ) )
	    r0 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r1 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h1 ) )
	    r1 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h1 ) )
	    r1 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h1 ) )
	    r1 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r2 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h2 ) )
	    r2 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h2 ) )
	    r2 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h2 ) )
	    r2 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r3 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h3 ) )
	    r3 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h3 ) )
	    r3 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h3 ) )
	    r3 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r4 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h4 ) )
	    r4 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h4 ) )
	    r4 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h4 ) )
	    r4 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r5 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h5 ) )
	    r5 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h5 ) )
	    r5 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h5 ) )
	    r5 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r6 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h6 ) )
	    r6 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h6 ) )
	    r6 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h6 ) )
	    r6 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r7 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h7 ) )
	    r7 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h7 ) )
	    r7 <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h7 ) )
	    r7 <= #`DEL  to_data;
	else;
else;

/*
后面的R8-R12是banked，也就是R8 需要切换。这里每一个寄存器都对应两个，一个是_fiq 和 _usr.

*/

assign r8 =  (cpsr_m==5'b10001) ? r8_fiq : r8_usr;  


always @ ( posedge clk or posedge rst )
if ( rst )
    r8_fiq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h8 )& ( ~ldm_usr & (cpsr_m==5'b10001 ) ) )
	    r8_fiq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h8 ) & (cpsr_m==5'b10001 ) )
	    r8_fiq <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'h8 ) & (cpsr_m==5'b10001 )  )
	    r8_fiq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r8_usr <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h8 ) & ( ldm_usr | (cpsr_m!=5'b10001 ) ) )
	    r8_usr <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h8 ) & (cpsr_m!=5'b10001 ) )
	    r8_usr <= #`DEL  go_data;
	else if ( cmd_ok & to_vld & ( to_num== 4'h8 ) & (cpsr_m!=5'b10001 )  )
        r8_usr <= #`DEL  to_data;
	else;
else;

assign r9 =  (cpsr_m==5'b10001) ? r9_fiq : r9_usr;  


always @ ( posedge clk or posedge rst )
if ( rst )
    r9_fiq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h9 )& ( ~ldm_usr & (cpsr_m==5'b10001 ) ) )
	    r9_fiq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h9 ) & (cpsr_m==5'b10001 ) )
	    r9_fiq <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'h9 ) & (cpsr_m==5'b10001 )  )
	    r9_fiq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r9_usr <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h9 ) & ( ldm_usr | (cpsr_m!=5'b10001 ) ) )
	    r9_usr <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h9 ) & (cpsr_m!=5'b10001 ) )
	    r9_usr <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'h9 ) & (cpsr_m!=5'b10001 )  )
	    r9_usr <= #`DEL  to_data;
	else;
else;



assign ra =  (cpsr_m==5'b10001) ? ra_fiq : ra_usr;  

always @ ( posedge clk or posedge rst )
if ( rst )
    ra_fiq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'ha )& ( ~ldm_usr & (cpsr_m==5'b10001 ) ) )
	    ra_fiq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'ha ) & (cpsr_m==5'b10001 ) )
	    ra_fiq <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'ha ) & (cpsr_m==5'b10001 )  )
	    ra_fiq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    ra_usr <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'ha ) & ( ldm_usr | (cpsr_m!=5'b10001 ) ) )
	    ra_usr <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'ha ) & (cpsr_m!=5'b10001 ) )
	    ra_usr <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'ha ) & (cpsr_m!=5'b10001 )  )
	    ra_usr <= #`DEL  to_data;
	else;
else;


assign rb =  (cpsr_m==5'b10001) ? rb_fiq : rb_usr;  

always @ ( posedge clk or posedge rst )
if ( rst )
    rb_fiq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hb )& ( ~ldm_usr & (cpsr_m==5'b10001 ) ) )
	    rb_fiq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hb ) & (cpsr_m==5'b10001 ) )
	    rb_fiq <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hb ) & (cpsr_m==5'b10001 )  )
	    rb_fiq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    rb_usr <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hb ) & ( ldm_usr | (cpsr_m!=5'b10001 ) ) )
	    rb_usr <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hb ) & (cpsr_m!=5'b10001 ) )
	    rb_usr <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hb ) & (cpsr_m!=5'b10001 )  )
	    rb_usr <= #`DEL  to_data;
	else;
else;


assign rc =  (cpsr_m==5'b10001) ? rc_fiq : rc_usr;  


always @ ( posedge clk or posedge rst )
if ( rst )
    rc_fiq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hc )& ( ~ldm_usr & (cpsr_m==5'b10001 ) ) )
	    rc_fiq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hc ) & (cpsr_m==5'b10001 ) )
	    rc_fiq <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hc ) & (cpsr_m==5'b10001 )  )
	    rc_fiq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    rc_usr <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hc ) & ( ldm_usr | (cpsr_m!=5'b10001 ) ) )
	    rc_usr <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hc ) & (cpsr_m!=5'b10001 ) )
	    rc_usr <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hc ) & (cpsr_m!=5'b10001 )  )
	    rc_usr <= #`DEL  to_data;
	else;
else;


/*
R13和前面的不同，它有5个模式对应的寄存器。


*/


always @ ( cpsr_m or rd_fiq or rd_und or rd_irq or rd_abt or rd_svc or rd_usr )
case ( cpsr_m )
5'b10001 : rd = rd_fiq;
5'b11011 : rd = rd_und;
5'b10010 : rd = rd_irq;
5'b10111 : rd = rd_abt;  
5'b10011 : rd = rd_svc;
default  : rd = rd_usr;
endcase	

always @ ( posedge clk or posedge rst )
if ( rst )
    rd_abt <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hd )& ( ~ldm_usr & (cpsr_m==5'b10111 ) ) )
	    rd_abt <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hd ) & (cpsr_m==5'b10111 ) )
	    rd_abt <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hd ) & (cpsr_m==5'b10111 )  )
	    rd_abt <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    rd_fiq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hd )& ( ~ldm_usr & (cpsr_m==5'b10001 ) ) )
	    rd_fiq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hd ) & (cpsr_m==5'b10001 ) )
	    rd_fiq <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hd ) & (cpsr_m==5'b10001 )  )
	    rd_fiq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    rd_irq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hd )& ( ~ldm_usr & (cpsr_m==5'b10010 ) ) )
	    rd_irq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hd ) & (cpsr_m==5'b10010 ) )
	    rd_irq <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hd ) & (cpsr_m==5'b10010 )  )
	    rd_irq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    rd_svc <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hd )& ( ~ldm_usr & (cpsr_m==5'b10011 ) ) )
	    rd_svc <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hd ) & (cpsr_m==5'b10011 ) )
	    rd_svc <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hd ) & (cpsr_m==5'b10011 )  )
	    rd_svc <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    rd_und <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hd )& ( ~ldm_usr & (cpsr_m==5'b11011 ) ) )
	    rd_und <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hd ) & (cpsr_m==5'b11011 ) )
	    rd_und <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hd ) & (cpsr_m==5'b11011 )  )
	    rd_und <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    rd_usr <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hd ) & ( ldm_usr | ((cpsr_m!=5'b10001)&(cpsr_m!=5'b11011)&(cpsr_m!=5'b10010)&(cpsr_m!=5'b10111)&(cpsr_m!=5'b10011)) ) )
	    rd_usr <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hd ) & ((cpsr_m!=5'b10001)&(cpsr_m!=5'b11011)&(cpsr_m!=5'b10010)&(cpsr_m!=5'b10111)&(cpsr_m!=5'b10011)) )
	    rd_usr <= #`DEL  go_data;
	else if ( cmd_ok & to_vld  & ( to_num== 4'hd ) & ((cpsr_m!=5'b10001)&(cpsr_m!=5'b11011)&(cpsr_m!=5'b10010)&(cpsr_m!=5'b10111)&(cpsr_m!=5'b10011)) )
	    rd_usr <= #`DEL  to_data;
	else;
else;

/*
R14和R13不同的是：在中断发生时，要放入返回的地址。还有BL指令，同样也要放入返回的地址。


*/


always @ ( cpsr_m or re_fiq or re_und or re_irq or re_abt or re_svc or re_usr )
case ( cpsr_m )
5'b10001 : re = re_fiq;
5'b11011 : re = re_und;
5'b10010 : re = re_irq;
5'b10111 : re = re_abt;  
5'b10011 : re = re_svc;
default  : re = re_usr;
endcase	

always @ ( posedge clk or posedge rst )
if ( rst )
    re_abt <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ram_abort | ( ~fiq_en & ~irq_en & ( cmd_flag & code_abort ) ) )
        re_abt <= #`DEL  rf_b;		
    else if ( ldm_vld & ( ldm_num==4'he ) & ( ~ldm_usr & (cpsr_m==5'b10111) ) )
	    re_abt <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'he ) & (cpsr_m==5'b10111) )
	    re_abt <= #`DEL  go_data;
	else if ( cmd_ok & cmd_is_b & cmd[24] & (cpsr_m==5'b10111) )
	    re_abt <= #`DEL  rf_b;
	else if ( cmd_ok & to_vld  & ( to_num== 4'he ) & (cpsr_m==5'b10111) )
	    re_abt <= #`DEL  to_data;
	else;
else;		

/*
这里有一点要说的是：如果FIQ中断和ram_abort中断同时发生，那么先处理fiq，接着处理ram_abort中断
所以在fiq_en & ram_abort同时有效时，re_fiq保存的是：32‘h10，是ram_abort的启动地址。

*/

always @ ( posedge clk or posedge rst )
if ( rst )
    re_fiq <= #`DEL 32'd0;
else if ( cpu_en )
    if ( fiq_en )
	    if ( ram_abort )
		    re_fiq <= #`DEL  32'h10;
        else
		    re_fiq <= #`DEL  rf_b;
    else if ( ldm_vld & ( ldm_num==4'he ) & ( ~ldm_usr & (cpsr_m==5'b10001) ) )
	    re_fiq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'he ) & (cpsr_m==5'b10001) )
	    re_fiq <= #`DEL  go_data;
	else if ( cmd_ok & cmd_is_b & cmd[24] & (cpsr_m==5'b10001) )
	    re_fiq <= #`DEL  rf_b;
	else if ( cmd_ok & to_vld  & ( to_num== 4'he ) & (cpsr_m==5'b10001) )
	    re_fiq <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    re_irq <= #`DEL 32'd0;
else if ( cpu_en )
    if  ( ~ram_abort & ~fiq_en & irq_en )
        re_irq <= #`DEL  rf_b;	
    else if ( ldm_vld & ( ldm_num==4'he ) & ( ~ldm_usr & (cpsr_m==5'b10010) ) )
	    re_irq <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'he ) & (cpsr_m==5'b10010) )
	    re_irq <= #`DEL  go_data;
	else if ( cmd_ok & cmd_is_b & cmd[24] & (cpsr_m==5'b10010) )
	    re_irq <= #`DEL  rf_b;
	else if ( cmd_ok & to_vld  & ( to_num== 4'he ) & (cpsr_m==5'b10010) )
	    re_irq <= #`DEL  to_data;
	else;
else;		

always @ ( posedge clk or posedge rst )
if ( rst )
    re_svc <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ~ram_abort & ~fiq_en & ~irq_en & ( cmd_flag & ~code_abort & ~code_und & (cond_satisfy & cmd_is_swi) ) )
        re_svc <= #`DEL  rf_b;
    else if ( ldm_vld & ( ldm_num==4'he ) & ( ~ldm_usr & (cpsr_m==5'b10011) ) )
	    re_svc <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'he ) & (cpsr_m==5'b10011) )
	    re_svc <= #`DEL  go_data;
	else if ( cmd_ok & cmd_is_b & cmd[24] & (cpsr_m==5'b10011) )
	    re_svc <= #`DEL  rf_b;
	else if ( cmd_ok & to_vld  & ( to_num== 4'he ) & (cpsr_m==5'b10011) )
	    re_svc <= #`DEL  to_data;
	else;
else;		

always @ ( posedge clk or posedge rst )
if ( rst )
    re_und <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ~ram_abort & ~fiq_en & ~irq_en & ( cmd_flag & ~code_abort & code_und ) )
	    re_und <= #`DEL  rf_b;
    else if ( ldm_vld & ( ldm_num==4'he ) & ( ~ldm_usr & (cpsr_m==5'b11011) ) )
	    re_und <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'he ) & (cpsr_m==5'b11011) )
	    re_und <= #`DEL  go_data;
	else if ( cmd_ok & cmd_is_b & cmd[24] & (cpsr_m==5'b11011) )
	    re_und <= #`DEL  rf_b;
	else if ( cmd_ok & to_vld  & ( to_num== 4'he ) & (cpsr_m==5'b11011) )
	    re_und <= #`DEL  to_data;
	else;
else;		

always @ ( posedge clk or posedge rst )
if ( rst )
    re_usr <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'he ) & ( ldm_usr | ((cpsr_m!=5'b10001)&(cpsr_m!=5'b11011)&(cpsr_m!=5'b10010)&(cpsr_m!=5'b10111)&(cpsr_m!=5'b10011)) ) )
	    re_usr <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'he ) & ((cpsr_m!=5'b10001)&(cpsr_m!=5'b11011)&(cpsr_m!=5'b10010)&(cpsr_m!=5'b10111)&(cpsr_m!=5'b10011)) )
	    re_usr <= #`DEL  go_data;
	else if ( cmd_ok & cmd_is_b & cmd[24] & ((cpsr_m!=5'b10001)&(cpsr_m!=5'b11011)&(cpsr_m!=5'b10010)&(cpsr_m!=5'b10111)&(cpsr_m!=5'b10011)) )
	    re_usr <= #`DEL  rf_b;
	else if ( cmd_ok & to_vld  & ( to_num== 4'he ) & ((cpsr_m!=5'b10001)&(cpsr_m!=5'b11011)&(cpsr_m!=5'b10010)&(cpsr_m!=5'b10111)&(cpsr_m!=5'b10011)) )
	    re_usr <= #`DEL  to_data;
	else;
else;


/*
R15首先要对各个中断给出首地址。

*/


always @ ( posedge clk or posedge rst )
if ( rst )
    rf <= #`DEL 32'd0;
else if ( cpu_en )
    if ( cpu_restart )
	    rf <= #`DEL  32'h0000_0000;
	else if ( fiq_en )
	    rf <= #`DEL  32'h0000_001c;
	else if ( ram_abort )
	    rf <= #`DEL  32'h0000_0010;
	else if ( irq_en )
	    rf <= #`DEL  32'h0000_0018;
	else if ( cmd_flag & code_abort )
	    rf <= #`DEL  32'h0000_000c; 
	else if ( cmd_flag & code_und )
	    rf <= #`DEL  32'h0000_0004;
    else if ( cmd_flag & cond_satisfy & cmd_is_swi )
        rf <= #`DEL  32'h0000_0008;
	else if ( ldm_vld & (ldm_num==4'hf ) )
        rf <= #`DEL  ldm_data;	
	else if ( go_vld & (go_num==4'hf) )
        rf <= #`DEL  go_data;
    else if ( cmd_ok & (cmd_is_dp0|cmd_is_dp1|cmd_is_dp2) & ( cmd[24:23]!=2'b10 ) & ( cmd[15:12]==4'hf ) )
	    rf <= #`DEL  dp_ans;	
	else if ( cmd_ok & ( cmd_is_b | cmd_is_bx ) )
	    rf <= #`DEL  sum_rn_rm;
    else if ( ~hold_en & ~wait_en )
        rf <= #`DEL  rf + 4;
    else;
else;

assign rf_b =  rf - 3'd4;	



/*
以下是对读写RAM的读写接口进行描述。首先，总结要输出的地址。
它的地址要么是sum_rn_rm，要么是rn。

*/


always @ ( cmd_is_ldm or sum_rn_rm or cmd_is_swp or cmd_is_swpx or rn or cmd  )
if ( cmd_is_ldm )
    cmd_addr =  sum_rn_rm; 
else if ( cmd_is_swp|cmd_is_swpx )
    cmd_addr =  rn;
else if ( cmd[24] )
    cmd_addr =  sum_rn_rm;
else
    cmd_addr =  rn;

/*
输出的地址由于是对齐的，后两位总是0

*/
	
assign ram_addr =  {cmd_addr[31:2],2'b0};

/*
RAM的cen只有在读写RAM时，才等于1.

*/

assign ram_cen =  cpu_en & cmd_ok & (cmd_is_ldrh0|cmd_is_ldrh1|cmd_is_ldrsb0|cmd_is_ldrsb1|cmd_is_ldrsh0|cmd_is_ldrsh1|cmd_is_ldr0|cmd_is_ldr1|cmd_is_swp|cmd_is_swpx|(cmd_is_ldm &(cmd_sum_m!=5'b0)));

/*
RAM的wen是表示这一次打开cen是读还是写，一般由cmd[20]表示。

*/

assign ram_wen =  cmd_is_swp ? 1'b0 : ~cmd[20];	


/*
ram_flag是表示激活一个字里面哪一个字节的。比如LDR对整个字操作，则ram_flag =4'b1111；LDRH，对半字操作，则ram_flag=4'b1100或4'b0011，由cmd_addr[1]决定。
LDRB同理。

*/


always @ ( cmd_is_ldr0 or cmd_is_ldr1 or cmd_is_swp or cmd_is_swpx or cmd or cmd_addr or cmd_is_ldrh0 or cmd_is_ldrh1 or cmd_is_ldrsh0 or cmd_is_ldrsh1 or cmd_is_ldrsb0 or cmd_is_ldrsb1 )
if ( cmd_is_ldr0|cmd_is_ldr1|cmd_is_swp|cmd_is_swpx )
    ram_flag =  cmd[22]? (1'b1<<cmd_addr[1:0]):4'b1111;
else if (cmd_is_ldrh0|cmd_is_ldrh1|cmd_is_ldrsh0|cmd_is_ldrsh1 )
    ram_flag =  cmd_addr[1] ? 4'b1100 : 4'b0011;
else if ( cmd_is_ldrsb0|cmd_is_ldrsb1 ) 
    ram_flag =  1'b1<<cmd_addr[1:0];
else
    ram_flag =  4'b1111;

/*
ram_wdata是写数据。

*/
	
	
always @ ( cmd_is_ldm or cmd or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7 or r8 or r9 or ra or rb or rc or rd or re or r8_usr or r9_usr or ra_usr or rb_usr or rc_usr or rd_usr or re_usr or rf or cmd_is_ldr0 or cmd_is_ldr1 or cmd_is_swpx or rna or cmd_is_ldrh0 or cmd_is_ldrh1 )
if ( cmd_is_ldm )
    if ( cmd[0] )
        ram_wdata =  r0;
    else if ( cmd[1] )
        ram_wdata =  r1; 
    else if ( cmd[2] )
        ram_wdata =  r2; 
    else if ( cmd[3] )
        ram_wdata =  r3; 
    else if ( cmd[4] )
        ram_wdata =  r4; 
    else if ( cmd[5] )
        ram_wdata =  r5; 
    else if ( cmd[6] )
        ram_wdata =  r6; 
    else if ( cmd[7] )
        ram_wdata =  r7; 
    else if ( cmd[8] )
        ram_wdata =  cmd[22] ? r8_usr : r8; 
    else if ( cmd[9] )
        ram_wdata =  cmd[22] ? r9_usr : r9; 
    else if ( cmd[10] )
        ram_wdata =  cmd[22] ? ra_usr : ra; 
    else if ( cmd[11] )
        ram_wdata =  cmd[22] ? rb_usr : rb; 
    else if ( cmd[12] )
        ram_wdata =  cmd[22] ? rc_usr : rc; 
    else if ( cmd[13] )
        ram_wdata =  cmd[22] ? rd_usr : rd; 
    else if ( cmd[14] )
        ram_wdata =  cmd[22] ? re_usr : re; 
    else if ( cmd[15] )
        ram_wdata =  rf; 
    else 
        ram_wdata =  4'h0;
else if ( cmd_is_ldr0|cmd_is_ldr1|cmd_is_swpx )
    if ( cmd[22] )
	    ram_wdata =  { rna[7:0],rna[7:0],rna[7:0],rna[7:0]};
    else
        ram_wdata =  rna;	
else if ( cmd_is_ldrh0|cmd_is_ldrh1 )
    ram_wdata =  {rna[15:0],rna[15:0]};
else
    ram_wdata =  rna;


/*
下面是对ROM的接口。ROM在发生中断（int_all）、改变PC（to_rf_vld cha_rf_vld go_rf_vld）和数据互锁（wait_en），以及单指令多周期执行（hold_en）
不能对ROM读写新的指令了。
*/	
	
assign rom_en =  cpu_en & ( ~(int_all | to_rf_vld | cha_rf_vld | go_rf_vld | wait_en | hold_en ) );

assign rom_addr =  rf;	

/*
wait_en是指发现互锁的情况。像code_rm_vld  code_rs_vld code_rn_vld是指输入指令用到寄存器组的某个寄存器的情况，它们和正在改写的寄存器情况一对比，
如果发现两者重合，则出现了数据互锁。

*/

assign wait_en =  (code_rm_vld &cha_vld &(cha_num==code_rm_num))|(code_rm_vld & to_vld & (to_num==code_rm_num))|(code_rm_vld & go_vld &(go_num==code_rm_num)) | (code_rs_vld & cha_vld & (cha_num==code_rs_num))|(code_rs_vld & to_vld & (to_num==code_rs_num))|(code_rs_vld & go_vld & (go_num==code_rs_num)) | (code_rn_vld&cha_vld&(code_rn_num==cha_num)) |  (code_rnhi_vld&cha_vld&(code_rnhi_num==cha_num)) | (code_rm_vld & (ldm_vld & ~hold_en) & (ldm_num==code_rm_num) ) | (code_rs_vld & (ldm_vld & ~hold_en) & (ldm_num==code_rs_num) );


endmodule
