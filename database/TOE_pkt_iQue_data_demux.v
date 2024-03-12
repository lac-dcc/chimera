`timescale 1ns / 1ps
module data_demux #(
		parameter    CHN_NUM      = 6   				,		
		parameter    DWID         = 256 				,       
		parameter    NUMWID       = logb(CHN_NUM) 	 	    
)(
		input   wire [DWID-1:0]         din 			,		
		input   wire [NUMWID-1:0]       sel 			, 		
		output  reg  [DWID*CHN_NUM-1:0] dout     		 		
);

function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction


integer i;
always@( * ) begin
	for( i=0; i<CHN_NUM; i=i+1 ) begin
		if( sel==i ) begin
			dout[DWID*i +: DWID] = din;
		end
		else begin
			dout[DWID*i +: DWID] = {DWID{1'b0}};
		end
	end
end

endmodule
