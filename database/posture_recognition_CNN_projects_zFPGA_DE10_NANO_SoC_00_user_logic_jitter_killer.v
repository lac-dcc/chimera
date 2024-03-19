module jitter_killer(
	input	wire	sys_clk, sys_rst_n,
	input	wire	jitter_line,
	output	reg		jitter_safe
	);
`define		JITTER_DELAY 	100000
/////////////////////////////////
reg		[31:0]		jitter_cnt;
// 
reg		[3:0]	cstate;
always @(posedge sys_clk)
	if(!sys_rst_n)
	begin
		cstate <= 0;
		jitter_cnt <= 0;
		jitter_safe <= jitter_line;
	end
	else 
	begin
		case(cstate)
			0: begin
				// 突然升高
				if(jitter_safe==0 && jitter_line==1)
				begin
					cstate <= 1;
					jitter_cnt <= 0;
				end
				// 突然降低
				else if(jitter_safe==1 && jitter_line==0)
				begin
					cstate <= 2;
					jitter_cnt <= 0;
				end
			end
			// 延时判断上升
			1: begin
				if(jitter_cnt>`JITTER_DELAY)
				begin
					cstate <= 0;
					jitter_cnt <= 0;
					jitter_safe <= jitter_line;
				end
				else
					jitter_cnt <= jitter_cnt + 1;				
			end
			// 延时判断下降
			2: begin
				if(jitter_cnt>`JITTER_DELAY)
				begin
					cstate <= 0;
					jitter_cnt <= 0;
					jitter_safe <= jitter_line;
				end
				else
					jitter_cnt <= jitter_cnt + 1;				
			end
			// 
			default: begin
				cstate <= 0;
				jitter_cnt <= 0;
				jitter_safe <= jitter_line;
			end
		endcase
	end
///////////////////////////////////
endmodule
