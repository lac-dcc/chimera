// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:Meyesemi 
// Engineer: Will
// 
// Create Date: 2023-03-17  
// Design Name:  
// Module Name: 
// Project Name: 
// Target Devices: Pango
// Tool Versions: 
// Description: 
//      
// Dependencies: 
// 
// Revision:
// Revision 1.0 - File Created
// Additional Comments:
// 
///// /////////////////////////////////////////////////////////////////////////////
//camera中寄存器的配置程序
module reg_config_1 #(
	parameter  RESOLUTION = 'd0			//0:1280*720   1:800*600  2:640*480  
)(     
	input clk_25M,
	input camera_rstn,
	input initial_en,
	output reg_conf_done,
	output i2c_sclk,
	inout  i2c_sdat,
	output reg clock_20k,
	output reg [8:0]reg_index
);

reg [15:0]clock_20k_cnt;
reg [1:0]config_step;	  
reg [31:0]i2c_data;
reg [23:0]reg_data;
reg start;
reg reg_conf_done_reg;
reg i2c_en;
i2c_com u1(.clock_i2c(clock_20k),
            .camera_rstn(initial_en),
            .ack(ack),
            .i2c_data(i2c_data),
            .start(start),
            .tr_end(tr_end),
            .i2c_sclk(i2c_sclk),
            .i2c_sdat(i2c_sdat));

assign reg_conf_done=reg_conf_done_reg;

//产生i2c控制时钟-20khz    
always@(posedge clk_25M)   
begin
   if(!initial_en) begin
        clock_20k<=0;
        clock_20k_cnt<=0;
   end
   else if(clock_20k_cnt<1249)
      clock_20k_cnt<=clock_20k_cnt+1'b1;
   else begin
         clock_20k<=!clock_20k;
         clock_20k_cnt<=0;
   end
end


