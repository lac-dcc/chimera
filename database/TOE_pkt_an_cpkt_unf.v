`timescale 1ns / 1ps
module cpkt_unf#(
		parameter    DWID         	= 256 		,   		
		parameter    FCMWID             = 50           	,			
		parameter    EOC_MSB 		= 2 		,  			
		parameter    EOC_LSB 		= 2 		,
		parameter    SOC_MSB 		= 3 		,  			
		parameter    SOC_LSB 		= 3 		,
		parameter    CELL_SZ      	= 8 				    		
) (
		input	wire					clk  			,
		input 	wire					rst				,
		input 	wire [1-1:0] 			cell_vld		,           
		input 	wire [DWID-1:0] 		cell_dat		,           
		input 	wire [FCMWID-1:0] 		cell_msg		,           
		output  reg  [1-1:0]            total_cpkt_vld 	,			
		output  reg  [DWID*CELL_SZ-1:0] total_cpkt_dat 	,			
		output  reg  [FCMWID-1:0]       total_cpkt_msg 				
);
wire	[1-1:0]				flag_eoc			;
wire	[1-1:0]				flag_soc			;
reg		[3-1:0]				cnt_cell_vld		;
reg  	[DWID*CELL_SZ-1:0] 	total_cpkt_dat_tmp 	;			
integer						i					;
assign			flag_soc = cell_msg[SOC_MSB:SOC_LSB];
assign			flag_eoc = cell_msg[EOC_MSB:EOC_LSB];
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		cnt_cell_vld <= 0;
	end
	else begin
		if( cnt_cell_vld==(CELL_SZ-1) )begin 
			cnt_cell_vld <= 0;
		end
		else if( cnt_cell_vld!=0 )begin
			cnt_cell_vld <= cnt_cell_vld + 1'b1;
		end
		else if( cell_vld==1'b1 )begin  
			cnt_cell_vld <= 1;
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		total_cpkt_vld <= 1'b0;
	end
	else begin
		if( cnt_cell_vld==(CELL_SZ-1'b1) )begin
			total_cpkt_vld <= 1'b1;
		end
		else begin
			total_cpkt_vld <= 1'b0;
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		total_cpkt_dat_tmp <= 0;
	end
	else begin
		for( i=0; i<CELL_SZ; i=i+1 ) begin
			if( cnt_cell_vld==i )begin
				total_cpkt_dat_tmp[DWID*(CELL_SZ-1-i)+:DWID] <= cell_dat; 
			end
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		total_cpkt_dat <= 0;
	end
	else begin
		if( cnt_cell_vld==(CELL_SZ-1) )begin
			total_cpkt_dat <= { total_cpkt_dat_tmp[ DWID +: DWID*(CELL_SZ-1) ], cell_dat }; 
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		total_cpkt_msg <= 0;
	end
	else begin
		if( cnt_cell_vld==(CELL_SZ-1) )begin
			total_cpkt_msg <= cell_msg; 
		end
	end
end
endmodule
