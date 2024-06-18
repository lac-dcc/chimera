// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/04 15:42:43
// Design Name: 
// Module Name: sccomp361
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//定义从Mem2Reg的Mux写入的信号
`define WDSel_FromALU 2'b00
`define WDSel_FromMEM 2'b01
`define WDSel_FromPC 2'b10

// NPC control signal
`define NPC_PLUS4   3'b000
`define NPC_BRANCH  3'b001
`define NPC_JUMP    3'b010
`define NPC_JALR 3'b100

//ALUOp的定义
`define ALUOp_nop 5'b00000
`define ALUOp_lui 5'b00001
`define ALUOp_auipc 5'b00010
`define ALUOp_add 5'b00011
`define ALUOp_sub 5'b00100
`define ALUOp_bne 5'b00101
`define ALUOp_blt 5'b00110
`define ALUOp_bge 5'b00111
`define ALUOp_bltu 5'b01000
`define ALUOp_bgeu 5'b01001
`define ALUOp_slt 5'b01010
`define ALUOp_sltu 5'b01011
`define ALUOp_xor 5'b01100
`define ALUOp_or 5'b01101
`define ALUOp_and 5'b01110
`define ALUOp_sll 5'b01111
`define ALUOp_srl 5'b10000
`define ALUOp_sra 5'b10001

module sccomp480(clk, rstn, sw_i, disp_seg_o, disp_an_o);
    input clk;                 
    input rstn;                
    input [15:0] sw_i;         
    output [7:0] disp_an_o;   
    output [7:0] disp_seg_o;  
    reg [31:0] clkdiv;        
    wire Clk_CPU;             

//==================第一部分，分频====================
    // 时钟分频逻辑
    always @(posedge clk or negedge rstn) begin
        if (!rstn) clkdiv <= 0;           
        else clkdiv <= clkdiv + 1'b1;    
    end

  //25或者28分频
    assign Clk_CPU=(sw_i[15]) ? clkdiv[27] : clkdiv[24]; 
//===================分频==================================

//==============第二部分，图形模式贪吃蛇======================
reg [63:0] display_data;   //数码管最终显示
reg [5:0]led_data_addr;    //存储贪吃蛇的地址
reg [63:0]led_disp_data;    //贪吃蛇的数据传给他
parameter LED_DATA_NUM = 48;    //最大数量

//数组存数据
reg[63:0]LED_DATA[47:0];   
   initial begin
    LED_DATA[0]= 64'hFFFFFFFEFEFEFEFE;
    LED_DATA[1]= 64'hFFFEFEFEFEFEFFFF;
    LED_DATA[2]= 64'hDEFEFEFEFFFFFFFF;
    LED_DATA[3]= 64'hCEFEFEFFFFFFFFFF;
    LED_DATA[4]= 64'hC2FFFFFFFFFFFFFF;
    LED_DATA[5]= 64'hC1FEFFFFFFFFFFFF;
    LED_DATA[6]= 64'hF1FCFFFFFFFFFFFF;
    LED_DATA[7]= 64'hFDF8F7FFFFFFFFFF;
    LED_DATA[8]= 64'hFFF8F3FFFFFFFFFF;
    LED_DATA[9]= 64'hFFFBF1FEFFFFFFFF;
    LED_DATA[10]= 64'hFFFFF9F8FFFFFFFF;
    LED_DATA[11]= 64'hFFFFFDF8F7FFFFFF;
    LED_DATA[12]= 64'hFFFFFFF9F1FFFFFF;
    LED_DATA[13]= 64'hFFFFFFFFF1FCFFFF;
    LED_DATA[14]= 64'hFFFFFFFFF9F8FFFF;
    LED_DATA[15]= 64'hFFFFFFFFFFF8F3FF;
    LED_DATA[16]= 64'hFFFFFFFFFFFBF1FE;
    LED_DATA[17]= 64'hFFFFFFFFFFFFF9BC;
    LED_DATA[18]= 64'hFFFFFFFFFFFFBDBC;
    LED_DATA[19]= 64'hFFFFFFFFBFBFBFBD;
    LED_DATA[20]= 64'hFFFFBFBFBFBFBFFF;
    LED_DATA[21]= 64'hFFBFBFBFBFBFFFFF;
    LED_DATA[22]= 64'hAFBFBFBFFFFFFFFF;
    LED_DATA[23]= 64'h2737FFFFFFFFFFFF;
    LED_DATA[24]= 64'h277777FFFFFFFFFF;
    LED_DATA[25]= 64'h7777777777FFFFFF;
    LED_DATA[26]= 64'hFFFF7777777777FF;
    LED_DATA[27]= 64'hFFFFFF7777777777;
    LED_DATA[28]= 64'hFFFFFFFFFF777771;
    LED_DATA[29]= 64'hFFFFFFFFFFFF7770;
    LED_DATA[30]= 64'hFFFFFFFFFFFFFFC8;
    LED_DATA[31]= 64'hFFFFFFFFFFFFF7CE;
    LED_DATA[32]= 64'hFFFFFFFFFFFFC7CF;
    LED_DATA[33]= 64'hFFFFFFFFFFDEC7FF;
    LED_DATA[34]= 64'hFFFFFFFFF7CEDFFF;
    LED_DATA[35]= 64'hFFFFFFFFC7CFFFFF;    
    LED_DATA[36]= 64'hFFFFFFFEC7EFFFFF;
    LED_DATA[37]= 64'hFFFFFFCECFFFFFFF;
    LED_DATA[38]= 64'hFFFFE7CEFFFFFFFF;
    LED_DATA[39]= 64'hFFFFC7CFFFFFFFFF;
    LED_DATA[40]= 64'hFFDEC7FFFFFFFFFF;
    LED_DATA[41]= 64'hF7CEDFFFFFFFFFFF;
    LED_DATA[42]= 64'hA7CFFFFFFFFFFFFF;
    LED_DATA[43]= 64'hA7AFFFFFFFFFFFFF;
    LED_DATA[44]= 64'hAFBFBFBFFFFFFFFF;
    LED_DATA[45]= 64'hBFBFBFBFBFFFFFFF;
    LED_DATA[46]= 64'hFFFFBFBFBFBFBFFF;
    LED_DATA[47]= 64'hFFFFFFFFBFBFBFBD;
   end
 //输出贪吃蛇
 always @(posedge Clk_CPU or negedge rstn) begin 
  if(!rstn) begin 
    led_data_addr <= 6'd0; 
    led_disp_data <= 64'b1; 
  end
  else if(sw_i[0] == 1'b1) begin 
    if(led_data_addr == LED_DATA_NUM) 
    begin 
      led_data_addr <= 6'd0;
      led_disp_data <= 64'b1;
    end
    led_disp_data <= LED_DATA[led_data_addr]; 
    led_data_addr <= led_data_addr + 1'b1; 
  end
  else led_data_addr <= led_data_addr; 
end
//============第二部分====================================== 

//因为需要数码管显示，所以这里提前定义了(^v^)
    wire [31:0] instr;  //从ROM中取的指令
    reg[31:0] reg_data; //寄存器读出来的数据
    reg[31:0] alu_disp_data; //alu的相关输入数据，比如输入，输出
    reg[31:0] dmem_data; //RAM数据

//===============第三部分，数码显示======================
//选择信号源
always @(sw_i) begin
    if (sw_i[0] == 0) begin
    case(sw_i[14:11])
        4'b1000: display_data = instr;  //显示指令(16进制)
        4'b0100: display_data = reg_data;   //显示寄存器数据
        4'b0010: display_data = alu_disp_data;  //显示alu数据
        4'b0001: display_data = dmem_data;  //显示dm数据
        default: display_data = instr;  //默认显示指令(16进制)
    endcase
    end 
    else 
    begin
        display_data = led_disp_data;
    end
    end
//============================================

//===============第四部分，取指令==================
parameter IM_CODE_NUM = 17;//rom地址最大值
reg [31:0] rom_addr;//读取rom的地址
//ROM取值的实例化
dist_mem_gen_0 IP_core_480(.a(rom_addr),.spo(instr));
 //================================================

//=======第五部分,Decode,对变量赋初值==================
wire [6:0]Op;  
assign Op = instr[6:0]; //opcode
wire [6:0]Funct7;
assign Funct7 = instr[31:25];   //funcnt7
wire [2:0]Funct3;
assign Funct3 = instr[14:12];   //funct3
wire [4:0]rs1;
assign rs1 = instr[19:15];  // rs1
wire [4:0]rs2 ;
assign rs2= instr[24:20];  // rs2
wire [4:0]rd;
assign rd = instr[11:7];  // rd
wire [11:0]iimm;      
assign iimm = instr[31:20]; //i型指令的立即数解析方式生成的立即数
wire [11:0]simm;
assign simm = {instr[31:25],instr[11:7]};   //s型指令立即数解析方式生成的立即数
wire [4:0] iimm_shamt;
assign iimm_shamt = instr[24:20];   //i形指令移位立即数
wire [19:0] jimm;
assign jimm = {instr[31],instr[19:12],instr[20],instr[30:21]};  //UJ型指令立即数
wire [11:0] bimm;
assign bimm = {instr[31],instr[7],instr[30:25],instr[11:8]};    //SB型指令立即数
wire [19:0] uimm;
assign uimm = instr[31:12]; //U型指令立即数 
//===============================================

//========第六部分，控制信号例化=================== 
    wire[7:0] Zero; //alu输出的两个值之一，用于branch
    wire RegWrite;//用于控制写信号
    wire MemWrite;//是否写入Mem
    wire[5:0]EXTOp;//立即数生成信号
    wire[4:0] ALUOp;//ALUOp
    wire ALUSrc;//ALUSrc
    wire [2:0] DMType;//Mem读取/写入方式：字节/半字...
    wire [1:0]WDSel;//控制信号,写回寄存器
    wire [2:0]NPCOp;//NPCOp下一条ROMadddress
 ctrl_480 U_CTRL_480(
    .Op(Op),
    .Funct3(Funct3),
    .Funct7(Funct7),
    .Zero(Zero),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .EXTOp(EXTOp),
    .ALUOp(ALUOp),
    .NPCOp(NPCOp),
    .ALUSrc(ALUSrc),
    .DMType(DMType),
    .WDSel(WDSel)
    );
 //========================================
 
//================第七部分，立即数生成===============
  wire [31:0]immout;//立即数生成输出的立即数
EXT_480 U_EXT_480(
    .iimm_shamt(iimm_shamt),
    .iimm(iimm),
    .simm(simm),
    .bimm(bimm),
    .uimm(uimm),
    .jimm(jimm),
    .EXTOp(EXTOp),
    .immout(immout)
); 
//==============================================

//================第八部分，RF===================
    wire[31:0]RD1;//第一个读端口读出来的数据
    wire[31:0]RD2;//第二个读端口读出来的数据
    wire[31:0] WD; //写入寄存器的数据
    reg [4:0] reg_addr; //寄存器地址
    parameter MAXREGNUM = 15;//寄存器最大地址
//RF的例化
    RF_480 U_RF_480(
    .clk(Clk_CPU),
    .rstn(rstn),
    .RFWr(RegWrite),
    .A1(rs1),
    .A2(rs2),
    .A3(rd),
    .WD(WD),
    .sw_i(sw_i),
    .RD1(RD1),
    .RD2(RD2)
    );
 //reg_addr增加+读出对应rf的值
 always@(posedge Clk_CPU or negedge rstn) 
      begin
         if(!rstn) 
         begin reg_addr = 5'd0; reg_data = U_RF_480.rf[reg_addr];end
         else if(sw_i[13]==1'b1) begin 
         begin
            reg_addr = reg_addr + 1'b1;
            reg_data = U_RF_480.rf[reg_addr]; 
          end
             if (reg_addr == MAXREGNUM)
              begin reg_addr = 5'd0;end
           end
         else reg_addr = reg_addr;
      end
 //============================================
 
//==============第九部分ALU===================
    wire signed [31:0]A;    //ALU第一个输入
    wire signed [31:0]B;    //ALU第二个输入
    wire signed[31:0] aluout;   //ALU的输出
    reg[2:0] alu_addr = 0; //用于选择输出ALU的不同量
    //选择ALU的输入，用mux搞定RD2
    assign A=RD1;
    alu_mux_480 U_alu_mux_480(
            .immout(immout),
            .RD2(RD2),
            .ALUSrc(ALUSrc),
            .B(B)
    );
 //alu例化
   alu_480 U_alu_480(
        .clk(clk), 
        .rstn(rstn), 
        .A(A), 
        .B(B), 
        .rom_addr(rom_addr),
        .ALUOp(ALUOp), 
        .C(aluout), 
        .Zero(Zero)
    );
 //循环显示ALU的内容，选择ALU的输出数据
always@(posedge Clk_CPU or negedge rstn)
begin
    if(!rstn)alu_addr=3'b000;
    else if(sw_i[12]==1'b1)
    begin
    if(alu_addr==3'b100) begin alu_addr=3'b000;alu_disp_data=32'hffffffff;end
    else begin
   case(alu_addr)
     3'b001:alu_disp_data=U_alu_480.A;
     3'b010:alu_disp_data=U_alu_480.B;
     3'b011:alu_disp_data=U_alu_480.C;
     3'b100:alu_disp_data=U_alu_480.Zero;
    default:alu_disp_data=32'hFFFFFFFF;
    endcase
    alu_addr=alu_addr+1'b1;
    end
    end
    else alu_disp_data=alu_disp_data;
end
//===============================================

//=============第十部分dm=========================
//=============之前写DM的时候，测试DM用，这里会冲突，注释了============================
      //对输入DM的例化进行赋值
//      assign MemWrite= sw_i[2]&(~sw_i[1]);
//      assign dm_addr = {{2{1'b0}},sw_i[10:8]};
//      assign dm_din = {{5{1'b0}},sw_i[7:5]};
//      assign DMType = {{1'b0},sw_i[4:3]};
//==================================================
    wire [6:0]dm_addr;  
    assign dm_addr=aluout;  //Mem的地址，由ALU计算得出
    wire [31:0]dm_din;
    assign dm_din=RD2;  //输入Mem的数据，store指令时，用第二个读端口读出来的数据
    wire [31:0]dm_dout; 
    reg [7:0]dmem_addr=0;   //读dmem的值
    parameter DM_DATA_NUM=16;   //读dmem的最大地址
       
//dm实例化
      DM_480 U_DM_480(
            .clk(Clk_CPU),
            .rstn(rstn),
            .DMWr(MemWrite),
            .addr(dm_addr),
            .din(dm_din),
            .DMType(DMType),
            .sw_i(sw_i),
            .dout(dm_dout)
      );
 //循环显示dm内容：只显示前面16个
      always@(posedge Clk_CPU or posedge rstn)
      begin
      if(!rstn)begin dmem_addr=7'b0;dmem_data=U_DM_480.dmem[dmem_addr][7:0];end
      else if (sw_i[11]==1'b1)
            begin
            dmem_addr = dmem_addr+1'b1;
            dmem_data = U_DM_480.dmem[dmem_addr][7:0];
            dmem_data = {dmem_addr,{dmem_data[27:0]}};
            if (dmem_addr==DM_DATA_NUM) begin
            dmem_addr = 7'b0;
            dmem_data = 32'hffffffff;end
            end
      end 
 //选择输入rf的值 
rf_mux_480 U_RF_mux_480(
        .WDSel(WDSel),
        .dout(dm_dout),
        .PC_out(rom_addr),
        .aluout(aluout),
        .WD(WD)
);
//=========================================

//===========第十一部分，ROM地址的更新，写回PC======
always@(posedge Clk_CPU or negedge rstn)begin
        if(!rstn) begin if(sw_i[1]==1'b0)rom_addr = 32'b0;end   //清零
        else 
        begin 
            if(sw_i[1] == 1'b0) //正常模式          
                begin
                case(NPCOp)
                `NPC_PLUS4: rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);                            
                `NPC_BRANCH:begin 
                            case(ALUOp)
                            `ALUOp_sub:if(Zero==1) rom_addr =(rom_addr+(immout>>>2))%(IM_CODE_NUM); else rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);
                            `ALUOp_bne:if(Zero==0) rom_addr =(rom_addr+(immout>>>2))%(IM_CODE_NUM); else rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);
                            `ALUOp_blt:if(aluout<0) rom_addr =(rom_addr+(immout>>>2))%(IM_CODE_NUM); else rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);
                            `ALUOp_bge:if(aluout>=0) rom_addr =(rom_addr+(immout>>>2))%(IM_CODE_NUM); else rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);
                            `ALUOp_bltu:if(aluout==1) rom_addr =(rom_addr+(immout>>>2))%(IM_CODE_NUM); else rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);
                            `ALUOp_bgeu:if(aluout==1) rom_addr =(rom_addr+(immout>>>2))%(IM_CODE_NUM); else rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);
                            default:rom_addr = (rom_addr +1'b1)%(IM_CODE_NUM);
                            endcase
                            end
                `NPC_JUMP:rom_addr = (rom_addr+immout)%(IM_CODE_NUM); 
                `NPC_JALR: rom_addr = (U_RF_480.rf[rs1]+immout)%(IM_CODE_NUM);
                endcase
               end
            else if(sw_i[1]==1'b1)rom_addr = rom_addr;  //调试模式
        end
    end
//===================================================
//===========第十二部分,数码管的实例化===========
   seg7x16_480 u_seg7x16_480(
    .clk(clk),       
    .rstn(rstn),     
    .i_data(display_data), 
    .disp_mode(sw_i[0]),  
    .o_seg(disp_seg_o),   
    .o_sel(disp_an_o)     
);   
//=============================================
 
endmodule

