`timescale 1ns / 1ps
module fix_cpkt_unf#(
		parameter    DWID         	= 256 			    ,   		
		parameter    CELL_SZ      	= 4 				,    		
		parameter    CELL_GAP       = 4 				    		
) (
		input	wire					clk  			,
		input 	wire					rst				,
		input 	wire [1-1:0] 			cpkt_vld		,           
		input 	wire [DWID-1:0] 		cpkt_dat		,           
		output  reg  [1-1:0]            total_cpkt_vld_pre 	,			
		output  reg  [1-1:0]            total_cpkt_vld 	,			
		output  wire [DWID*CELL_SZ-1:0] total_cpkt_dat 				
);
reg		[2:0]				cnt_cpkt_vld		;
reg  	[DWID*CELL_GAP-1:0] 	total_cpkt_dat_tmp 	;			
integer						i					;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		cnt_cpkt_vld <= 0;
	end
	else begin
		if( cnt_cpkt_vld==(CELL_GAP-1) )begin 
			cnt_cpkt_vld <= 0;
		end
		else if( cpkt_vld==1'b1 && cnt_cpkt_vld<CELL_GAP )begin
			cnt_cpkt_vld <= cnt_cpkt_vld + 1'b1;
		end
		else if( cnt_cpkt_vld!=0 && cnt_cpkt_vld<CELL_GAP )begin
			cnt_cpkt_vld <= cnt_cpkt_vld + 1'b1;
		end
	end
end
generate
begin : gen_total_cpkt_vld
    if(CELL_GAP <= 1)
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_vld <= 1'b0;
            end
            else begin
                if( cnt_cpkt_vld==(CELL_GAP-1'b1) && cpkt_vld==1'b1 )begin
                    total_cpkt_vld <= 1'b1;
                end
                else begin
                    total_cpkt_vld <= 1'b0;
                end
            end
        end
    end
    else
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_vld <= 1'b0;
            end
            else begin
                if( cnt_cpkt_vld==(CELL_GAP-1'b1) )begin
                    total_cpkt_vld <= 1'b1;
                end
                else begin
                    total_cpkt_vld <= 1'b0;
                end
            end
        end
    end
end
endgenerate
generate
begin : gen_total_cpkt_vld_pre
    if(CELL_GAP <= 1)
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_vld_pre <= 1'b0;
            end
            else begin
                if( cnt_cpkt_vld==(CELL_GAP-'h1) && cpkt_vld==1'b1 )begin
                    total_cpkt_vld_pre <= 1'b1;
                end
                else begin
                    total_cpkt_vld_pre <= 1'b0;
                end
            end
        end
    end
    else if(CELL_GAP == 2)
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_vld_pre <= 1'b0;
            end
            else begin
                if( cnt_cpkt_vld==(CELL_GAP-'h2) && cpkt_vld==1'b1 )begin
                    total_cpkt_vld_pre <= 1'b1;
                end
                else begin
                    total_cpkt_vld_pre <= 1'b0;
                end
            end
        end
    end
    else
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_vld_pre <= 1'b0;
            end
            else begin
                if( cnt_cpkt_vld==(CELL_GAP-'h2) )begin
                    total_cpkt_vld_pre <= 1'b1;
                end
                else begin
                    total_cpkt_vld_pre <= 1'b0;
                end
            end
        end
    end
end
endgenerate
generate
begin
    if(CELL_GAP <= 1)
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_dat_tmp <= 0;
            end
            else begin
                for( i=0; i<CELL_GAP; i=i+1 ) begin
                    if( cnt_cpkt_vld==i && cpkt_vld == 1 ) begin
                        total_cpkt_dat_tmp[DWID*(CELL_GAP-1-i)+:DWID] <= cpkt_dat; 
                    end
                end
            end
        end
    end
    else
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_dat_tmp <= 0;
            end
            else begin
                for( i=0; i<CELL_GAP; i=i+1 ) begin
                    if( cnt_cpkt_vld==i ) begin
                        total_cpkt_dat_tmp[DWID*(CELL_GAP-1-i)+:DWID] <= cpkt_dat; 
                    end
                end
            end
        end
    end
end
endgenerate
reg  [DWID*CELL_GAP-1:0] total_cpkt_dat_reg; 
generate
begin : gen_total_cpkt_dat_reg
    if(CELL_GAP == 1)
    begin
        always @ ( posedge clk or posedge rst )
        begin
            if( rst==1'b1 )
                total_cpkt_dat_reg <= 0;
            else if( cnt_cpkt_vld==(CELL_GAP-1) && cpkt_vld==1 )
                total_cpkt_dat_reg <= cpkt_dat; 
        end
    end
    else
    begin
        always @ ( posedge clk or posedge rst ) begin
            if( rst==1'b1 )begin
                total_cpkt_dat_reg <= 0;
            end
            else begin
                if( cnt_cpkt_vld==(CELL_GAP-1) )begin
                    total_cpkt_dat_reg <= { total_cpkt_dat_tmp[ DWID +: DWID*(CELL_GAP-1) ], cpkt_dat }; 
                end
            end
        end
    end
end
endgenerate
assign total_cpkt_dat = total_cpkt_dat_reg[ DWID*CELL_GAP-1: DWID*(CELL_GAP-CELL_SZ)];
endmodule