////iic寄存器配置过程控制    
always@(posedge clock_20k)    
begin
   if(!initial_en) begin
       config_step<=0;
       start<=0;
       reg_index<=0;
		 reg_conf_done_reg<=0;
   end
   else begin
      if(reg_conf_done_reg==1'b0) begin          //如果camera初始化未完成
			  if(reg_index<357) begin               //配置寄存器
					 case(config_step)
					 0:begin
						i2c_data<={8'h78,reg_data};       //OV5640 IIC Device address is 0x78   
						start<=1;                         //i2c写开始
						config_step<=1;                  
					 end
					 1:begin
						if(tr_end) begin                  //i2c写结束               					
							 start<=0;
							 config_step<=2;
						end
					 end
					 2:begin
						  reg_index<=reg_index+1'b1;       //配置下一个寄存器
						  config_step<=0;
					 end
					 endcase
				end
			 else 
				reg_conf_done_reg<=1'b1;                //OV5640寄存器初始化完成
      end
   end
 end
			
////iic需要配置的寄存器值  			
always@(reg_index) begin
	if(RESOLUTION == 'd0)begin
		case(reg_index)
		0    :reg_data   <=24'h310311 ;//      
		1    :reg_data   <=24'h300882 ;//      

		102  :reg_data   <=24'h300842 ;//      
		103  :reg_data   <=24'h310303 ;//      
		104  :reg_data   <=24'h3017ff ;//      
		105  :reg_data   <=24'h3018ff ;//      
		106  :reg_data   <=24'h30341A ;//      
		107  :reg_data   <=24'h303713 ;//      
		108  :reg_data   <=24'h310801 ;//      
		109  :reg_data   <=24'h363036 ;//      
		110  :reg_data  <=24'h36310e ;//       
		111  :reg_data  <=24'h3632e2 ;//       
		112  :reg_data  <=24'h363312 ;//       
		113  :reg_data  <=24'h3621e0 ;//       
		114  :reg_data  <=24'h3704a0 ;//       
		115  :reg_data  <=24'h37035a ;//       
		116  :reg_data  <=24'h371578 ;//       
		117  :reg_data  <=24'h371701 ;//       
		118  :reg_data  <=24'h370b60 ;//       
		119  :reg_data  <=24'h37051a ;//       
		120  :reg_data  <=24'h390502 ;//       
		121  :reg_data  <=24'h390610 ;//       
		122  :reg_data  <=24'h39010a ;//       
		123  :reg_data  <=24'h373112 ;//       
		124  :reg_data  <=24'h360008 ;//       
		125  :reg_data  <=24'h360133 ;//       
		126  :reg_data  <=24'h302d60 ;//       
		127  :reg_data  <=24'h362052 ;//       
		128  :reg_data  <=24'h371b20 ;//       
		129  :reg_data  <=24'h471c50 ;//       
		130  :reg_data  <=24'h3a1343 ;//       
		131  :reg_data  <=24'h3a1800 ;//       
		132  :reg_data  <=24'h3a19f8 ;//       
		133  :reg_data  <=24'h363513 ;//       
		134  :reg_data  <=24'h363603 ;//       
		135  :reg_data  <=24'h363440 ;//       
		136  :reg_data  <=24'h362201 ;///      
		137  :reg_data  <=24'h3c0134 ;//       
		138  :reg_data  <=24'h3c0428 ;//       
		139  :reg_data  <=24'h3c0598 ;//       
		140  :reg_data  <=24'h3c0600 ;//       
		141  :reg_data  <=24'h3c0708 ;//       
		142  :reg_data  <=24'h3c0800 ;//       
		143  :reg_data  <=24'h3c091c ;//       
		144  :reg_data  <=24'h3c0a9c ;//       
		145  :reg_data  <=24'h3c0b40 ;//       
		146  :reg_data  <=24'h381000 ;//       
		147  :reg_data  <=24'h381110 ;//       
		148  :reg_data  <=24'h381200 ;//       
		149  :reg_data  <=24'h370864 ;//       
		150  :reg_data  <=24'h400102 ;//       
		151  :reg_data  <=24'h40051a ;//       
		152  :reg_data  <=24'h300000 ;//       
		153  :reg_data  <=24'h3004ff ;//       
		154  :reg_data  <=24'h300e58 ;//       
		155  :reg_data  <=24'h302e00 ;//       
		156  :reg_data  <=24'h430030 ;// 60      
		157  :reg_data  <=24'h501f00 ;// 01      
		158  :reg_data  <=24'h440e00 ;//       
		159  :reg_data  <=24'h5000a7 ;//     
		160  :reg_data  <=24'h3a0f30 ;//       
		161  :reg_data  <=24'h3a1028 ;//       
		162  :reg_data  <=24'h3a1b30 ;//       
		163  :reg_data  <=24'h3a1e26 ;//       
		164  :reg_data  <=24'h3a1160 ;//       
		165  :reg_data  <=24'h3a1f14 ;//       
		166  :reg_data  <=24'h580023 ;//       
		167  :reg_data  <=24'h580114 ;//       
		168  :reg_data  <=24'h58020f ;//       
		169  :reg_data  <=24'h58030f ;//       
		170  :reg_data  <=24'h580412 ;//       
		171  :reg_data  <=24'h580526 ;//       
		172  :reg_data  <=24'h58060c ;//       
		173  :reg_data  <=24'h580708 ;//       
		174  :reg_data  <=24'h580805 ;//       
		175  :reg_data  <=24'h580905 ;//       
		176  :reg_data  <=24'h580a08 ;//       
		177  :reg_data  <=24'h580b0d ;//       
		178  :reg_data  <=24'h580c08 ;//       
		179  :reg_data  <=24'h580d03 ;//       
		180  :reg_data  <=24'h580e00 ;//       
		181  :reg_data  <=24'h580f00 ;//       
		182  :reg_data  <=24'h581003 ;//       
		183  :reg_data  <=24'h581109 ;//       
		184  :reg_data  <=24'h581207 ;//       
		185  :reg_data  <=24'h581303 ;//       
		186  :reg_data  <=24'h581400 ;//       
		187  :reg_data  <=24'h581501 ;//       
		188  :reg_data  <=24'h581603 ;//       
		189  :reg_data  <=24'h581708 ;//       
		190  :reg_data  <=24'h58180d ;//       
		191  :reg_data  <=24'h581908 ;//       
		192  :reg_data  <=24'h581a05 ;//       
		193  :reg_data  <=24'h581b06 ;//       
		194  :reg_data  <=24'h581c08 ;//       
		195  :reg_data  <=24'h581d0e ;//       
		196  :reg_data  <=24'h581e29 ;//       
		197  :reg_data  <=24'h581f17 ;//       
		198  :reg_data  <=24'h582011 ;//       
		199  :reg_data  <=24'h582111 ;//       
		200  :reg_data <=24'h582215 ;//        
		201  :reg_data <=24'h582328 ;//        
		202  :reg_data <=24'h582446 ;//        
		203  :reg_data <=24'h582526 ;//        
		204  :reg_data <=24'h582608 ;//        
		205  :reg_data <=24'h582726 ;//        
		206  :reg_data <=24'h582864 ;//        
		207  :reg_data <=24'h582926 ;//        
		208  :reg_data <=24'h582a24 ;//        
		209  :reg_data <=24'h582b22 ;//        
		210  :reg_data <=24'h582c24 ;//        
		211  :reg_data <=24'h582d24 ;//        
		212  :reg_data <=24'h582e06 ;//        
		213  :reg_data <=24'h582f22 ;//        
		214  :reg_data <=24'h583040 ;//        
		215  :reg_data <=24'h583142 ;//        
		216  :reg_data <=24'h583224 ;//        
		217  :reg_data <=24'h583326 ;//        
		218  :reg_data <=24'h583424 ;//        
		219  :reg_data <=24'h583522 ;//        
		220  :reg_data <=24'h583622 ;//        
		221  :reg_data <=24'h583726 ;//        
		222  :reg_data <=24'h583844 ;//        
		223  :reg_data <=24'h583924 ;//        
		224  :reg_data <=24'h583a26 ;//        
		225  :reg_data <=24'h583b28 ;//        
		226  :reg_data <=24'h583c42 ;//        
		227  :reg_data <=24'h583dce ;//        
		228  :reg_data <=24'h5180ff ;//        
		229  :reg_data <=24'h5181f2 ;//        
		230  :reg_data <=24'h518200 ;//        
		231  :reg_data <=24'h518314 ;//        
		232  :reg_data <=24'h518425 ;//        
		233  :reg_data <=24'h518524 ;//        
		234  :reg_data <=24'h518609 ;//        
		235  :reg_data <=24'h518709 ;//        
		236  :reg_data <=24'h518809 ;//        
		237  :reg_data <=24'h518975 ;//        
		238  :reg_data <=24'h518a54 ;//        
		239  :reg_data <=24'h518be0 ;//        
		240  :reg_data <=24'h518cb2 ;//        
		241  :reg_data <=24'h518d42 ;//        
		242  :reg_data <=24'h518e3d ;//        
		243  :reg_data <=24'h518f56 ;//        
		244  :reg_data <=24'h519046 ;//        
		245  :reg_data <=24'h5191f8 ;//        
		246  :reg_data <=24'h519204 ;//        
		247  :reg_data <=24'h519370 ;//        
		248  :reg_data <=24'h5194f0 ;//        
		249  :reg_data <=24'h5195f0 ;//        
		250  :reg_data <=24'h519603 ;//        
		251  :reg_data <=24'h519701 ;//        
		252  :reg_data <=24'h519804 ;//        
		253  :reg_data <=24'h519912 ;//        
		254  :reg_data <=24'h519a04 ;//        
		255  :reg_data <=24'h519b00 ;//        
		256  :reg_data <=24'h519c06 ;//        
		257  :reg_data <=24'h519d82 ;//        
		258  :reg_data <=24'h519e38 ;//        
		259  :reg_data <=24'h548001 ;//        
		260  :reg_data <=24'h548108 ;//        
		261  :reg_data <=24'h548214 ;//        
		262  :reg_data <=24'h548328 ;//        
		263  :reg_data <=24'h548451 ;//        
		264  :reg_data <=24'h548565 ;//        
		265  :reg_data <=24'h548671 ;//        
		266  :reg_data <=24'h54877d ;//        
		267  :reg_data <=24'h548887 ;//        
		268  :reg_data <=24'h548991 ;//        
		269  :reg_data <=24'h548a9a ;//        
		270  :reg_data <=24'h548baa ;//        
		271  :reg_data <=24'h548cb8 ;//        
		272  :reg_data <=24'h548dcd ;//        
		273  :reg_data <=24'h548edd ;//        
		274  :reg_data <=24'h548fea ;//        
		275  :reg_data <=24'h54901d ;//        
		276  :reg_data <=24'h53811e ;//        
		277  :reg_data <=24'h53825b ;//        
		278  :reg_data <=24'h538308 ;//        
		279  :reg_data <=24'h53840a ;//        
		280  :reg_data <=24'h53857e ;//        
		281  :reg_data <=24'h538688 ;//        
		282  :reg_data <=24'h53877c ;//        
		283  :reg_data <=24'h53886c ;//        
		284  :reg_data <=24'h538910 ;//        
		285  :reg_data <=24'h538a01 ;//        
		286  :reg_data <=24'h538b98 ;//       
		287  :reg_data <=24'h558006 ;//        
		288  :reg_data <=24'h558340 ;//        
		289  :reg_data <=24'h558410 ;//        
		290  :reg_data <=24'h558910 ;//        
		291  :reg_data <=24'h558a00 ;//        
		292  :reg_data <=24'h558bf8 ;//        
		293  :reg_data <=24'h501d40 ;//        
		294  :reg_data <=24'h530008 ;//        
		295  :reg_data <=24'h530130 ;//        
		296  :reg_data <=24'h530210 ;//        
		297  :reg_data <=24'h530300 ;//        
		298  :reg_data <=24'h530408 ;//        
		299  :reg_data <=24'h530530 ;//        
		300  :reg_data <=24'h530608 ;//        
		301  :reg_data <=24'h530716 ;//        
		302  :reg_data <=24'h530908 ;//        
		303  :reg_data <=24'h530a30 ;//        
		304  :reg_data <=24'h530b04 ;//        
		305  :reg_data <=24'h530c06 ;//        
		306  :reg_data <=24'h502500 ;//        
		307  :reg_data <=24'h300802 ;//       
		//720 30帧/秒, night mode 5fps ;//         
		//input clock=24Mhz,PCLK=84Mhz ;//         
		308  :reg_data <=24'h303521 ;//PLL      
		309  :reg_data <=24'h303669 ;//PLL     
		310  :reg_data <=24'h3c0708 ;//        
		311  :reg_data <=24'h382047 ;//        
		312  :reg_data <=24'h382121 ;// 00       
		313  :reg_data <=24'h381431 ;//        
		314  :reg_data <=24'h381531 ;//        

		315  :reg_data <=24'h380000 ;//        
		316  :reg_data <=24'h380100 ;//        
		317  :reg_data <=24'h380200 ;// 720p 800x600       
		318  :reg_data <=24'h3803fa ;// fa 04      
		319  :reg_data <=24'h38040a ;// 0a       
		320  :reg_data <=24'h38053f ;// 3f       
		321  :reg_data <=24'h380606 ;// 06 07      
		322  :reg_data <=24'h3807a9 ;// a9 9b      
		323  :reg_data <=24'h380805 ;// 水平方向分辨率，后两位 0500：1280  0320     
		324  :reg_data <=24'h380900 ;// 水平方向分辨率       
		325  :reg_data <=24'h380a02 ;// 竖直方向分辨率，后两位 02d0：720   0258    
		326  :reg_data <=24'h380bd0 ;// 竖直方向分辨率       
		327  :reg_data <=24'h380c07 ;// 07       
		328  :reg_data <=24'h380d64 ;// 64 68      
		329  :reg_data <=24'h380e02 ;// 02 03      
		330  :reg_data <=24'h380fe4 ;// e4 d8      
		331  :reg_data <=24'h381304 ;// 04 06      

		332  :reg_data <=24'h361800 ;//        
		333  :reg_data <=24'h361229 ;//        
		334  :reg_data <=24'h370952 ;//        
		335  :reg_data <=24'h370c03 ;//        
		336  :reg_data <=24'h3a0217 ;// 02       
		337  :reg_data <=24'h3a0310 ;// e0       

		338  :reg_data <=24'h3a0800 ;//        
		339  :reg_data <=24'h3a096f ;//        
		340  :reg_data <=24'h3a0a00 ;//        
		341  :reg_data <=24'h3a0b5c ;//        
		342  :reg_data <=24'h3a0e06 ;//        
		343  :reg_data <=24'h3a0d08 ;// 08       
		344  :reg_data <=24'h3a1417 ;// 02        
		345  :reg_data <=24'h3a1510 ;// e0        
		346  :reg_data <=24'h400402 ;// 02        
		347  :reg_data <=24'h300200 ;// 1c        
		348  :reg_data <=24'h3006ff ;// c3        
		349  :reg_data <=24'h471302 ;// 03        
		350  :reg_data <=24'h440704 ;//         
		351  :reg_data <=24'h460b37 ;//           
		352  :reg_data <=24'h460c20 ;//          
		353  :reg_data <=24'h483716 ;//         
		354  :reg_data <=24'h382404 ;//         
		355  :reg_data <=24'h500183 ;//         
		356  :reg_data <=24'h350300 ;//         
		default:reg_data<=24'hffffff;//        
		endcase      
	end	
    else if(RESOLUTION == 'd1) begin
        case(reg_index)
	    	9'd  0: reg_data <= {8'h78 , 24'h310311};// system clock from pad, bit[1]
	    	9'd  1: reg_data <= {8'h78 , 24'h300882};// software reset, bit[7]// delay 5ms 
	    	9'd  2: reg_data <= {8'h78 , 24'h300842};// software power down, bit[6]
	    	9'd  3: reg_data <= {8'h78 , 24'h310303};// system clock from PLL, bit[1]
	    	9'd  4: reg_data <= {8'h78 , 24'h3017ff};// FREX, Vsync, HREF, PCLK, D[9:6] output enable
	    	9'd  5: reg_data <= {8'h78 , 24'h3018ff};// D[5:0], GPIO[1:0] output enable
	    	9'd  6: reg_data <= {8'h78 , 24'h30341A};// MIPI 10-bit
	    	9'd  7: reg_data <= {8'h78 , 24'h303713};// PLL root divider, bit[4], PLL pre-divider, bit[3:0]
	    	9'd  8: reg_data <= {8'h78 , 24'h310801};// PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2] // SCLK root divider, bit[1:0] 
	    	9'd  9: reg_data <= {8'h78 , 24'h363036};
	    	9'd 10: reg_data <= {8'h78 , 24'h36310e};
	    	9'd 11: reg_data <= {8'h78 , 24'h3632e2};
	    	9'd 12: reg_data <= {8'h78 , 24'h363312};
	    	9'd 13: reg_data <= {8'h78 , 24'h3621e0};
	    	9'd 14: reg_data <= {8'h78 , 24'h3704a0};
	    	9'd 15: reg_data <= {8'h78 , 24'h37035a};
	    	9'd 16: reg_data <= {8'h78 , 24'h371578};
	    	9'd 17: reg_data <= {8'h78 , 24'h371701};
	    	9'd 18: reg_data <= {8'h78 , 24'h370b60};
	    	9'd 19: reg_data <= {8'h78 , 24'h37051a};
	    	9'd 20: reg_data <= {8'h78 , 24'h390502};
	    	9'd 21: reg_data <= {8'h78 , 24'h390610};
	    	9'd 22: reg_data <= {8'h78 , 24'h39010a};
	    	9'd 23: reg_data <= {8'h78 , 24'h373112};
	    	9'd 24: reg_data <= {8'h78 , 24'h360008};// VCM control
	    	9'd 25: reg_data <= {8'h78 , 24'h360133};// VCM control
	    	9'd 26: reg_data <= {8'h78 , 24'h302d60};// system control
	    	9'd 27: reg_data <= {8'h78 , 24'h362052};
	    	9'd 28: reg_data <= {8'h78 , 24'h371b20};
	    	9'd 29: reg_data <= {8'h78 , 24'h471c50};
	    	9'd 30: reg_data <= {8'h78 , 24'h3a1343};// pre-gain = 1.047x
	    	9'd 31: reg_data <= {8'h78 , 24'h3a1800};// gain ceiling
	    	9'd 32: reg_data <= {8'h78 , 24'h3a19f8};// gain ceiling = 15.5x
	    	9'd 33: reg_data <= {8'h78 , 24'h363513};
	    	9'd 34: reg_data <= {8'h78 , 24'h363603};
	    	9'd 35: reg_data <= {8'h78 , 24'h363440};
	    	9'd 36: reg_data <= {8'h78 , 24'h362201}; // 50/60Hz detection     50/60Hz 鐏?鍏夋潯绾硅繃鎰1?7?1?7?
	    	9'd 37: reg_data <= {8'h78 , 24'h3c0134};// Band auto, bit[7]
	    	9'd 38: reg_data <= {8'h78 , 24'h3c0428};// threshold low sum	 
	    	9'd 39: reg_data <= {8'h78 , 24'h3c0598};// threshold high sum
	    	9'd 40: reg_data <= {8'h78 , 24'h3c0600};// light meter 1 threshold[15:8]
	    	9'd 41: reg_data <= {8'h78 , 24'h3c0708};// light meter 1 threshold[7:0]
	    	9'd 42: reg_data <= {8'h78 , 24'h3c0800};// light meter 2 threshold[15:8]
	    	9'd 43: reg_data <= {8'h78 , 24'h3c091c};// light meter 2 threshold[7:0]
	    	9'd 44: reg_data <= {8'h78 , 24'h3c0a9c};// sample number[15:8]
	    	9'd 45: reg_data <= {8'h78 , 24'h3c0b40};// sample number[7:0]
	    	9'd 46: reg_data <= {8'h78 , 24'h381000};// Timing Hoffset[11:8]
	    	9'd 47: reg_data <= {8'h78 , 24'h381110};// Timing Hoffset[7:0]
	    	9'd 48: reg_data <= {8'h78 , 24'h381200};// Timing Voffset[10:8] 
	    	9'd 49: reg_data <= {8'h78 , 24'h370864};
	    	9'd 50: reg_data <= {8'h78 , 24'h400102};// BLC start from line 2
	    	9'd 51: reg_data <= {8'h78 , 24'h40051a};// BLC always update
	    	9'd 52: reg_data <= {8'h78 , 24'h300000};// enable blocks
	    	9'd 53: reg_data <= {8'h78 , 24'h3004ff};// enable clocks 
	    	9'd 54: reg_data <= {8'h78 , 24'h300e58};// MIPI power down, DVP enable
	    	9'd 55: reg_data <= {8'h78 , 24'h302e00};
	    	9'd 56: reg_data <= {8'h78 , 24'h430030};// YUV 422,YUYV
	    	9'd 57: reg_data <= {8'h78 , 24'h501f00};// YUV422
	    	9'd 58: reg_data <= {8'h78 , 24'h440e00};
	    	9'd 59: reg_data <= {8'h78 , 24'h5000a7}; // Lenc on, raw gamma on, BPC on, WPC on, CIP on // AEC target    鑷?鍔ㄦ洕鍏夋帶鍒?
	    	9'd 60: reg_data <= {8'h78 , 24'h3a0f30};// stable range in high
	    	9'd 61: reg_data <= {8'h78 , 24'h3a1028};// stable range in low
	    	9'd 62: reg_data <= {8'h78 , 24'h3a1b30};// stable range out high
	    	9'd 63: reg_data <= {8'h78 , 24'h3a1e26};// stable range out low
	    	9'd 64: reg_data <= {8'h78 , 24'h3a1160};// fast zone high
	    	9'd 65: reg_data <= {8'h78 , 24'h3a1f14};// fast zone low// Lens correction for ?   ?1?7?1?7?滃ご琛ュ?1?7?1?7?
	    	9'd 66: reg_data <= {8'h78 , 24'h580023};
	    	9'd 67: reg_data <= {8'h78 , 24'h580114};
	    	9'd 68: reg_data <= {8'h78 , 24'h58020f};
	    	9'd 69: reg_data <= {8'h78 , 24'h58030f};
	    	9'd 70: reg_data <= {8'h78 , 24'h580412};
	    	9'd 71: reg_data <= {8'h78 , 24'h580526};
	    	9'd 72: reg_data <= {8'h78 , 24'h58060c};
	    	9'd 73: reg_data <= {8'h78 , 24'h580708};
	    	9'd 74: reg_data <= {8'h78 , 24'h580805};
	    	9'd 75: reg_data <= {8'h78 , 24'h580905};
	    	9'd 76: reg_data <= {8'h78 , 24'h580a08};
	    	9'd 77: reg_data <= {8'h78 , 24'h580b0d};
	    	9'd 78: reg_data <= {8'h78 , 24'h580c08};
	    	9'd 79: reg_data <= {8'h78 , 24'h580d03};
	    	9'd 80: reg_data <= {8'h78 , 24'h580e00};
	    	9'd 81: reg_data <= {8'h78 , 24'h580f00};
	    	9'd 82: reg_data <= {8'h78 , 24'h581003};
	    	9'd 83: reg_data <= {8'h78 , 24'h581109};
	    	9'd 84: reg_data <= {8'h78 , 24'h581207};
	    	9'd 85: reg_data <= {8'h78 , 24'h581303};
	    	9'd 86: reg_data <= {8'h78 , 24'h581400};
	    	9'd 87: reg_data <= {8'h78 , 24'h581501};
	    	9'd 88: reg_data <= {8'h78 , 24'h581603};
	    	9'd 89: reg_data <= {8'h78 , 24'h581708};
	    	9'd 90: reg_data <= {8'h78 , 24'h58180d};
	    	9'd 91: reg_data <= {8'h78 , 24'h581908};
	    	9'd 92: reg_data <= {8'h78 , 24'h581a05};
	    	9'd 93: reg_data <= {8'h78 , 24'h581b06};
	    	9'd 94: reg_data <= {8'h78 , 24'h581c08};
	    	9'd 95: reg_data <= {8'h78 , 24'h581d0e};
	    	9'd 96: reg_data <= {8'h78 , 24'h581e29};
	    	9'd 97: reg_data <= {8'h78 , 24'h581f17};
	    	9'd 98: reg_data <= {8'h78 , 24'h582011};
	    	9'd 99: reg_data <= {8'h78 , 24'h582111};
	    	9'd100: reg_data <= {8'h78 , 24'h582215};
	    	9'd101: reg_data <= {8'h78 , 24'h582328};
	    	9'd102: reg_data <= {8'h78 , 24'h582446};
	    	9'd103: reg_data <= {8'h78 , 24'h582526};
	    	9'd104: reg_data <= {8'h78 , 24'h582608};
	    	9'd105: reg_data <= {8'h78 , 24'h582726};
	    	9'd106: reg_data <= {8'h78 , 24'h582864};
	    	9'd107: reg_data <= {8'h78 , 24'h582926};
	    	9'd108: reg_data <= {8'h78 , 24'h582a24};
	    	9'd109: reg_data <= {8'h78 , 24'h582b22};
	    	9'd110: reg_data <= {8'h78 , 24'h582c24};
	    	9'd111: reg_data <= {8'h78 , 24'h582d24};
	    	9'd112: reg_data <= {8'h78 , 24'h582e06};
	    	9'd113: reg_data <= {8'h78 , 24'h582f22};
	    	9'd114: reg_data <= {8'h78 , 24'h583040};
	    	9'd115: reg_data <= {8'h78 , 24'h583142};
	    	9'd116: reg_data <= {8'h78 , 24'h583224};
	    	9'd117: reg_data <= {8'h78 , 24'h583326};
	    	9'd118: reg_data <= {8'h78 , 24'h583424};
	    	9'd119: reg_data <= {8'h78 , 24'h583522};
	    	9'd120: reg_data <= {8'h78 , 24'h583622};
	    	9'd121: reg_data <= {8'h78 , 24'h583726};
	    	9'd122: reg_data <= {8'h78 , 24'h583844};
	    	9'd123: reg_data <= {8'h78 , 24'h583924};
	    	9'd124: reg_data <= {8'h78 , 24'h583a26};
	    	9'd125: reg_data <= {8'h78 , 24'h583b28};
	    	9'd126: reg_data <= {8'h78 , 24'h583c42};
	    	9'd127: reg_data <= {8'h78 , 24'h583dce};// lenc BR offset // AWB   鑷?鍔ㄧ櫧骞硠1?7?1?7?
	    	9'd128: reg_data <= {8'h78 , 24'h5180ff};// AWB B block
	    	9'd129: reg_data <= {8'h78 , 24'h5181f2};// AWB control 
	    	9'd130: reg_data <= {8'h78 , 24'h518200};// [7:4] max local counter, [3:0] max fast counter
	    	9'd131: reg_data <= {8'h78 , 24'h518314};// AWB advanced 
	    	9'd132: reg_data <= {8'h78 , 24'h518425};
	    	9'd133: reg_data <= {8'h78 , 24'h518524};
	    	9'd134: reg_data <= {8'h78 , 24'h518609};
	    	9'd135: reg_data <= {8'h78 , 24'h518709};
	    	9'd136: reg_data <= {8'h78 , 24'h518809};
	    	9'd137: reg_data <= {8'h78 , 24'h518975};
	    	9'd138: reg_data <= {8'h78 , 24'h518a54};
	    	9'd139: reg_data <= {8'h78 , 24'h518be0};
	    	9'd140: reg_data <= {8'h78 , 24'h518cb2};
	    	9'd141: reg_data <= {8'h78 , 24'h518d42};
	    	9'd142: reg_data <= {8'h78 , 24'h518e3d};
	    	9'd143: reg_data <= {8'h78 , 24'h518f56};
	    	9'd144: reg_data <= {8'h78 , 24'h519046};
	    	9'd145: reg_data <= {8'h78 , 24'h5191f8};// AWB top limit
	    	9'd146: reg_data <= {8'h78 , 24'h519204};// AWB bottom limit
	    	9'd147: reg_data <= {8'h78 , 24'h519370};// red limit
	    	9'd148: reg_data <= {8'h78 , 24'h5194f0};// green limit
	    	9'd149: reg_data <= {8'h78 , 24'h5195f0};// blue limit
	    	9'd150: reg_data <= {8'h78 , 24'h519603};// AWB control
	    	9'd151: reg_data <= {8'h78 , 24'h519701};// local limit 
	    	9'd152: reg_data <= {8'h78 , 24'h519804};
	    	9'd153: reg_data <= {8'h78 , 24'h519912};
	    	9'd154: reg_data <= {8'h78 , 24'h519a04};
	    	9'd155: reg_data <= {8'h78 , 24'h519b00};
	    	9'd156: reg_data <= {8'h78 , 24'h519c06};
	    	9'd157: reg_data <= {8'h78 , 24'h519d82};
	    	9'd158: reg_data <= {8'h78 , 24'h519e38};// AWB control // Gamma    浼界帥鏇茬嚎
	    	9'd159: reg_data <= {8'h78 , 24'h548001};// Gamma bias plus on, bit[0] 
	    	9'd160: reg_data <= {8'h78 , 24'h548108};
	    	9'd161: reg_data <= {8'h78 , 24'h548214};
	    	9'd162: reg_data <= {8'h78 , 24'h548328};
	    	9'd163: reg_data <= {8'h78 , 24'h548451};
	    	9'd164: reg_data <= {8'h78 , 24'h548565};
	    	9'd165: reg_data <= {8'h78 , 24'h548671};
	    	9'd166: reg_data <= {8'h78 , 24'h54877d};
	    	9'd167: reg_data <= {8'h78 , 24'h548887};
	    	9'd168: reg_data <= {8'h78 , 24'h548991};
	    	9'd169: reg_data <= {8'h78 , 24'h548a9a};
	    	9'd170: reg_data <= {8'h78 , 24'h548baa};
	    	9'd171: reg_data <= {8'h78 , 24'h548cb8};
	    	9'd172: reg_data <= {8'h78 , 24'h548dcd};
	    	9'd173: reg_data <= {8'h78 , 24'h548edd};
	    	9'd174: reg_data <= {8'h78 , 24'h548fea};
	    	9'd175: reg_data <= {8'h78 , 24'h54901d};// color matrix   鑹插僵鐭╅樀
	    	9'd176: reg_data <= {8'h78 , 24'h53811e};// CMX1 for Y
	    	9'd177: reg_data <= {8'h78 , 24'h53825b};// CMX2 for Y
	    	9'd178: reg_data <= {8'h78 , 24'h538308};// CMX3 for Y
	    	9'd179: reg_data <= {8'h78 , 24'h53840a};// CMX4 for U
	    	9'd180: reg_data <= {8'h78 , 24'h53857e};// CMX5 for U
	    	9'd181: reg_data <= {8'h78 , 24'h538688};// CMX6 for U
	    	9'd182: reg_data <= {8'h78 , 24'h53877c};// CMX7 for V
	    	9'd183: reg_data <= {8'h78 , 24'h53886c};// CMX8 for V
	    	9'd184: reg_data <= {8'h78 , 24'h538910};// CMX9 for V
	    	9'd185: reg_data <= {8'h78 , 24'h538a01};// sign[9]
	    	9'd186: reg_data <= {8'h78 , 24'h538b98}; // sign[8:1] // UV adjust   UV鑹插僵楗卞拰搴﹁皟鏁
	    	9'd187: reg_data <= {8'h78 , 24'h558006};// saturation on, bit[1]
	    	9'd188: reg_data <= {8'h78 , 24'h558340};
	    	9'd189: reg_data <= {8'h78 , 24'h558410};
	    	9'd190: reg_data <= {8'h78 , 24'h558910};
	    	9'd191: reg_data <= {8'h78 , 24'h558a00};
	    	9'd192: reg_data <= {8'h78 , 24'h558bf8};
	    	9'd193: reg_data <= {8'h78 , 24'h501d40};// enable manual offset of contrast// CIP  閿愬寲鍜岄檷?1?7?1?7?
	    	9'd194: reg_data <= {8'h78 , 24'h530008};// CIP sharpen MT threshold 1
	    	9'd195: reg_data <= {8'h78 , 24'h530130};// CIP sharpen MT threshold 2
	    	9'd196: reg_data <= {8'h78 , 24'h530210};// CIP sharpen MT offset 1
	    	9'd197: reg_data <= {8'h78 , 24'h530300};// CIP sharpen MT offset 2
	    	9'd198: reg_data <= {8'h78 , 24'h530408};// CIP DNS threshold 1
	    	9'd199: reg_data <= {8'h78 , 24'h530530};// CIP DNS threshold 2
	    	9'd200: reg_data <= {8'h78 , 24'h530608};// CIP DNS offset 1
	    	9'd201: reg_data <= {8'h78 , 24'h530716};// CIP DNS offset 2 
	    	9'd202: reg_data <= {8'h78 , 24'h530908};// CIP sharpen TH threshold 1
	    	9'd203: reg_data <= {8'h78 , 24'h530a30};// CIP sharpen TH threshold 2
	    	9'd204: reg_data <= {8'h78 , 24'h530b04};// CIP sharpen TH offset 1
	    	9'd205: reg_data <= {8'h78 , 24'h530c06};// CIP sharpen TH offset 2
	    	9'd206: reg_data <= {8'h78 , 24'h502500};
	    	9'd207: reg_data <= {8'h78 , 24'h300802}; // wake up from standby, bit[6]
	    	9'd208: reg_data <= {8'h78 , 24'h303511};// PLL
	    	9'd209: reg_data <= {8'h78 , 24'h303646};// PLL
	    	9'd210: reg_data <= {8'h78 , 24'h3c0708};// light meter 1 threshold [7:0]
	    	9'd211: reg_data <= {8'h78 , 24'h382047};// Sensor flip off, ISP flip on
	    	9'd212: reg_data <= {8'h78 , 24'h382121};// Sensor mirror on, ISP mirror on, H binning on, enable Compression
	    	9'd213: reg_data <= {8'h78 , 24'h381431};// X INC 
	    	9'd214: reg_data <= {8'h78 , 24'h381531};// Y INC
	    	9'd215: reg_data <= {8'h78 , 24'h380000};// HS: X address start high byte
	    	9'd216: reg_data <= {8'h78 , 24'h380100};// HS: X address start low byte
	    	9'd217: reg_data <= {8'h78 , 24'h380200};// VS: Y address start high byte
	    	9'd218: reg_data <= {8'h78 , 24'h380304};// VS: Y address start high byte 
	    	9'd219: reg_data <= {8'h78 , 24'h38040a};// HW (HE)         
	    	9'd220: reg_data <= {8'h78 , 24'h38053f};// HW (HE)
	    	9'd221: reg_data <= {8'h78 , 24'h380607};// VH (VE)         
	    	9'd222: reg_data <= {8'h78 , 24'h38079b};// VH (VE)      
	    	9'd223: reg_data <= {8'h78 , 24'h380803};// DVPHO          //800
	    	9'd224: reg_data <= {8'h78 , 24'h380920};// DVPHO
	    	9'd225: reg_data <= {8'h78 , 24'h380a02};// DVPVO          //600
	    	9'd226: reg_data <= {8'h78 , 24'h380b58};// DVPVO
	    	9'd227: reg_data <= {8'h78 , 24'h380c07};// HTS            //Total horizontal size 
	    	9'd228: reg_data <= {8'h78 , 24'h380d68};// HTS
	    	9'd229: reg_data <= {8'h78 , 24'h380e03};// VTS            //total vertical size 
	    	9'd230: reg_data <= {8'h78 , 24'h380fd8};// VTS 
	    	9'd231: reg_data <= {8'h78 , 24'h381306};// Timing Voffset 
	    	9'd232: reg_data <= {8'h78 , 24'h361800};
	    	9'd233: reg_data <= {8'h78 , 24'h361229};
	    	9'd234: reg_data <= {8'h78 , 24'h370952};
	    	9'd235: reg_data <= {8'h78 , 24'h370c03}; 
	    	9'd236: reg_data <= {8'h78 , 24'h3a0217};// 60Hz max exposure, night mode 5fps
	    	9'd237: reg_data <= {8'h78 , 24'h3a0310};// 60Hz max exposure // banding filters are calculated automatically in camera driver
	    	9'd238: reg_data <= {8'h78 , 24'h3a1417};// 50Hz max exposure, night mode 5fps
	    	9'd239: reg_data <= {8'h78 , 24'h3a1510};// 50Hz max exposure     
	    	9'd240: reg_data <= {8'h78 , 24'h400402};// BLC 2 lines 
	    	9'd241: reg_data <= {8'h78 , 24'h300200};// enable JFIFO, SFIFO, JPEG
	    	9'd242: reg_data <= {8'h78 , 24'h3006ff};// enable clock of JPEG2x, JPEG
	    	9'd243: reg_data <= {8'h78 , 24'h471302};// JPEG mode 2
	    	9'd244: reg_data <= {8'h78 , 24'h440704};// Quantization scale 
	    	9'd245: reg_data <= {8'h78 , 24'h460b35};
	    	9'd246: reg_data <= {8'h78 , 24'h460c22};
	    	9'd247: reg_data <= {8'h78 , 24'h483722}; // DVP CLK divider
	    	9'd248: reg_data <= {8'h78 , 24'h382402}; // DVP CLK divider 
	    	9'd249: reg_data <= {8'h78 , 24'h5001a3}; // SDE on, scale on, UV average off, color matrix on, AWB on
	    	9'd250: reg_data <= {8'h78 , 24'h350300}; // AEC/AGC on 
	     	default:reg_data<=24'hffffff;//        
        endcase 
    end    
	else if(RESOLUTION == 'd2) begin
        case(reg_index)
		// YUV VGA 30fps, night mode 5fps
		// Input Clock = 24Mhz, PCLK = 56MHz
	    	9'd  0: reg_data <= {8'h78 , 24'h310311};// system clock from pad, bit[1]
	    	9'd  1: reg_data <= {8'h78 , 24'h300882};// software reset, bit[7]// delay 5ms 
	    	9'd  2: reg_data <= {8'h78 , 24'h300842};// software power down, bit[6]
	    	9'd  3: reg_data <= {8'h78 , 24'h310303};// system clock from PLL, bit[1]
	    	9'd  4: reg_data <= {8'h78 , 24'h3017ff};// FREX, Vsync, HREF, PCLK, D[9:6] output enable
	    	9'd  5: reg_data <= {8'h78 , 24'h3018ff};// D[5:0], GPIO[1:0] output enable
	    	9'd  6: reg_data <= {8'h78 , 24'h30341A};// MIPI 10-bit
	    	9'd  7: reg_data <= {8'h78 , 24'h303713};// PLL root divider, bit[4], PLL pre-divider, bit[3:0]
	    	9'd  8: reg_data <= {8'h78 , 24'h310801};// PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2] // SCLK root divider, bit[1:0] 
	    	9'd  9: reg_data <= {8'h78 , 24'h363036};
	    	9'd 10: reg_data <= {8'h78 , 24'h36310e};
	    	9'd 11: reg_data <= {8'h78 , 24'h3632e2};
	    	9'd 12: reg_data <= {8'h78 , 24'h363312};
	    	9'd 13: reg_data <= {8'h78 , 24'h3621e0};
	    	9'd 14: reg_data <= {8'h78 , 24'h3704a0};
	    	9'd 15: reg_data <= {8'h78 , 24'h37035a};
	    	9'd 16: reg_data <= {8'h78 , 24'h371578};
	    	9'd 17: reg_data <= {8'h78 , 24'h371701};
	    	9'd 18: reg_data <= {8'h78 , 24'h370b60};
	    	9'd 19: reg_data <= {8'h78 , 24'h37051a};
	    	9'd 20: reg_data <= {8'h78 , 24'h390502};
	    	9'd 21: reg_data <= {8'h78 , 24'h390610};
	    	9'd 22: reg_data <= {8'h78 , 24'h39010a};
	    	9'd 23: reg_data <= {8'h78 , 24'h373112};
	    	9'd 24: reg_data <= {8'h78 , 24'h360008};// VCM control
	    	9'd 25: reg_data <= {8'h78 , 24'h360133};// VCM control
	    	9'd 26: reg_data <= {8'h78 , 24'h302d60};// system control
	    	9'd 27: reg_data <= {8'h78 , 24'h362052};
	    	9'd 28: reg_data <= {8'h78 , 24'h371b20};
	    	9'd 29: reg_data <= {8'h78 , 24'h471c50};
	    	9'd 30: reg_data <= {8'h78 , 24'h3a1343};// pre-gain = 1.047x
	    	9'd 31: reg_data <= {8'h78 , 24'h3a1800};// gain ceiling
	    	9'd 32: reg_data <= {8'h78 , 24'h3a19f8};// gain ceiling = 15.5x
	    	9'd 33: reg_data <= {8'h78 , 24'h363513};
	    	9'd 34: reg_data <= {8'h78 , 24'h363603};
	    	9'd 35: reg_data <= {8'h78 , 24'h363440};
	    	9'd 36: reg_data <= {8'h78 , 24'h362201}; // 50/60Hz detection     50/60Hz 鐏?鍏夋潯绾硅繃鎰1?7?1?7?
	    	9'd 37: reg_data <= {8'h78 , 24'h3c0134};// Band auto, bit[7]
	    	9'd 38: reg_data <= {8'h78 , 24'h3c0428};// threshold low sum	 
	    	9'd 39: reg_data <= {8'h78 , 24'h3c0598};// threshold high sum
	    	9'd 40: reg_data <= {8'h78 , 24'h3c0600};// light meter 1 threshold[15:8]
	    	9'd 41: reg_data <= {8'h78 , 24'h3c0708};// light meter 1 threshold[7:0]
	    	9'd 42: reg_data <= {8'h78 , 24'h3c0800};// light meter 2 threshold[15:8]
	    	9'd 43: reg_data <= {8'h78 , 24'h3c091c};// light meter 2 threshold[7:0]
	    	9'd 44: reg_data <= {8'h78 , 24'h3c0a9c};// sample number[15:8]
	    	9'd 45: reg_data <= {8'h78 , 24'h3c0b40};// sample number[7:0]
	    	9'd 46: reg_data <= {8'h78 , 24'h381000};// Timing Hoffset[11:8]
	    	9'd 47: reg_data <= {8'h78 , 24'h381110};// Timing Hoffset[7:0]
	    	9'd 48: reg_data <= {8'h78 , 24'h381200};// Timing Voffset[10:8] 
	    	9'd 49: reg_data <= {8'h78 , 24'h370864};
	    	9'd 50: reg_data <= {8'h78 , 24'h400102};// BLC start from line 2
	    	9'd 51: reg_data <= {8'h78 , 24'h40051a};// BLC always update
	    	9'd 52: reg_data <= {8'h78 , 24'h300000};// enable blocks
	    	9'd 53: reg_data <= {8'h78 , 24'h3004ff};// enable clocks 
	    	9'd 54: reg_data <= {8'h78 , 24'h300e58};// MIPI power down, DVP enable
	    	9'd 55: reg_data <= {8'h78 , 24'h302e00};
	    	9'd 56: reg_data <= {8'h78 , 24'h430030};// YUV 422,YUYV
	    	9'd 57: reg_data <= {8'h78 , 24'h501f00};// YUV422
	    	9'd 58: reg_data <= {8'h78 , 24'h440e00};
	    	9'd 59: reg_data <= {8'h78 , 24'h5000a7}; // Lenc on, raw gamma on, BPC on, WPC on, CIP on // AEC target    鑷?鍔ㄦ洕鍏夋帶鍒?
	    	9'd 60: reg_data <= {8'h78 , 24'h3a0f30};// stable range in high
	    	9'd 61: reg_data <= {8'h78 , 24'h3a1028};// stable range in low
	    	9'd 62: reg_data <= {8'h78 , 24'h3a1b30};// stable range out high
	    	9'd 63: reg_data <= {8'h78 , 24'h3a1e26};// stable range out low
	    	9'd 64: reg_data <= {8'h78 , 24'h3a1160};// fast zone high
	    	9'd 65: reg_data <= {8'h78 , 24'h3a1f14};// fast zone low// Lens correction for ?   ?1?7?1?7?滃ご琛ュ?1?7?1?7?
	    	9'd 66: reg_data <= {8'h78 , 24'h580023};
	    	9'd 67: reg_data <= {8'h78 , 24'h580114};
	    	9'd 68: reg_data <= {8'h78 , 24'h58020f};
	    	9'd 69: reg_data <= {8'h78 , 24'h58030f};
	    	9'd 70: reg_data <= {8'h78 , 24'h580412};
	    	9'd 71: reg_data <= {8'h78 , 24'h580526};
	    	9'd 72: reg_data <= {8'h78 , 24'h58060c};
	    	9'd 73: reg_data <= {8'h78 , 24'h580708};
	    	9'd 74: reg_data <= {8'h78 , 24'h580805};
	    	9'd 75: reg_data <= {8'h78 , 24'h580905};
	    	9'd 76: reg_data <= {8'h78 , 24'h580a08};
	    	9'd 77: reg_data <= {8'h78 , 24'h580b0d};
	    	9'd 78: reg_data <= {8'h78 , 24'h580c08};
	    	9'd 79: reg_data <= {8'h78 , 24'h580d03};
	    	9'd 80: reg_data <= {8'h78 , 24'h580e00};
	    	9'd 81: reg_data <= {8'h78 , 24'h580f00};
	    	9'd 82: reg_data <= {8'h78 , 24'h581003};
	    	9'd 83: reg_data <= {8'h78 , 24'h581109};
	    	9'd 84: reg_data <= {8'h78 , 24'h581207};
	    	9'd 85: reg_data <= {8'h78 , 24'h581303};
	    	9'd 86: reg_data <= {8'h78 , 24'h581400};
	    	9'd 87: reg_data <= {8'h78 , 24'h581501};
	    	9'd 88: reg_data <= {8'h78 , 24'h581603};
	    	9'd 89: reg_data <= {8'h78 , 24'h581708};
	    	9'd 90: reg_data <= {8'h78 , 24'h58180d};
	    	9'd 91: reg_data <= {8'h78 , 24'h581908};
	    	9'd 92: reg_data <= {8'h78 , 24'h581a05};
	    	9'd 93: reg_data <= {8'h78 , 24'h581b06};
	    	9'd 94: reg_data <= {8'h78 , 24'h581c08};
	    	9'd 95: reg_data <= {8'h78 , 24'h581d0e};
	    	9'd 96: reg_data <= {8'h78 , 24'h581e29};
	    	9'd 97: reg_data <= {8'h78 , 24'h581f17};
	    	9'd 98: reg_data <= {8'h78 , 24'h582011};
	    	9'd 99: reg_data <= {8'h78 , 24'h582111};
	    	9'd100: reg_data <= {8'h78 , 24'h582215};
	    	9'd101: reg_data <= {8'h78 , 24'h582328};
	    	9'd102: reg_data <= {8'h78 , 24'h582446};
	    	9'd103: reg_data <= {8'h78 , 24'h582526};
	    	9'd104: reg_data <= {8'h78 , 24'h582608};
	    	9'd105: reg_data <= {8'h78 , 24'h582726};
	    	9'd106: reg_data <= {8'h78 , 24'h582864};
	    	9'd107: reg_data <= {8'h78 , 24'h582926};
	    	9'd108: reg_data <= {8'h78 , 24'h582a24};
	    	9'd109: reg_data <= {8'h78 , 24'h582b22};
	    	9'd110: reg_data <= {8'h78 , 24'h582c24};
	    	9'd111: reg_data <= {8'h78 , 24'h582d24};
	    	9'd112: reg_data <= {8'h78 , 24'h582e06};
	    	9'd113: reg_data <= {8'h78 , 24'h582f22};
	    	9'd114: reg_data <= {8'h78 , 24'h583040};
	    	9'd115: reg_data <= {8'h78 , 24'h583142};
	    	9'd116: reg_data <= {8'h78 , 24'h583224};
	    	9'd117: reg_data <= {8'h78 , 24'h583326};
	    	9'd118: reg_data <= {8'h78 , 24'h583424};
	    	9'd119: reg_data <= {8'h78 , 24'h583522};
	    	9'd120: reg_data <= {8'h78 , 24'h583622};
	    	9'd121: reg_data <= {8'h78 , 24'h583726};
	    	9'd122: reg_data <= {8'h78 , 24'h583844};
	    	9'd123: reg_data <= {8'h78 , 24'h583924};
	    	9'd124: reg_data <= {8'h78 , 24'h583a26};
	    	9'd125: reg_data <= {8'h78 , 24'h583b28};
	    	9'd126: reg_data <= {8'h78 , 24'h583c42};
	    	9'd127: reg_data <= {8'h78 , 24'h583dce};// lenc BR offset // AWB   鑷?鍔ㄧ櫧骞硠1?7?1?7?
	    	9'd128: reg_data <= {8'h78 , 24'h5180ff};// AWB B block
	    	9'd129: reg_data <= {8'h78 , 24'h5181f2};// AWB control 
	    	9'd130: reg_data <= {8'h78 , 24'h518200};// [7:4] max local counter, [3:0] max fast counter
	    	9'd131: reg_data <= {8'h78 , 24'h518314};// AWB advanced 
	    	9'd132: reg_data <= {8'h78 , 24'h518425};
	    	9'd133: reg_data <= {8'h78 , 24'h518524};
	    	9'd134: reg_data <= {8'h78 , 24'h518609};
	    	9'd135: reg_data <= {8'h78 , 24'h518709};
	    	9'd136: reg_data <= {8'h78 , 24'h518809};
	    	9'd137: reg_data <= {8'h78 , 24'h518975};
	    	9'd138: reg_data <= {8'h78 , 24'h518a54};
	    	9'd139: reg_data <= {8'h78 , 24'h518be0};
	    	9'd140: reg_data <= {8'h78 , 24'h518cb2};
	    	9'd141: reg_data <= {8'h78 , 24'h518d42};
	    	9'd142: reg_data <= {8'h78 , 24'h518e3d};
	    	9'd143: reg_data <= {8'h78 , 24'h518f56};
	    	9'd144: reg_data <= {8'h78 , 24'h519046};
	    	9'd145: reg_data <= {8'h78 , 24'h5191f8};// AWB top limit
	    	9'd146: reg_data <= {8'h78 , 24'h519204};// AWB bottom limit
	    	9'd147: reg_data <= {8'h78 , 24'h519370};// red limit
	    	9'd148: reg_data <= {8'h78 , 24'h5194f0};// green limit
	    	9'd149: reg_data <= {8'h78 , 24'h5195f0};// blue limit
	    	9'd150: reg_data <= {8'h78 , 24'h519603};// AWB control
	    	9'd151: reg_data <= {8'h78 , 24'h519701};// local limit 
	    	9'd152: reg_data <= {8'h78 , 24'h519804};
	    	9'd153: reg_data <= {8'h78 , 24'h519912};
	    	9'd154: reg_data <= {8'h78 , 24'h519a04};
	    	9'd155: reg_data <= {8'h78 , 24'h519b00};
	    	9'd156: reg_data <= {8'h78 , 24'h519c06};
	    	9'd157: reg_data <= {8'h78 , 24'h519d82};
	    	9'd158: reg_data <= {8'h78 , 24'h519e38};// AWB control // Gamma    浼界帥鏇茬嚎
	    	9'd159: reg_data <= {8'h78 , 24'h548001};// Gamma bias plus on, bit[0] 
	    	9'd160: reg_data <= {8'h78 , 24'h548108};
	    	9'd161: reg_data <= {8'h78 , 24'h548214};
	    	9'd162: reg_data <= {8'h78 , 24'h548328};
	    	9'd163: reg_data <= {8'h78 , 24'h548451};
	    	9'd164: reg_data <= {8'h78 , 24'h548565};
	    	9'd165: reg_data <= {8'h78 , 24'h548671};
	    	9'd166: reg_data <= {8'h78 , 24'h54877d};
	    	9'd167: reg_data <= {8'h78 , 24'h548887};
	    	9'd168: reg_data <= {8'h78 , 24'h548991};
	    	9'd169: reg_data <= {8'h78 , 24'h548a9a};
	    	9'd170: reg_data <= {8'h78 , 24'h548baa};
	    	9'd171: reg_data <= {8'h78 , 24'h548cb8};
	    	9'd172: reg_data <= {8'h78 , 24'h548dcd};
	    	9'd173: reg_data <= {8'h78 , 24'h548edd};
	    	9'd174: reg_data <= {8'h78 , 24'h548fea};
	    	9'd175: reg_data <= {8'h78 , 24'h54901d};// color matrix   鑹插僵鐭╅樀
	    	9'd176: reg_data <= {8'h78 , 24'h53811e};// CMX1 for Y
	    	9'd177: reg_data <= {8'h78 , 24'h53825b};// CMX2 for Y
	    	9'd178: reg_data <= {8'h78 , 24'h538308};// CMX3 for Y
	    	9'd179: reg_data <= {8'h78 , 24'h53840a};// CMX4 for U
	    	9'd180: reg_data <= {8'h78 , 24'h53857e};// CMX5 for U
	    	9'd181: reg_data <= {8'h78 , 24'h538688};// CMX6 for U
	    	9'd182: reg_data <= {8'h78 , 24'h53877c};// CMX7 for V
	    	9'd183: reg_data <= {8'h78 , 24'h53886c};// CMX8 for V
	    	9'd184: reg_data <= {8'h78 , 24'h538910};// CMX9 for V
	    	9'd185: reg_data <= {8'h78 , 24'h538a01};// sign[9]
	    	9'd186: reg_data <= {8'h78 , 24'h538b98}; // sign[8:1] // UV adjust   UV鑹插僵楗卞拰搴﹁皟鏁
	    	9'd187: reg_data <= {8'h78 , 24'h558006};// saturation on, bit[1]
	    	9'd188: reg_data <= {8'h78 , 24'h558340};
	    	9'd189: reg_data <= {8'h78 , 24'h558410};
	    	9'd190: reg_data <= {8'h78 , 24'h558910};
	    	9'd191: reg_data <= {8'h78 , 24'h558a00};
	    	9'd192: reg_data <= {8'h78 , 24'h558bf8};
	    	9'd193: reg_data <= {8'h78 , 24'h501d40};// enable manual offset of contrast// CIP  閿愬寲鍜岄檷?1?7?1?7?
	    	9'd194: reg_data <= {8'h78 , 24'h530008};// CIP sharpen MT threshold 1
	    	9'd195: reg_data <= {8'h78 , 24'h530130};// CIP sharpen MT threshold 2
	    	9'd196: reg_data <= {8'h78 , 24'h530210};// CIP sharpen MT offset 1
	    	9'd197: reg_data <= {8'h78 , 24'h530300};// CIP sharpen MT offset 2
	    	9'd198: reg_data <= {8'h78 , 24'h530408};// CIP DNS threshold 1
	    	9'd199: reg_data <= {8'h78 , 24'h530530};// CIP DNS threshold 2
	    	9'd200: reg_data <= {8'h78 , 24'h530608};// CIP DNS offset 1
	    	9'd201: reg_data <= {8'h78 , 24'h530716};// CIP DNS offset 2 
	    	9'd202: reg_data <= {8'h78 , 24'h530908};// CIP sharpen TH threshold 1
	    	9'd203: reg_data <= {8'h78 , 24'h530a30};// CIP sharpen TH threshold 2
	    	9'd204: reg_data <= {8'h78 , 24'h530b04};// CIP sharpen TH offset 1
	    	9'd205: reg_data <= {8'h78 , 24'h530c06};// CIP sharpen TH offset 2
	    	9'd206: reg_data <= {8'h78 , 24'h502500};
	    	9'd207: reg_data <= {8'h78 , 24'h300802}; // wake up from standby, bit[6]
	    	9'd208: reg_data <= {8'h78 , 24'h303511};// PLL
	    	9'd209: reg_data <= {8'h78 , 24'h303646};// PLL
	    	9'd210: reg_data <= {8'h78 , 24'h3c0708};// light meter 1 threshold [7:0]
	    	9'd211: reg_data <= {8'h78 , 24'h382047};// Sensor flip off, ISP flip on
	    	9'd212: reg_data <= {8'h78 , 24'h382121};// Sensor mirror on, ISP mirror on, H binning on, enable Compression
	    	9'd213: reg_data <= {8'h78 , 24'h381431};// X INC 
	    	9'd214: reg_data <= {8'h78 , 24'h381531};// Y INC
	    	9'd215: reg_data <= {8'h78 , 24'h380000};// HS: X address start high byte
	    	9'd216: reg_data <= {8'h78 , 24'h380100};// HS: X address start low byte
	    	9'd217: reg_data <= {8'h78 , 24'h380200};// VS: Y address start high byte
	    	9'd218: reg_data <= {8'h78 , 24'h380304};// VS: Y address start high byte 
	    	9'd219: reg_data <= {8'h78 , 24'h38040a};// HW (HE)         
	    	9'd220: reg_data <= {8'h78 , 24'h38053f};// HW (HE)
	    	9'd221: reg_data <= {8'h78 , 24'h380607};// VH (VE)         
	    	9'd222: reg_data <= {8'h78 , 24'h38079b};// VH (VE)      
	    	9'd223: reg_data <= {8'h78 , 24'h380803};// DVPHO          //800
	    	9'd224: reg_data <= {8'h78 , 24'h380920};// DVPHO
	    	9'd225: reg_data <= {8'h78 , 24'h380a02};// DVPVO          //600
	    	9'd226: reg_data <= {8'h78 , 24'h380b58};// DVPVO
	    	9'd227: reg_data <= {8'h78 , 24'h380c07};// HTS            //Total horizontal size 
	    	9'd228: reg_data <= {8'h78 , 24'h380d68};// HTS
	    	9'd229: reg_data <= {8'h78 , 24'h380e03};// VTS            //total vertical size 
	    	9'd230: reg_data <= {8'h78 , 24'h380fd8};// VTS 
	    	9'd231: reg_data <= {8'h78 , 24'h381306};// Timing Voffset 
	    	9'd232: reg_data <= {8'h78 , 24'h361800};
	    	9'd233: reg_data <= {8'h78 , 24'h361229};
	    	9'd234: reg_data <= {8'h78 , 24'h370952};
	    	9'd235: reg_data <= {8'h78 , 24'h370c03}; 
	    	9'd236: reg_data <= {8'h78 , 24'h3a0217};// 60Hz max exposure, night mode 5fps
	    	9'd237: reg_data <= {8'h78 , 24'h3a0310};// 60Hz max exposure // banding filters are calculated automatically in camera driver
	    	9'd238: reg_data <= {8'h78 , 24'h3a1417};// 50Hz max exposure, night mode 5fps
	    	9'd239: reg_data <= {8'h78 , 24'h3a1510};// 50Hz max exposure     
	    	9'd240: reg_data <= {8'h78 , 24'h400402};// BLC 2 lines 
	    	9'd241: reg_data <= {8'h78 , 24'h300200};// enable JFIFO, SFIFO, JPEG
	    	9'd242: reg_data <= {8'h78 , 24'h3006ff};// enable clock of JPEG2x, JPEG
	    	9'd243: reg_data <= {8'h78 , 24'h471302};// JPEG mode 2
	    	9'd244: reg_data <= {8'h78 , 24'h440704};// Quantization scale 
	    	9'd245: reg_data <= {8'h78 , 24'h460b35};
	    	9'd246: reg_data <= {8'h78 , 24'h460c22};
	    	9'd247: reg_data <= {8'h78 , 24'h483722}; // DVP CLK divider
	    	9'd248: reg_data <= {8'h78 , 24'h382402}; // DVP CLK divider 
	    	9'd249: reg_data <= {8'h78 , 24'h5001a3}; // SDE on, scale on, UV average off, color matrix on, AWB on
	    	9'd250: reg_data <= {8'h78 , 24'h350300}; // AEC/AGC on 
            (9'd251+9'd  0) : reg_data <= {8'h78,24'h303511}; // PLL
            (9'd251+9'd  1) : reg_data <= {8'h78,24'h303646}; // PLL
            // (9'd251+9'd  2) : reg_data <= {8'h78,24'h3c0708}; // light meter 1 threshold [7:0]
            // (9'd251+9'd  3) : reg_data <= {8'h78,24'h382041}; // Sensor flip off, ISP flip on
            // (9'd251+9'd  4) : reg_data <= {8'h78,24'h382107}; // Sensor mirror on, ISP mirror on, H binning on
            // (9'd251+9'd  5) : reg_data <= {8'h78,24'h381431}; // X INC
            // (9'd251+9'd  6) : reg_data <= {8'h78,24'h381531}; // Y INC
            (9'd251+9'd  7) : reg_data <= {8'h78,24'h380000}; // HS
            (9'd251+9'd  8) : reg_data <= {8'h78,24'h380100}; // HS
            (9'd251+9'd  9) : reg_data <= {8'h78,24'h380200}; // VS
            (9'd251+9'd 10) : reg_data <= {8'h78,24'h380304}; // VS
            (9'd251+9'd 11) : reg_data <= {8'h78,24'h38040a}; // HW (HE)
            (9'd251+9'd 12) : reg_data <= {8'h78,24'h38053f}; // HW (HE)
            (9'd251+9'd 13) : reg_data <= {8'h78,24'h380607}; // VH (VE)
            (9'd251+9'd 14) : reg_data <= {8'h78,24'h38079b}; // VH (VE)
            (9'd251+9'd 15) : reg_data <= {8'h78,24'h380802}; // DVPHO
            (9'd251+9'd 16) : reg_data <= {8'h78,24'h380980}; // DVPHO
            (9'd251+9'd 17) : reg_data <= {8'h78,24'h380a01}; // DVPVO
            (9'd251+9'd 18) : reg_data <= {8'h78,24'h380be0}; // DVPVO
            (9'd251+9'd 19) : reg_data <= {8'h78,24'h380c07}; // HTS
            (9'd251+9'd 20) : reg_data <= {8'h78,24'h380d68}; // HTS
            (9'd251+9'd 21) : reg_data <= {8'h78,24'h380e03}; // VTS
            (9'd251+9'd 22) : reg_data <= {8'h78,24'h380fd8}; // VTS
            (9'd251+9'd 23) : reg_data <= {8'h78,24'h381306}; // Timing Voffset
            // (9'd251+9'd 24) : reg_data <= {8'h78,24'h361800};
            // (9'd251+9'd 25) : reg_data <= {8'h78,24'h361229};
            // (9'd251+9'd 26) : reg_data <= {8'h78,24'h370952};
            // (9'd251+9'd 27) : reg_data <= {8'h78,24'h370c03};
            // (9'd251+9'd 28) : reg_data <= {8'h78,24'h3a0217}; // 60Hz max exposure, night mode 5fps
            // (9'd251+9'd 29) : reg_data <= {8'h78,24'h3a0310}; // 60Hz max exposure
            // (9'd251+9'd 30) : reg_data <= {8'h78,24'h3a1417}; // 50Hz max exposure, night mode 5fps
            // (9'd251+9'd 31) : reg_data <= {8'h78,24'h3a1510}; // 50Hz max exposure
            // (9'd251+9'd 32) : reg_data <= {8'h78,24'h400402}; // BLC 2 lines
            // (9'd251+9'd 33) : reg_data <= {8'h78,24'h30021c}; // reset JFIFO, SFIFO, JPEG
            // (9'd251+9'd 34) : reg_data <= {8'h78,24'h3006c3}; // disable clock of JPEG2x, JPEG
            // (9'd251+9'd 35) : reg_data <= {8'h78,24'h471302}; // JPEG mode 3
            // (9'd251+9'd 36) : reg_data <= {8'h78,24'h440704}; // Quantization scale
            // (9'd251+9'd 37) : reg_data <= {8'h78,24'h460b35};
            // (9'd251+9'd 38) : reg_data <= {8'h78,24'h460c22};
            (9'd251+9'd 39) : reg_data <= {8'h78,24'h483722}; // DVP CLK divider
            (9'd251+9'd 40) : reg_data <= {8'h78,24'h382402}; // DVP CLK divider
            // (9'd251+9'd 41) : reg_data <= {8'h78,24'h5001a3}; // SDE on, scale on, UV average off, color matrix on, AWB on
            // (9'd251+9'd 42) : reg_data <= {8'h78,24'h350300}; // AEC/AGC on
	     	default:reg_data<=24'hffffff;//        
        endcase 
    end  
end	 

endmodule