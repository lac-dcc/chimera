//////////////////////////////////////////////////////////////////////////////////
// Company:  www.netbric.com
// Engineer: liaotianyu
// 
// Create Date: 2014/09/03
// Design Name: toe
// Module Name: rr_arb : round robin arbiter
// Project Name: 
// Target Devices: 
// Tool Versions: 
//
// Description: 
//       This code implements a arbiter using round robin algorithm
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created on 2014/09/03 by liaotianyu
// Additional Comments:
//
// Revision 0.01 - File Modifid
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module rr_arb #(
		parameter    REQ_NUM      = 4  							    ,               // request number
		parameter    ID_WID       = clogb2(REQ_NUM)				    ,               // request number
		parameter    DBG_WID	  = 32    							 				// debug signal width
) (
		input	wire							clk		 			,
		input 	wire							rst					,
		//input requests from multi-user
		input   wire [1*REQ_NUM-1:0] 		    req					,           //input req 
		//input a pulse for get the current grant
		input   wire 							get_gnt				,           //input a pulse for get gnt
		//output grant for req
		output  reg  [1*REQ_NUM-1:0] 		    gnt					,           //output gnt
		output  wire [ID_WID-1:0] 		    	gnt_id				,           //output grant_id
		//output debug
		output	wire [DBG_WID-1:0]				dbg_sig							//debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//  parameter define
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//  variables define 
//////////////////////////////////////////////////////////////////////////////////
integer 						i		  ;
reg [1*REQ_NUM-1:0] 		    last_mask ;          //
reg [1*REQ_NUM-1:0] 		    mask_gnt  ;          //
wire [1*REQ_NUM-1:0] 		    req_hp 	  ;          //
reg [1*REQ_NUM-1:0] 		    gnt_hp 	  ;          //
reg [1*REQ_NUM-1:0] 		    gnt_lp    ;          //
reg [ID_WID-1:0]						gnt_id_lp ;
reg [ID_WID-1:0]						gnt_id_hp ;

//grant for all req
always @ ( * ) begin
		gnt_id_lp = 0;
		for( i=0; i<REQ_NUM; i=i+1 ) begin
				if( req[i]==1'b1 ) begin
						gnt_id_lp = i;
				end
		end
end

//grant for high priority reqs
always @ ( * ) begin
		gnt_id_hp = 0;
		for( i=0; i<REQ_NUM; i=i+1 ) begin
				if( req_hp[i]==1'b1 ) begin
						gnt_id_hp = i;
				end
		end
end

assign gnt_id = (req_hp!=0) ? gnt_id_hp : gnt_id_lp;

//set bitmap for gnt according to gnt_id;
always @ ( * ) begin
		if( req==0 )begin
				gnt = 0;
		end
		else begin
				gnt = 0;
				for( i=0; i<REQ_NUM; i=i+1 ) begin
						if( i==gnt_id ) begin
								gnt[i]=1'b1;
						end
				end
		end
end

//gnt mask
always @ ( * ) begin
		mask_gnt = 0;
		for( i=0; i<REQ_NUM; i=i+1 ) begin
				if( i>=gnt_id ) begin
						mask_gnt[i]=1'b1;
				end
		end
end

//latch last mask
always @ ( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				last_mask <= 0;
		end
		else begin
				if( get_gnt==1'b1 ) begin
						last_mask <= mask_gnt;
				end
		end
end

//high priority request that mask the last request of granted
assign req_hp = req & ~last_mask;


assign dbg_sig = 32'h0;

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//  The following function calculates the address width based on specified RAM depth
function integer clogb2;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (clogb2=0; depth_reg>0; clogb2=clogb2+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**clogb2 >= depth*2 )begin
          clogb2 = clogb2 - 1;
        end
	end 
endfunction

endmodule


