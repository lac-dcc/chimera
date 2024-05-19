// This program was cloned from: https://github.com/risclite/ARM9-compatible-soft-CPU-core
// License: Apache License 2.0

`timescale 1 ns/1 ns
`define DEL 2
module risclite_mx(
          clk,
          cpu_en,
          ram_rdata,
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
input  [31:0]    ram_rdata;
input  [31:0]    rom_data;
input            rst;


output [31:0]    ram_addr;
output           ram_cen;
output [3:0]     ram_flag;
output [31:0]    ram_wdata;
output           ram_wen;
output [31:0]    rom_addr;
output           rom_en;


/******************************************************/
//register definition area
/******************************************************/
reg              add_c;
reg    [1:0]     add_extra_num;
reg              adder_a_inv;
reg              adder_b_inv;
reg    [31:0]     cmd;
reg              cmd_flag;
reg              cmd_is_b;
reg              cmd_is_bx;
reg              cmd_is_dp;
reg              cmd_is_mrs;
reg              cmd_is_msr;
reg              cmd_is_swp;
reg              cmd_is_swpx;
reg    [4:0]     cmd_sum;
reg              code_cen;
reg              code_cha_flag;
reg              code_flag;
reg    [31:0]     code_rm;
reg    [31:0]     code_rs;
reg    [3:0]     code_rt_num;
reg              code_to_flag;
reg              cond_satisfy;
reg              cpsr_c;
reg              cpsr_c_in;
reg              cpsr_n;
reg              cpsr_n_in;
reg              cpsr_v;
reg              cpsr_v_in;
reg              cpsr_z;
reg              cpsr_z_in;
reg              dp0_rrx_shift;
reg              dp1_lsl_more;
reg              dp1_shift_zero;
reg    [31:0]     dp_ans;
reg    [31:0]     get_rn;
reg    [31:0]     go_data;
reg    [5:0]     go_fmt;
reg    [3:0]     cha_fmt;
reg    [3:0]     go_num;
reg              go_vld;
reg    [3:0]     ldm_num;
reg    [3:0]     ldm_sel;
reg              ldm_vld;
reg    [31:0]     r0;
reg    [31:0]     r1;
reg    [31:0]     r2;
reg    [31:0]     r3;
reg    [31:0]     r4;
reg    [31:0]     r5;
reg    [31:0]     r6;
reg    [31:0]     r7;
reg    [31:0]     r8;
reg    [31:0]     r9;
reg    [31:0]     ra;
reg    [3:0]     ram_flag;
reg    [31:0]     ram_wdata;
reg    [31:0]     rb;
reg    [31:0]     rc;
reg    [31:0]     rd;
reg    [31:0]     re;
reg    [31:0]     reg_rn;
reg    [31:0]     rf;
reg    [31:0]     rfx;
reg    [31:0]     rt;
reg    [31:0]     sec_operand;
reg              shift_bit;
reg    [6:0]     shift_num;
reg    [31:0]     shift_word;
reg    [31:0]     shifter_ans;
reg    [31:0]     shifter_high;
reg    [31:0]     shifter_low;
reg    [4:0]     shifter_rot_num;
reg    [4:0]     sum_m;
reg    [31:0]     to_data;
reg    [3:0]     to_num;


/******************************************************/


/******************************************************/
//wire definition area
/******************************************************/
wire   [31:0]     add_a;
wire   [31:0]     add_b;
wire             all_code;
wire   [31:0]     and_ans;
wire             bit_cy;
wire             bit_ov;
wire   [3:0]     cha_num;
wire             cha_rf_vld;
wire             cha_vld;
wire   [31:0]     cmd_addr;
wire             cmd_is_ldm;
wire             cmd_ok;
wire   [31:0]     code;
wire             code_is_b;
wire             code_is_bx;
wire             code_is_dp;
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
wire   [4:0]     code_sum;
wire   [31:0]     eor_ans;
wire   [3:0]     get_rn_num;
wire             go_rf_vld;
wire             high_bit;
wire   [1:0]     high_middle;
wire             hold_en;
wire   [31:0]     ldm_data;
wire             ldm_rf_vld;
wire   [31:0]     or_ans;
wire   [31:0]     ram_addr;
wire             ram_cen;
wire             ram_wen;
wire   [31:0]     rf_b;
wire   [31:0]     rom_addr;
wire             rom_en;
wire   [3:0]     rot_numa;
wire   [4:0]     rot_numb;
wire   [4:0]     rot_numc;
wire   [4:0]     rot_numd;
wire   [4:0]     rot_nume;
wire   [3:0]     rt_num;
wire   [63:0]     shifter_out;
wire   [31:0]     sum_middle;
wire   [31:0]     sum_rn_rm;
wire             to_rf_vld;
wire             to_vld;
wire             wait_en;

//前言：读者在阅读时，必须分清楚每部分功能区，每个区域完成一定功能，相当于各个模块


/******************************************************/
//code定义区
/******************************************************/
//这21条指令在书中第五章有严格定义，读者可以参照书中的解释
//通过这里一系列的code_is_xxx，我们知道从数据池传来的rom_data是属于哪一条指令。

assign code =  rom_data;

assign code_is_mrs =  ({code[27:23],code[21:16],code[11:0]}==23'b00010_001111_000000000000);

assign code_is_msr0 =  ({code[27:23],code[21:20],code[18:17],code[15:4]}==21'b00010_10_00_111100000000);

assign code_is_dp0 =  ({code[27:25],code[4]}==4'b0000)&((code[24:23]!=2'b10)|code[20]);

assign code_is_bx =  (code[27:4]==24'b0001_0010_1111_1111_1111_0001);

assign code_is_dp1 =  ({code[27:25],code[7],code[4]}==5'b00001) & ((code[24:23]!=2'b10)|code[20]);	

assign code_is_mult =  ({code[27:22],code[7:4]}==10'b000000_1001);

assign code_is_multl =  ({code[27:23],code[7:4]}==9'b00001_1001);	

assign code_is_swp =  ({code[27:23],code[21:20],code[11:4]}==15'b00010_00_00001001);	

assign code_is_ldrh0 =  ({code[27:25],code[22],code[11:4]}==12'b000_0_00001011);

assign code_is_ldrh1 =  ({code[27:25],code[22],code[7:4]}==8'b000_1_1011);	

assign code_is_ldrsb0 =  ({code[27:25],code[22],code[20],code[11:4]}==13'b000_0_1_00001101);

assign code_is_ldrsb1 =  ({code[27:25],code[22],code[20],code[7:4]}==9'b000_1_1_1101);		

assign code_is_ldrsh0 =  ({code[27:25],code[22],code[20],code[11:4]}==13'b000_0_1_00001111);

assign code_is_ldrsh1 =  ({code[27:25],code[22],code[20],code[7:4]}==9'b000_1_1_1111);	

assign code_is_msr1 =  ({code[27:23],code[21:20],code[18:17],code[15:12]}==13'b00110_10_00_1111);

assign code_is_dp2 =  (code[27:25]==3'b001)&((code[24:23]!=2'b10)|code[20]);

assign code_is_ldr0 =  (code[27:25]==3'b010);

assign code_is_ldr1 =  ({code[27:25],code[4]}==4'b0110);

assign code_is_ldm =  (code[27:25]==3'b100);

assign code_is_b =  (code[27:25]==3'b101);

assign code_is_swi =  (code[27:24]==4'b1111);

assign all_code =  code_is_mrs|code_is_msr0|code_is_bx|code_is_mult|code_is_multl|code_is_swp|code_is_ldrh0|code_is_ldrh1|code_is_ldrsb0|code_is_ldrsb1|code_is_ldrsh0|code_is_ldrsh1|code_is_msr1|code_is_dp0|code_is_dp1|code_is_dp2|code_is_ldr0|code_is_ldr1|code_is_ldm|code_is_b|code_is_swi;


/******************************************************/
//Rm和Rs移位区
//在第二级时，完成Rm<<Rs的移位操作，形成第二操作数的原型
/******************************************************/
//在第二级，我们必须完成Rm移位的操作。需要移位的指令主要是dp0,dp1,dp2,还有msr1,ldr0这两条指令。
//但很多立即数和Rm不需要移位，我们还是把它放在shift_high上，让它移位0，以便传给第二操作数

//Rm如果来自于寄存器，一般是由code[3:0]给出的，这里通过它来获取Rm
always @ ( * )
case ( code[3:0] )
4'h0 : code_rm =  r0;
4'h1 : code_rm =  r1;	
4'h2 : code_rm =  r2;
4'h3 : code_rm =  r3;
4'h4 : code_rm =  r4;
4'h5 : code_rm =  r5;	
4'h6 : code_rm =  r6;
4'h7 : code_rm =  r7;	
4'h8 : code_rm =  r8;
4'h9 : code_rm =  r9;	
4'ha : code_rm =  ra;
4'hb : code_rm =  rb;
4'hc : code_rm =  rc;
4'hd : code_rm =  rd;	
4'he : code_rm =  re;
4'hf : code_rm =  rfx;
 endcase	

 //Rs一般由code[11:8]指定
always @ ( * )
case ( code[11:8] )
4'h0 : code_rs =  r0;
4'h1 : code_rs =  r1;	
4'h2 : code_rs =  r2;
4'h3 : code_rs =  r3;
4'h4 : code_rs =  r4;
4'h5 : code_rs =  r5;	
4'h6 : code_rs =  r6;
4'h7 : code_rs =  r7;	
4'h8 : code_rs =  r8;
4'h9 : code_rs =  r9;	
4'ha : code_rs =  ra;
4'hb : code_rs =  rb;
4'hc : code_rs =  rc;
4'hd : code_rs =  rd;	
4'he : code_rs =  re;
4'hf : code_rs =  32'b0;
endcase

//以Rm为基础，组成移位寄存器的高32位。
//移位的方式：{shifter_high,shifter_low}<<shifter_rot_num
//上一个版本采用乘法操作，这里使用逻辑左移，可以大幅节省资源
//如果要完成移位，那么我们必须组织shifter_high,shifter_low以及shifter_rot_num

//shifter_high作为移位的高半部分，是移位结果的主体。我们根据指令的不同来确定
//MSR1和DP2指令：是把code[7:0]循环右移{code[11:8],1'b0}
//LDR0指令：无需移位，只需要code[11:0]，因此shifter_high直接使用code[11:0]
//B指令：同样适用立即数，后面会规定shifter_rot_num==0
//code[4],code[7]都等于1，表示LDRH,LDRSB,LDRSH指令
//其他情况下，也就是dp0和dp1了，此时根据移位方式code[6:5]来决定shifter_high
// 00时：逻辑左移，而我们这里唯一的移位符号正是左移，所以shifter_high=Rm, shifter_low=0，那么{Rm,0}<<num的高32位就是我们的移位结果
// 01时：逻辑右移，shifter_high=0, shifter_low = Rm，那么{0,Rm}<<num的高32位就是我们逻辑右移的结果，当然num必须取反加一
// 10时：算术右移，shifter_high=符号位，shifter_low= Rm，那么{符号位,Rm}<<num的高32位就是我们算术右移的结果，num也要取反加一
// 11时：循环右移，shifter_high=Rm, shifter_low = Rm，那么{Rm,Rm}<<num的高32位就是我们循环右移的结果，num也要取反加一

always @ ( * )
if ( code_is_msr1|code_is_dp2 )
   shifter_high =  code[7:0];
else if ( code_is_ldr0 )
    shifter_high =  code[11:0];
else if ( code_is_b )
    shifter_high =  {{6{code[23]}},code[23:0],2'b0};
else if ( code[4] & code[7] )
    shifter_high =  code[22] ? {code[11:8],code[3:0]} : code_rm;
else 
    case( code[6:5] )
	2'h0 : shifter_high =  code_rm;
	2'h1 : shifter_high =  32'b0;
	2'h2 : shifter_high =  {32{code_rm[31]}};
	2'h3 : shifter_high =  code_rm;
	endcase

	
//shifter_low在讲shifter_high时已经讲到。只有真正移位的时候，才需要shifter_low。
//真正移位的指令包括：msr1,dp2（它们是立即数循环右移）,然后是dp0和dp1
//这两个的shifter_low在上面讲到了。
	
always @ ( * )
if ( code_is_msr1|code_is_dp2 )
    shifter_low =  code[7:0];
else if ( code[6:5]==2'b0 )
    shifter_low =  32'b0;
else 
    shifter_low =  code_rm;

//我们把三个取反加一，单独表示出来	

assign rot_numa =  ~code[11:8] + 1'b1;

assign rot_numb =  ~code[11:7] + 1'b1;

assign rot_numc =  ~code_rs[4:0] + 1'b1;	
	
//如果是B和LDR0指令，必须设定移位数目为0
//如果是指令MSR1和DP2，它的移位数目是{code[11:8],1'b0}，这里对它取反加一
//否则如果是DP0(code[4]==0)，那么除了(code[6:5]==0）时使用原值，其他都要取反加一
//如果code[4]和code[7]都等于1，表示是mult/multl/ldrh/ldrsb/ldrsh等指令，此时移位数目必须等于0
//其他情况下，就是关于DP1指令。如果是循环移位，那么移位数目取反加一
//如果移位超出了32位(Rs[7:5]任一个等于1），那么移位数目等于0。
//其他情况和DP0类似 
	
always @ ( * )
if (code_is_b|code_is_ldr0)
    shifter_rot_num =  5'b0;
else if ( code_is_msr1|code_is_dp2 )
    shifter_rot_num =  {rot_numa,1'b0};
else if ( ~code[4] )
    shifter_rot_num =  (code[6:5]==2'b0) ? code[11:7] : rot_numb;
else if ( code[7] )
    shifter_rot_num =  5'b0;
else if ( code[6:5]==2'b11 )
    shifter_rot_num =  rot_numc;
else if ( |code_rs[7:5] )
    shifter_rot_num =  5'b0;	
else  
    shifter_rot_num =  (code[6:5]==2'b0) ? code_rs[4:0] : rot_numc;

//已经组织了high,low和rot_num，那么最后的结果一般都是shifter_out[63:32]，除非有特殊情况。
//如果有特殊情况，则直接改变第二操作数	

assign shifter_out =  {shifter_high,shifter_low}<<shifter_rot_num;

/******************************************************/
//得到Rn和第二操作数sec_operand
/******************************************************/	

//这里先准备Rn。如果是B指令，强制等于R15，否则由[19:16]来决定	
assign get_rn_num =  (code_is_b)?4'hf:code[19:16];

//从寄存器组里面取出Rn
always @ ( * )
case ( get_rn_num )
4'h0 : get_rn =  r0;
4'h1 : get_rn =  r1;	
4'h2 : get_rn =  r2;
4'h3 : get_rn =  r3;
4'h4 : get_rn =  r4;
4'h5 : get_rn =  r5;	
4'h6 : get_rn =  r6;
4'h7 : get_rn =  r7;	
4'h8 : get_rn =  r8;
4'h9 : get_rn =  r9;	
4'ha : get_rn =  ra;
4'hb : get_rn =  rb;
4'hc : get_rn =  rc;
4'hd : get_rn =  rd;	
4'he : get_rn =  re;
4'hf : get_rn =  rfx;
endcase

assign code_is_dp =  code_is_dp0|code_is_dp1|code_is_dp2;

//reg_rn是Rn的代表寄存器，它是后续加法器的一个加数。
//reg_rn是Rn的存放寄存器，后面的操作会用到Rn。
//如果是DP的mov和mvn操作，此时会把第二操作数或取反放入Rd内，那么如果我们要使用加法器的结果，就必须强制Rn=0.
//因此，在这种情况下，Rn必须等于0

always @ ( posedge clk or posedge rst )
if ( rst )
    reg_rn <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    if ( code_is_dp & ((code[24:21]==4'b1101)|(code[24:21]==4'b1111)) )
		    reg_rn <= #`DEL  32'b0;
		else
	        reg_rn <= #`DEL  get_rn;
	else;
else;

//下面组织第二操作数shifter_ans。reg_rn和sec_operand(shifter_ans)是加法器的两个加数。
//ldm类指令很讨厌，需要它的加数shifter_ans随着指令的执行不断变化，以形成code[15:0]每个1bit对应不同的地址

//首先是把code[15:0]累加起来，看看LDM指令需要执行多少个周期
assign code_sum =  (code[0]+code[1]+code[2]+code[3]+code[4]+code[5]+code[6]+code[7]+code[8]+code[9]+code[10]+code[11]+code[12]+code[13]+code[14]+code[15]);	

assign cmd_is_ldm =  (cmd[27:25]==3'b100);

//把code_sum使用寄存器保存下来，以备使用
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_sum <= #`DEL 5'd0;
else if ( cpu_en & ~hold_en )
    cmd_sum <= #`DEL  code_sum;
else;

//sum_m充当多周期指令的多周期标志，它会不断递减，当递减到0时，多周期也就结束
always @ ( posedge clk or posedge rst )
if ( rst )
    sum_m <= #`DEL 5'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    sum_m <= #`DEL  code_sum;
	else
	    sum_m <= #`DEL  sum_m - 1'b1;
else;

//shifter_ans是sec_operand的原型，一般都等于它
//在确定它的初始值时，必须分LDM或其他情况。
//如果是LDM，根据code[24:23]，来确定数据池地址的初值；否则就等于移位结果
//在LDM指令执行的过程中(hold_en & cmd_is_ldm)，我们会不断对放入的初值进行递减或递加
//在快递减到0(也即是sum_m==1的那一刻)时，把保存的code[15:0]的总和放入shifter_ans，那么在sum_m=0时，对Rn进行地址回写

always @ ( posedge clk or posedge rst )
if ( rst )
    shifter_ans <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ~hold_en )
        if ( code_is_ldm )
            case( code[24:23] )
            2'h0 : shifter_ans <= #`DEL  {(code_sum - 1'b1),2'b0};
            2'h1 : shifter_ans <= #`DEL  0;
            2'h2 : shifter_ans <= #`DEL  {code_sum,2'b0};
            2'h3 : shifter_ans <= #`DEL  3'b100;
            endcase
        else   
	        shifter_ans <= #`DEL  shifter_out[63:32];
	else if ( cmd_is_ldm )
	    if ( sum_m==5'b1 )
	        shifter_ans[6:2] <= #`DEL cmd_sum;	
	    else if ( cmd[23] )
	        shifter_ans[6:2] <= #`DEL shifter_ans[6:2] + 1'b1;
	    else
	        shifter_ans[6:2] <= #`DEL shifter_ans[6:2] - 1'b1;
	else;
else;

//dp1是寄存器Rs指示移位数目，在左移超过32位(code_rs[7:5]!=0)时，需要指示出来，此时sec_operand强制为0，而shifter_ans里面存放的却是Rm
always @ ( posedge clk or posedge rst )
if ( rst )
    dp1_lsl_more <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    dp1_lsl_more <= #`DEL  code_is_dp1 & (code[6:5]==2'b00) & (|code_rs[7:5]);
	else
	    dp1_lsl_more <= #`DEL  1'b0;
else;

//dp0如果出现RRX移位，也就是循环右移，并且右移数目等于0时，此时cpsr_c必须出现在第二操作数中
always @ ( posedge clk or posedge rst )
if ( rst )
    dp0_rrx_shift <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    dp0_rrx_shift <= #`DEL  code_is_dp0 & (code[11:5]==7'b00000_11);
	else
	    dp0_rrx_shift <= #`DEL  1'b0;
else;

//dp1移位数目等于0时(Rs[7:0]等于0)，此时的第二操作数应该保持不变.
//shifter_ans里面等于{Rm,0,符号位,Rm}（对应四种情况），直接使用它不合适。
//幸好shift_word正是保持不变的Rm，此时强制令第二操作数等于Rm。
always @ ( posedge clk or posedge rst )
if ( rst )
    dp1_shift_zero <= #`DEL 1'b0;
else if ( cpu_en )
    if ( ~hold_en )
        dp1_shift_zero <= #`DEL code_is_dp1 & (code_rs[7:0]==8'd0);
    else
	    dp1_shift_zero <= #`DEL 1'b0;
else;

//根据这上面列举的情况，组织第二操作数
always @ ( * )
if ( dp1_lsl_more )
    sec_operand =  32'b0;
else if ( dp1_shift_zero )
    sec_operand = shift_word;
else if ( dp0_rrx_shift )
    sec_operand =  { cpsr_c,shifter_ans[31:1]};
else
    sec_operand =  shifter_ans;

/******************************************************/
//ALU单元，包括加法操作和一般的逻辑操作
//reg_rn作为加法器的一个加数，sec_operand作为第二个。
//加法器是A[31:0]+B[31:0]+c[0]这样统一的加法器。如果完成减法，则设定~B，C[0]=1
/******************************************************/		


//在dp指令的3和7情况时，reg_rn需要取反。取反的情况是DP指令的：RSB和RSC
always @ ( posedge clk or posedge rst )
if ( rst )
    adder_a_inv <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    adder_a_inv <= #`DEL  code_is_dp & ((code[24:21]==4'b0011)|(code[24:21]==4'b0111));
	else;
else;

assign add_a =  adder_a_inv ? ~reg_rn : reg_rn;	


//第二个加数sec_operand需要取反的情况
//DP取反的情况是：SUB、SBC、CMP、MVN。之所以最后加上BIC，是因为想让Rn & add_b，而不是sec_operand。
always @ ( posedge clk or posedge rst )
if ( rst )
    adder_b_inv <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    if ( code_is_b )
		    adder_b_inv <= #`DEL  1'b0;
	    else if ( code_is_dp )
		    adder_b_inv <= #`DEL  ((code[24:21]==4'b0010)|(code[24:21]==4'b0110)|(code[24:21]==4'b1010)|(code[24:21]==4'b1111)|(code[24:21]==4'b1110));
		else
		    adder_b_inv <= #`DEL  ~code[23];
	else;
else;

assign add_b =  adder_b_inv ? ~sec_operand : sec_operand;

//加法器的进位的设定。它分为两部分: 如果[1]有效，表示使用cpsr_c，否则进位使用[0]。
always @ ( posedge clk or posedge rst )
if ( rst )
    add_extra_num <= #`DEL 2'd0;
else if ( cpu_en )
    if ( ~hold_en )
		if ( code_is_b )
		    add_extra_num <= #`DEL  2'b0;
	    else if ( code_is_dp )
            if ( (code[24:21]==4'b0101)|(code[24:21]==4'b0110)|(code[24:21]==4'b0111) )    
                add_extra_num <= #`DEL  2'b10;
	        else if ( (code[24:21]==4'b0010)|(code[24:21]==4'b0011)|(code[24:21]==4'b1010) )
	            add_extra_num <= #`DEL  2'b1;
	        else
	            add_extra_num <= #`DEL  2'b0;
		else
		    add_extra_num <= #`DEL  code[23] ? 2'b0 : 2'b1;
	else;
else;

always @ ( * )
if ( add_extra_num[1] )
    add_c =  cpsr_c;
else
    add_c =  add_extra_num[0];

assign sum_middle =  add_a[30:0] + add_b[30:0] + add_c;

assign high_middle =  add_a[31] + add_b[31] + sum_middle[31];

//加法器的进位bit
assign bit_cy =  high_middle[1];

assign high_bit =  high_middle[0];

//加法结果的v标志
assign bit_ov =  high_middle[1] ^ sum_middle[31];

//加法器的输出结果，它除了被DP指令使用外，所有数据池的指令的地址，都会由sum_rn_rm给出
assign sum_rn_rm =  {high_bit,sum_middle[30:0]};

//与操作，包括& 和 &~ 两种
assign and_ans =  reg_rn & add_b;

assign eor_ans =  reg_rn ^ sec_operand;

assign or_ans =  reg_rn | sec_operand;

//ALU的输出结果
always @ ( * )
case ( cmd[24:21] )
4'h0 : dp_ans =  and_ans;
4'h1 : dp_ans =  eor_ans;
4'h2 : dp_ans =  sum_rn_rm;
4'h3 : dp_ans =  sum_rn_rm;
4'h4 : dp_ans =  sum_rn_rm;
4'h5 : dp_ans =  sum_rn_rm;
4'h6 : dp_ans =  sum_rn_rm;
4'h7 : dp_ans =  sum_rn_rm;
4'h8 : dp_ans =  and_ans;
4'h9 : dp_ans =  eor_ans;
4'ha : dp_ans =  sum_rn_rm;
4'hb : dp_ans =  sum_rn_rm;
4'hc : dp_ans =  or_ans;
4'hd : dp_ans =  sum_rn_rm;
4'he : dp_ans =  and_ans;
4'hf : dp_ans =  sum_rn_rm;
endcase

/******************************************************/
//to_vld/to_num/to_data的组织，这是寄存器指令对寄存器进行改写的通道
/******************************************************/

//和上一版不同，只在code这一级对指令进行解析，在cmd这一级，则使用code的结果。code_to_flag表示置位to_vld的标志
always @ ( posedge clk or posedge rst )
if ( rst )
    code_to_flag <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    code_to_flag <= #`DEL  (code_is_mrs|(code_is_dp&(code[24:23]!=2'b10))|((code_is_ldrh0|code_is_ldrh1|code_is_ldrsb0|code_is_ldrsb1|code_is_ldrsh0|code_is_ldrsh1|code_is_ldr0|code_is_ldr1)&( code[21]| ~code[24])));
	else;
else;

//cmd_ok表示指令有效，后面再详述。
//code_to_flag表示需要改写寄存器。
//(cmd_is_ldm&cmd[21]&(sum_m==5'b0))--表示ldm指令在最后一个周期(sum_m是一个递减计数器，等于0 表示最后一个周期）时，对Rn进行升级
assign to_vld =  cmd_ok & (code_to_flag|(cmd_is_ldm&cmd[21]&(sum_m==5'b0)));

//to_num[3:0]指示to_vld需要改写哪一个寄存器，根据指令的不同，一般是[15:12]和[19:16]
always @ ( posedge clk or posedge rst )
if ( rst )
    to_num <= #`DEL 4'd0;
else if ( cpu_en )
    if ( ~hold_en )
        if ( code_is_mrs|code_is_dp )
            to_num <= #`DEL  code[15:12];
        else
            to_num <= #`DEL  code[19:16];
	else;
else;

//如果是MRS指令，那么to_data需要额外组织
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_is_mrs <= #`DEL 1'd0;
else if ( cpu_en & ~hold_en )
    cmd_is_mrs <= #`DEL  code_is_mrs;
else;

//DP类指令，to_data应等于dp_ans
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_is_dp <= #`DEL 1'd0;
else if ( cpu_en & ~hold_en )
    cmd_is_dp <= #`DEL  code_is_dp;
else;

//如果是DP指令，dp_ans作为to_data，否则的话，sum_rn_rm作为数据池指令的Rn升级结果
always @ ( * )
if ( cmd_is_mrs )
    to_data =  {cpsr_n,cpsr_z,cpsr_c,cpsr_v,28'b0};//cmd[22] ? {spsr[10:7],20'b0,spsr[6:5],1'b0,spsr[4:0]} : {cpsr[10:7],20'b0,cpsr[6:5],1'b0,cpsr[4:0]};
else if ( cmd_is_dp )
    to_data =  dp_ans;
else
    to_data =  sum_rn_rm; 
	
/******************************************************/
//cha_vld/cha_num: 它表示对数据池的读操作(不包含LDM这样的多周期指令)
/******************************************************/

//code_cha_flag表示读指令，它包括swp的前一个周期读操作，swp的后一个周期是写操作。因此，在hold_en等于1时，code_cha_flag必须等于0。
always @ ( posedge clk or posedge rst )
if ( rst )
    code_cha_flag <= #`DEL 1'd0;
else if ( cpu_en) 
    if ( ~hold_en )
        code_cha_flag <= #`DEL  (( code_is_ldrh0|code_is_ldrh1|code_is_ldrsb0|code_is_ldrsb1|code_is_ldrsh0|code_is_ldrsh1|code_is_ldr0|code_is_ldr1 ) & code[20])|code_is_swp;
    else
	    code_cha_flag <= #`DEL 1'b0;
else;	

assign cha_vld =  cmd_ok & code_cha_flag;

assign cha_num =  cmd[15:12];	

//一旦涉及到对R15的读指令，必须清除流水线
assign cha_rf_vld =  cha_vld & ( cha_num==4'hf );

//它给出改写寄存器的形式：[3]表示字/字节操作；[2]表示半字操作;[1]表示有符号字节; [0]表示有符号半字操作
always @ ( posedge clk or posedge rst )
if ( rst )
    cha_fmt <= #`DEL 4'd0;
else if ( cpu_en & ~hold_en )
    cha_fmt <= #`DEL  {(code_is_ldr0|code_is_ldr1|code_is_swp),(code_is_ldrh0|code_is_ldrh1),(code_is_ldrsb0|code_is_ldrsb1),(code_is_ldrsh0|code_is_ldrsh1)};
else;

/******************************************************/
//go_vld/go_num: 它表示对数据池的读操作(不包含LDM这样的多周期指令)的后续改写寄存器操作
/******************************************************/	
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

assign go_rf_vld =  go_vld & (go_num==4'hf);

//它给出更进一步的格式，[5]表示字操作，[4]表示半字操作，[3]表示字节操作，[2]表示是否有符号，[1:0]给出地址的后两bit，在半字/字节操作时给出参考	
always @ ( posedge clk or posedge rst )
if ( rst )
    go_fmt <= #`DEL 6'd0;
else if ( cpu_en )
   if ( cha_fmt[3] )
        go_fmt <= #`DEL  cmd[22] ?{4'b0010,cmd_addr[1:0]}: {4'b1000,cmd_addr[1:0]};
    else if ( cha_fmt[2] )
        go_fmt <= #`DEL  {4'b0100,cmd_addr[1:0]};
	else if ( cha_fmt[1] )
	    go_fmt <= #`DEL  {4'b0011,cmd_addr[1:0]};
	else if ( cha_fmt[0] )
        go_fmt <= #`DEL  {4'b0101,cmd_addr[1:0]};
    else
	    go_fmt <= #`DEL  {4'b1000,cmd_addr[1:0]};
else;	

//根据go_fmt的格式，对ram_rdata进行组织，得到go_data，它就是写入寄存器组的最终数据格式
always @ ( * )
if ( go_fmt[5] )
    go_data =  ram_rdata;
else if ( go_fmt[4] )
    if ( go_fmt[1] )
	    go_data =  {{16{go_fmt[2]&ram_rdata[31]}},ram_rdata[31:16]};
	else
	    go_data =  {{16{go_fmt[2]&ram_rdata[15]}},ram_rdata[15:0]};
else// if ( go_fmt[3] )
    case(go_fmt[1:0])
    2'b00 : go_data =  { {24{go_fmt[2]&ram_rdata[7]}}, ram_rdata[7:0] };
    2'b01 : go_data =  { {24{go_fmt[2]&ram_rdata[15]}}, ram_rdata[15:8] };	
    2'b10 : go_data =  { {24{go_fmt[2]&ram_rdata[23]}}, ram_rdata[23:16] };	
    2'b11 : go_data =  { {24{go_fmt[2]&ram_rdata[31]}}, ram_rdata[31:24] };	
    endcase	

/******************************************************/
//ldm_vld/ldm_num是ldm指令对寄存器的改写通道
/******************************************************/

//在指令是LDM，且sum_m不等于0时，表示通过LDM指令的形式，把数据池指令的形式加载人寄存器组
//ldm_vld等同于go_vld，两者对应不同的指令，但地位相同
always @ ( posedge clk or posedge rst )
if ( rst )
    ldm_vld <= #`DEL 1'd0;
else if ( cpu_en )
    ldm_vld <= #`DEL  cmd_ok & cmd_is_ldm & cmd[20] & (sum_m!=5'b0);
else;

//在ldm指令执行时，cmd[15:0]不断递减（从低到高不断变为0），因此通过ldm_sel得到当前指向的寄存器是哪一个
always @ ( * )
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

//ldm_num等同于go_num
always @ ( posedge clk or posedge rst )
if ( rst )
    ldm_num <= #`DEL 4'd0;
else if ( cpu_en )
    ldm_num <= #`DEL  ldm_sel;
else;

assign ldm_rf_vld =  (ldm_vld & ( ldm_num==4'hf )) ;	

//ldm_data等于go_data，都是把ram_rdata写入到寄存器中
assign ldm_data =  go_data;

/******************************************************/
//数据池端的接口信号（ram_cen/ram_wen/ram_flag/ram_addr/ram_wdata)
/******************************************************/

always @ ( posedge clk or posedge rst )
if ( rst )
    code_cen <= #`DEL 1'd0;
else if ( cpu_en & ~hold_en )
    code_cen <= #`DEL  (code_is_ldrh0|code_is_ldrh1|code_is_ldrsb0|code_is_ldrsb1|code_is_ldrsh0|code_is_ldrsh1|code_is_ldr0|code_is_ldr1|code_is_swp);
else;

//cen作为数据池端口的开关信号，它由一般的读写指令和LDM操作指令组成，一旦指令有效，那么ram_cen即行打开
assign ram_cen =  cpu_en & cmd_ok & (code_cen|(cmd_is_ldm &(sum_m!=5'b0)));

//ram_wen由cmd[20]决定。一个意外是swp指令，在前一个周期强制读操作，后一个是写操作
assign ram_wen =  cmd_is_swp ? 1'b0 : ~cmd[20];	

//SWP的前后两个周期由cmd_is_swp与cmd_is_swpx表示
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_is_swp <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    cmd_is_swp <= #`DEL  code_is_swp;
	else
	    cmd_is_swp <= #`DEL  1'b0;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_is_swpx <= #`DEL 1'd0;
else if ( cpu_en )
    cmd_is_swpx <= #`DEL  cmd_is_swp;
else;

//ram_flag标示对数据池操作是字操作、半字操作还是字节操作。因此由cha_fmt即可得到
always @ ( * )
if ( cha_fmt[3] )
    ram_flag =  cmd[22]? (1'b1<<cmd_addr[1:0]):4'b1111;
else if ( cha_fmt[2]|cha_fmt[0] )
    ram_flag =  cmd_addr[1] ? 4'b1100 : 4'b0011;
else if ( cha_fmt[1] ) 
    ram_flag =  1'b1<<cmd_addr[1:0];
else
    ram_flag =  4'b1111;

//ram_addr可以是加法的结果，也可以是Rn，这由cmd[24]来决定。
//如果是LDM指令，则强制使用加法器的输出，因为LDM的地址是递增或递减的
//SWP指令强制使用Rn	
assign cmd_addr =  ( (cmd[24]|cmd_is_ldm)& ~cmd_is_swp & ~cmd_is_swpx ) ? sum_rn_rm : reg_rn;

//ram_addr的最后2 bit强制等于0，ram_flag来表示字节/半字/字操作的具体含义
assign ram_addr =  {cmd_addr[31:2],2'b0};

//Rt是写数据ram_wdata的源头，首先通过code_rt_num得到Rt的序号
//Rt不仅写数据用，长乘指令同样使用到它	
always @ ( posedge clk or posedge rst )
if ( rst )
    code_rt_num <= #`DEL 4'd0;
else if ( cpu_en & ~hold_en )
	code_rt_num <= #`DEL  code_is_swp ? code[3:0] : code[15:12];
else;

//如果是LDM指令，ldm_sel作为写数据的寄存器序号	
assign rt_num =  cmd_is_ldm ? ldm_sel : code_rt_num;

always @ ( * )
case ( rt_num )
4'h0 : rt =  r0;
4'h1 : rt =  r1;	
4'h2 : rt =  r2;
4'h3 : rt =  r3;
4'h4 : rt =  r4;
4'h5 : rt =  r5;	
4'h6 : rt =  r6;
4'h7 : rt =  r7;	
4'h8 : rt =  r8;
4'h9 : rt =  r9;	
4'ha : rt =  ra;
4'hb : rt =  rb;
4'hc : rt =  rc;
4'hd : rt =  rd;	
4'he : rt =  re;
4'hf : rt =  rf;
endcase

//写数据同样遇到字/半字/字节的问题，由cha_fmt来决定
always @ ( * )
if ( cha_fmt[3] )
    if ( cmd[22] )
	    ram_wdata =  { rt[7:0],rt[7:0],rt[7:0],rt[7:0]};
    else
        ram_wdata =  rt;	
else if ( cha_fmt[2] )
    ram_wdata =  {rt[15:0],rt[15:0]};
else
    ram_wdata =  rt;

/******************************************************/
//寄存器组的描述
/******************************************************/

//有了to_vld/go_vld/ldm_vld三个通道，指令即可通过这三个通道对它进行改写
always @ ( posedge clk or posedge rst )
if ( rst )
    r0 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num == 4'h0 ) )
	    r0 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h0 ) )
	    r0 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h0 ) )
	    r0 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r1 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num == 4'h1 ) )
	    r1 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h1 ) )
	    r1 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h1 ) )
	    r1 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r2 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num == 4'h2 ) )
	    r2 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h2 ) )
	    r2 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h2 ) )
	    r2 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r3 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h3 ) )
	    r3 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h3 ) )
	    r3 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h3 ) )
	    r3 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r4 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num == 4'h4 ) )
	    r4 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h4 ) )
	    r4 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h4 ) )
	    r4 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r5 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num == 4'h5 ) )
	    r5 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h5 ) )
	    r5 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h5 ) )
	    r5 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r6 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num == 4'h6 ) )
	    r6 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h6 ) )
	    r6 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h6 ) )
	    r6 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r7 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num == 4'h7 ) )
	    r7 <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num == 4'h7 ) )
	    r7 <= #`DEL  go_data;
	else if ( to_vld & ( to_num == 4'h7 ) )
	    r7 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r8 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h8 ) )
	    r8 <= #`DEL  ldm_data;		
	else if ( go_vld & ( go_num==4'h8 ) )
	    r8 <= #`DEL  go_data;
	else if ( to_vld & ( to_num==4'h8 ) )
	    r8 <= #`DEL  to_data;
	else;
else;

always @ ( posedge clk or posedge rst )
if ( rst )
    r9 <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'h9 )  )
	    r9 <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'h9) )
	    r9 <= #`DEL  go_data;
	else if ( to_vld & (to_num==4'h9) )
	    r9 <= #`DEL  to_data;
	else;
else; 


always @ ( posedge clk or posedge rst )
if ( rst )
    ra <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'ha )  )
	    ra <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'ha) )
	    ra <= #`DEL  go_data;
	else if ( to_vld & (to_num==4'ha) )
	    ra <= #`DEL  to_data;
	else;
else; 

always @ ( posedge clk or posedge rst )
if ( rst )
    rb <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hb )  )
	    rb <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hb) )
	    rb <= #`DEL  go_data;
	else if ( to_vld & (to_num==4'hb) )
	    rb <= #`DEL  to_data;
	else;
else;  

always @ ( posedge clk or posedge rst )
if ( rst )
    rc <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & ( ldm_num==4'hc )  )
	    rc <= #`DEL  ldm_data;
	else if ( go_vld & (go_num==4'hc) )
	    rc <= #`DEL  go_data;
	else if ( to_vld & (to_num==4'hc) )
	    rc <= #`DEL  to_data;
	else;
else;


always @ ( posedge clk or posedge rst )
if ( rst )
    rd <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & (ldm_num==4'hd) )
	    rd <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num==4'hd ) )
	    rd <= #`DEL  go_data;
	else if ( to_vld & ( to_num==4'hd ) )
	    rd <= #`DEL  to_data;
	else;
else;


always @ ( posedge clk or posedge rst )
if ( rst )
    re <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & (ldm_num==4'he) )
	    re <= #`DEL  ldm_data;
	else if ( go_vld & ( go_num==4'he ) )
	    re <= #`DEL  go_data;
	else if ( cmd_ok & cmd_is_b & cmd[24] )
	    re <= #`DEL  rf_b;
	else if ( to_vld & ( to_num==4'he ) )
	    re <= #`DEL  to_data;
	else;
else;

/******************************************************/
//PSR寄存器之n,z,c,v
/******************************************************/

//cpsr_n
//MSR指令
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_is_msr <= #`DEL 1'd0;
else if ( cpu_en & ~hold_en )
    cmd_is_msr <= #`DEL  code_is_msr0|code_is_msr1;
else;

//cpsr_n寄存器在DP指令，ldm指令，MSR指令时需要改变
always @ ( * )
if ( cmd_ok & cmd_is_dp & cmd[20] )
    cpsr_n_in =  dp_ans[31];
else if ( cmd_ok & cmd_is_msr & ~cmd[22] & cmd[19] )
    cpsr_n_in =  sec_operand[31];
else
    cpsr_n_in =  cpsr_n;

always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_n <= #`DEL 1'd0;
else if ( cpu_en )
    cpsr_n <= #`DEL  cpsr_n_in;
else;

//cpsr_z
always @ ( * )
if ( cmd_ok & cmd_is_dp & cmd[20] )
    cpsr_z_in =  (dp_ans==32'b0);	
else if ( cmd_ok & cmd_is_msr & ~cmd[22] & cmd[19] )
    cpsr_z_in =  sec_operand[30];
else
    cpsr_z_in =  cpsr_z;

always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_z <= #`DEL 1'd0;
else if ( cpu_en )
    cpsr_z <= #`DEL  cpsr_z_in;
else;

//cpsr_c
//cpsr_c和n,z类似，区别在于dp移位时的移位进位shift_bit
always @ ( * )
if ( cmd_ok & cmd_is_dp & cmd[20] )
    if ( (cmd[24:21]==4'b1011)|(cmd[24:21]==4'b0100)|(cmd[24:21]==4'b0101)|(cmd[24:21]==4'b0011)|(cmd[24:21]==4'b0111)|(cmd[24:21]==4'b1010)|(cmd[24:21]==4'b0010)|(cmd[24:21]==4'b0110) )
	    cpsr_c_in =  bit_cy;	
    else
        cpsr_c_in =  shift_bit;
else if ( cmd_ok & cmd_is_msr & ~cmd[22] & cmd[19] )
    cpsr_c_in =  sec_operand[29];
else
    cpsr_c_in =  cpsr_c;	

always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_c <= #`DEL 1'd0;
else if ( cpu_en )
    cpsr_c <= #`DEL  cpsr_c_in;
else;

//下面讲如何得到shift_bit
//我们把得到移位进位和移位本身分开，是为了加快速度。我们只需知道Rm->shift_word，然后找到该进位bit所在的位置：shift_num
//那么shift_word[shift_num]即为进位bit
always @ ( posedge clk or posedge rst )
if ( rst )
    shift_word <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    if ( code[27:25]==3'b001 )
		    shift_word <= #`DEL  code[7:0];
		else 
            shift_word <= #`DEL  code_rm;
    else;
else;	

assign rot_numd =  code[11:7] - 1'b1;

assign rot_nume =  code_rs[4:0] - 1'b1;

//shift_num[4:0]表示shift_word的第n位是移位进位。shift_num[6:5]都有特殊含义，见下面shift_bit的实现	
always @ ( posedge clk or posedge rst )
if ( rst )
    shift_num <= #`DEL 7'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    if ( code_is_dp2 )
		    shift_num <= #`DEL  (code[11:8]==4'h0) ? 7'b10_00000 : {2'b0,rot_numa,1'b0};
		else if ( code_is_dp0 )
		    case( code[6:5] )
			2'h0 : shift_num <= #`DEL  (code[11:7]==5'b0) ? 7'b10_00000 : rot_numb;
			2'h1 : shift_num <= #`DEL   rot_numd;
			2'h2 : shift_num <= #`DEL   rot_numd;
			2'h3 : shift_num <= #`DEL  (code[11:7]==5'b0) ? 7'b0 : rot_numd;
			endcase
		else //if ( code_is_dp1 )
		    if ( code_rs[7:0] == 8'b0 )
			    shift_num <= #`DEL  7'b10_00000;
			else
   			    case( code[6:5] )
			    2'h0 : shift_num <= #`DEL  ( code_rs[7:0]>8'd32 ) ? 7'b01_00000 : rot_numc;
				2'h1 : shift_num <= #`DEL  ( code_rs[7:0]>8'd32 ) ? 7'b01_00000 : rot_nume;
                2'h2 : shift_num <= #`DEL  ( code_rs[7:0]>8'd32 ) ? 7'b00_11111 : rot_nume;	
                2'h3 : shift_num <= #`DEL  ( code_rs[7:0]==8'd32 )? 7'b10_00000 : rot_nume;
                endcase				
	else;
else;

always @ ( * )
if ( shift_num[6] )
    shift_bit =  cpsr_c;
else if ( shift_num[5] )
    shift_bit =  1'b0;
else
    shift_bit =  shift_word[shift_num[4:0]];	

//cpsr_v
always @ ( * )
if ( cmd_ok & cmd_is_dp & cmd[20] )
    if ( (cmd[24:21]==4'd2)|(cmd[24:21]==4'd3)|(cmd[24:21]==4'd4)|(cmd[24:21]==4'd5)|(cmd[24:21]==4'd6)|(cmd[24:21]==4'd7)|(cmd[24:21]==4'd10)|(cmd[24:21]==4'd11) )
	    cpsr_v_in =  bit_ov;	
    else
        cpsr_v_in =  cpsr_v;
else if ( cmd_ok & cmd_is_msr & ~cmd[22] & cmd[19] )
    cpsr_v_in =  sec_operand[28];
else
    cpsr_v_in =  cpsr_v;	


always @ ( posedge clk or posedge rst )
if ( rst )
    cpsr_v <= #`DEL 1'd0;
else if ( cpu_en )
    cpsr_v <= #`DEL  cpsr_v_in;
else;



/******************************************************/
//指令流的控制：code_flag, cmd_flag, cmd等
/******************************************************/

//一旦发生中断或对PC的有效改变，code_flag必须清零，让下一拍的code失效	
always @ ( posedge clk or posedge rst )
if ( rst )
    code_flag <= #`DEL 1'd0;
else if ( cpu_en )
    if (  to_rf_vld | cha_rf_vld | go_rf_vld | ldm_rf_vld )
	    code_flag <= #`DEL  0;
	else
	    code_flag <= #`DEL  1;
else;

//cmd_flag是表示第三级cmd的状态，一般来说，它继承于code_flag，但也有变化
//在hold_en，也就是多周期指令时，cmd_flag保持不变
//在wait_en，也就是数据冲突时，cmd_flag必须清零，插入一个空周期
//在PC(rf)发生任何改变时，cmd_flag清零，表示当前流水线清除	
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_flag <= #`DEL 1'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    if ( wait_en | to_rf_vld | cha_rf_vld | go_rf_vld | ldm_rf_vld )
		    cmd_flag <= #`DEL  0;
		else
		    cmd_flag <= #`DEL  code_flag;
	else;
else;	
	
//cmd作为当前执行指令的标示，它还标示ldm指令的执行状态
//ldm指令会在每执行结束1bit后，即清除1bit，在cmd[15:0]为全0时，ldm指令执行完毕。	
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ~hold_en )
	    cmd <= #`DEL  code;
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

//下面是数据冲突wait_en
//第二级指令code的输入

assign code_rm_vld =  code_is_msr0|code_is_dp0|code_is_bx|code_is_dp1|code_is_mult|code_is_multl|code_is_swp|code_is_ldrh0|code_is_ldrsb0|code_is_ldrsh0|code_is_ldr1;

assign code_rm_num =  code[3:0];

assign code_rs_vld =  code_is_dp1|code_is_mult|code_is_multl;

assign code_rs_num =  code[11:8];

assign code_rn_vld =  code_is_dp0|code_is_dp1|code_is_swp|code_is_ldrh0|code_is_ldrh1|code_is_ldrsb0|code_is_ldrsb1|code_is_ldrsh0|code_is_ldrsh1|code_is_dp2|code_is_ldr0|code_is_ldr1|code_is_ldm;

assign code_rn_num =  code[19:16];

assign code_rnhi_vld =  ((code_is_ldrh0|code_is_ldrh1|code_is_ldr0|code_is_ldr1|code_is_ldm)& ~code[20]);

reg [3:0] code_ldm_num;
integer i;
always @* begin
code_ldm_num = 0;
for (i=0;i<15;i=i+1)
if (code[14-i])  code_ldm_num = 14-i;
end
		
assign code_rnhi_num =  code_is_ldm ? code_ldm_num : code[15:12];		

//第二级指令的输入和第三级指令的输出：cha_vld/go_vld/to_vld发生重叠，即可判定数据冲突：
//cha_vld: cha_num必须不能与rm, rs, rn, rnhi任何一个相等，否则，必须等待一个周期，在插入空周期后，cha_vld变为0，冲突消失
//go_vld: rm,rs,rn是在第二级从寄存器组取出使用，它和go_vld存在着依存关系；而rnhi,也就是rt，是在第三级从寄存器组取出使用，不存在冲突
//to_vld：和go_vld类似
//ldm_vld: 和go_vld类似
//cpsr_m和m_after一旦不相等，此时从寄存器组取出数据是不合适的，此时强制插入一个空周期，让banked寄存器进行更新
assign wait_en =  code_flag&( (cha_vld&( (code_rm_vld&(cha_num==code_rm_num))|(code_rs_vld&(cha_num==code_rs_num))|(code_rn_vld&(cha_num==code_rn_num))|(code_rnhi_vld&(cha_num==code_rnhi_num)) )) | (go_vld&( (code_rm_vld&(go_num==code_rm_num))|(code_rs_vld&(go_num==code_rs_num))|(code_rn_vld&(go_num==code_rn_num)) )) | (to_vld&( (code_rm_vld&(to_num==code_rm_num))|(code_rs_vld&(to_num==code_rs_num))|(code_rn_vld&(to_num==code_rn_num)) )) | (ldm_vld & (sum_m==5'b0)&( (code_rm_vld&(ldm_num==code_rm_num))|(code_rs_vld&(ldm_num==code_rs_num))|(code_rn_vld&(ldm_num==code_rn_num)) )) );

//条件执行的条件判断语句
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

//hold_en表示多周期指令执行，swp会有一个周期的hold_en，ldm会根据sum_m的递减结果而定	
assign hold_en =  cmd_ok & ( cmd_is_swp | ( cmd_is_ldm & (sum_m !=5'b0) ) );	

//cmd_ok表示当前执行级的指令是否正确。它包括当前没有中断发生、cmd_flag有效、条件执行满足
assign cmd_ok =  cmd_flag & cond_satisfy;	
	
/******************************************************/
//PC与rom_en/rom_addr
/******************************************************/	
	
always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_is_b <= #`DEL 1'd0;
else if ( cpu_en & ~hold_en )
    cmd_is_b <= #`DEL  code_is_b;
else;	

always @ ( posedge clk or posedge rst )
if ( rst )
    cmd_is_bx <= #`DEL 1'd0;
else if ( cpu_en & ~hold_en )
    cmd_is_bx <= #`DEL  code_is_bx;
else;	
	
always @ ( posedge clk or posedge rst )
if ( rst )
    rf <= #`DEL 32'd0;
else if ( cpu_en )
    if ( ldm_vld & (ldm_num==4'hf ) )
        rf <= #`DEL  ldm_data;	
	else if ( go_vld & (go_num==4'hf) )
        rf <= #`DEL  go_data;
    else if ( cmd_ok & cmd_is_dp & ( cmd[24:23]!=2'b10 ) & ( cmd[15:12]==4'hf ) )
	    rf <= #`DEL  dp_ans;	
	else if ( cmd_ok & cmd_is_b )
	    rf <= #`DEL  sum_rn_rm;
	else if ( cmd_ok & cmd_is_bx )
	    rf <= #`DEL  shift_word;
    else if ( ~hold_en & ~wait_en )
        rf <= #`DEL  rf + 3'd4;
    else;
else;	
	
//rfx是当前PC+4，它用于Rm和Rn涉及到PC时，可以提前使用	
always @ ( posedge clk or posedge rst )
if ( rst )
    rfx <= #`DEL 32'd0;
else if ( cpu_en & ~hold_en & ~wait_en )
    rfx <= #`DEL  rf + 4'd8;
else;
	
//上一条指令的地址，用在BL指令上或中断时保存PC	
assign rf_b =  rf - 3'd4;		
	
assign to_rf_vld =  cmd_ok & ( ( (cmd[15:12]==4'hf) & ( cmd_is_dp & ( cmd[24:23]!=2'b10 ) ) ) |  cmd_is_b | cmd_is_bx ); 	

//一旦发生异常，即不用取新指令
assign rom_en =  cpu_en & ( ~( to_rf_vld | cha_rf_vld | go_rf_vld | ldm_rf_vld | wait_en | hold_en ) );

assign rom_addr =  rf;	


endmodule
