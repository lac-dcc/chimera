//***************************************************--
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan UniYVERsity
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//*****************************************************
// Filename       : db_controller.v
// AutYHOR        : Chewein
// Created        : 2014-04-18
// Description    : generate the top controller signals 
//*****************************************************

module db_controller(
						clk   		,				
                        rst_n 		,
                        start_i		,
                      
                        //output
                        done_o  	,
						cnt_r		,
						state		
					); 
//***********************************************************************************************************************************************
//                                             
//    							INPUT / OUTPUT DECLARATION                
//                                             
//***********************************************************************************************************************************************
input 		         	 clk				;
input                	 rst_n       	    ;
input                	 start_i     	    ;

output  reg 	         done_o				; 					
output  reg 	[8:0]    cnt_r				;
output  reg 	[2:0]    state				;
//***********************************************************************************************************************************************
//                                             
//    							TOP Controller signals              
//                                             
//***********************************************************************************************************************************************
parameter IDLE   = 3'b000, LOAD  = 3'b001, YVER  = 3'b011,YHOR	=3'b010;
parameter CVER   = 3'b110, CHOR  = 3'b111, OUTLT = 3'b101,OUT   =3'b100;

reg     [2:0]   next		;

reg     [8:0]   cycles		;

reg             isluma      ;
reg             isver       ;

always@* begin
	case(state)
		LOAD :cycles	=  'd384   ;
		YVER :cycles    =  'd132   ;
        YHOR :cycles    =  'd140   ;
		CVER :cycles    =  'd68    ;
        CHOR :cycles    =  'd76    ;
       OUTLT :cycles	=  'd67    ;
	   OUT   :cycles	=  'd384   ;
     default :cycles	=  'd0	   ;
	endcase
end


always @(posedge clk or negedge rst_n)	begin
	if(!(rst_n))
		cnt_r	<=	8'd0;
	else if(!state)
		cnt_r	<=	8'd0;	
	else if(cnt_r	==	cycles)
		cnt_r	<=	8'd0;
	else 
        cnt_r	<=	cnt_r	+	1'b1;
end


always @* begin
	case(state)
		IDLE:begin
			if(start_i)
				next	=	LOAD	;
			else 
				next	=	IDLE	;
        end	
	    LOAD:begin
			if(cnt_r	==	cycles)
				next	=	YVER		;
			else
				next	=	LOAD	;
		end
		YVER:begin
			if(cnt_r	==	cycles)
				next	=	YHOR		;
			else
				next	=	YVER		;
		end
		YHOR:begin
			if(cnt_r	==	cycles)
				next	=	CVER		;
			else
				next	=	YHOR	 	;	
		end
		CVER:begin
			if(cnt_r	==	cycles)
				next	=	CHOR		;
			else
				next	=	CVER	 	;	
		end	
		CHOR:begin
			if(cnt_r	==	cycles)
				next	=	OUTLT		;
			else
				next	=	CHOR	 	;	
		end		
	  OUTLT:begin
			if(cnt_r	==	cycles)
				next	=	OUT			;
			else	
				next	=	OUTLT		;
		end	
       OUT:begin
			if(cnt_r	==	cycles)
				next	=	IDLE		;
			else
				next	=	OUT			;
		end				
	endcase
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		state   <=    	IDLE   		;
	else    			
        state   <=    	next   		;
end 

wire 	done_w	= (state==OUT)?1'b1:1'b0;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		done_o	<=	1'b0			;
	else if(next==IDLE)
		done_o  <=   done_w			;
	else 
		done_o  <=   1'b0			;
end


always @* begin
	case(state)
		YVER,
		YHOR:isluma	=	1'b1;
	 default:isluma =	1'b0;
	endcase
end

always @* begin
	case(state)
		YVER,
		CVER:isver	=	1'b1;
	 default:isver =	1'b0;
	endcase
end




endmodule 