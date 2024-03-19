`timescale 1ns/1ps

module key_gen(
clk,
reset,
p2k_valid,
p2k_ingress,
p2k_rloc_src,
p2k_eid_dst,
p2k_metadata,

mode, //1 ceng die wang ;

k2m_metadata_valid,
k2m_metadata
);


input clk;
input reset;
input p2k_valid;
input [7:0]   p2k_ingress;
input [127:0] p2k_rloc_src;
input [127:0] p2k_eid_dst;
input [7:0]   p2k_metadata;//useless

input mode;

output  k2m_metadata_valid;
output  [107:0] k2m_metadata;


reg k2m_metadata_valid;
reg [107:0] k2m_metadata;

//reg [127:0] rloc_src;
//reg [127:0] eid_dst;
//--state--//
//reg [3:0] key_state;





//-------------------key_gen_state-------------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
          k2m_metadata_valid <= 1'b0;
			    k2m_metadata <= 108'b0;
      end
    else
      begin
        if(p2k_valid == 1'b1)
			   begin
				  if(mode == 1'b1)//ceng die wang 
					 begin
					     if(p2k_ingress == 8'b0) k2m_metadata <= {mode,p2k_ingress,p2k_rloc_src[17:0],81'b0};
					     else k2m_metadata <= {mode,p2k_ingress,18'b0,81'b0};
					     k2m_metadata_valid <= 1'b1;
					 end
				  else//shi wang
					 begin
						k2m_metadata_valid <= 1'b1;
						k2m_metadata <= {mode,p2k_ingress,p2k_eid_dst[127:56],56'b0};
					 end
			   end
		    else k2m_metadata_valid <= 1'b0;
      end
end


















endmodule

