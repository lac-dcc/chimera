module ddr2_ctrl_input(
sys_rst_n,

ddr2_clk,
local_init_done,
local_ready,
local_address,
local_read_req,
local_write_req,
local_wdata,
local_be,
local_size,

local_burstbegin,

um2ddr_wrclk,
um2ddr_wrreq,
um2ddr_data,
um2ddr_ready,
um2ddr_command_wrreq,
um2ddr_command,

rd_ddr2_size,
rd_ddr2_size_wrreq,
read_permit
);
input          sys_rst_n;
input          ddr2_clk;
input		      local_ready;

input		      local_init_done;
		
output[25:0]	local_address;
output		   local_write_req;
output		   local_read_req;
output		   local_burstbegin;
output[31:0]	local_wdata;
output[3:0]    local_be;
output[3:0]	   local_size;

input          um2ddr_wrclk;
input          um2ddr_wrreq;
input	[127:0]  um2ddr_data; 
output         um2ddr_ready;
input          um2ddr_command_wrreq;
input	[33:0]   um2ddr_command;

output[6:0]    rd_ddr2_size;
output         rd_ddr2_size_wrreq;
input          read_permit;

/////////////////////////////////////
reg[25:0]	local_address;
reg		   local_write_req;
reg		   local_read_req;
reg		   local_burstbegin;
reg[31:0]	local_wdata;
reg[3:0]    local_be;
reg[3:0]	   local_size;
wire        um2ddr_ready;
reg[6:0]    rd_ddr2_size;
reg         rd_ddr2_size_wrreq;
reg[95:0]   um2ddr_reg;
///////////////////////////////////
reg [6:0]  pkt_len;
reg [1:0]  shift;
reg [25:0] op_addr;
reg [2:0]  state;
///////////////////////////////////
assign um2ddr_ready = ~(um2ddr_afull | um2ddr_command_afull);			//changed by mxl from & to |;
///////////////////////////////////
parameter idle_s     = 3'h0,
          wr_start_s = 3'h1,
			 wr_mid_fs  = 3'h2,
			 wr_mid_sd  = 3'h3,
			 wr_end_s   = 3'h4,
			 rd_start_s = 3'h5,
			 rd_s       = 3'h6,
			 wait_s     = 3'h7;
always@(posedge ddr2_clk or negedge sys_rst_n)
begin
    if(~sys_rst_n)begin
		   local_write_req      <= 1'b0;
		   local_read_req       <= 1'b0;
		   local_burstbegin     <= 1'b0;
         rd_ddr2_size_wrreq   <= 1'b0;
			um2ddr_command_rdreq <= 1'b0;
			um2ddr_rdreq         <= 1'b0;
			um2ddr_reg           <= 96'b0;
			shift                <= 2'b0;
			state <= idle_s;
	   end
	 else begin
	    case(state)
		   idle_s:begin
			    if(um2ddr_command_empty)begin
				     local_write_req      <= 1'b0;
		           local_read_req       <= 1'b0;
		           local_burstbegin     <= 1'b0;
                 rd_ddr2_size_wrreq   <= 1'b0;
			        um2ddr_command_rdreq <= 1'b0;
				     state  <= idle_s;
					end
				 else begin
				    op_addr              <= um2ddr_command_rdata[25:0];
					 pkt_len              <= um2ddr_command_rdata[32:26];
					 um2ddr_command_rdreq <= 1'b1;
					 local_address        <= um2ddr_command_rdata[25:0];
				     if(um2ddr_command_rdata[33])begin//read ddr2
					       pkt_len        <= um2ddr_command_rdata[32:26]<<2;
							 state          <=  rd_start_s;
					     end
					  else begin//write ddr2
					       um2ddr_rdreq <= 1'b1;
					       //local_wdata  <= um2ddr_rdata;
							 state        <= wr_start_s;
					     end
					end
			   end
			wr_start_s:begin
			    um2ddr_command_rdreq <= 1'b0;
				 um2ddr_rdreq         <= 1'b0;
			   if(local_ready&local_init_done)begin
				    local_write_req   <= 1'b1;
					 local_burstbegin  <= 1'b1;
                local_be          <= 4'hf;
                local_size        <= 4'h4;
					 pkt_len           <= pkt_len - 1'b1;
					 local_address     <= op_addr ;
				   // um2ddr_rdreq      <= 1'b1;
					 local_wdata       <= um2ddr_rdata[127:96];
				    um2ddr_reg        <= um2ddr_rdata[95:0];	 
					 state             <= wr_mid_fs;
				  end
				else begin
				    local_write_req   <= 1'b0;
				    state <= wr_start_s;
				  end
				end
			wr_mid_fs:
			   begin
			      if(local_ready&local_init_done)
					 begin
					  local_write_req   <= 1'b1;
					  local_burstbegin  <= 1'b0;
					  um2ddr_rdreq      <= 1'b0;
					  local_be          <= 4'hf;
					  local_wdata       <= um2ddr_reg[95:64];
					  state             <= wr_mid_sd;
					 end
					else
					 begin
					  //local_write_req   <= 1'b0;
					  local_burstbegin  <= 1'b0;
					  um2ddr_rdreq      <= 1'b0;
					  state             <= wr_mid_fs;
					 end
				end
			wr_mid_sd:
			   begin
	 		      if(local_ready&local_init_done)
					 begin
					  local_write_req   <= 1'b1;
					  um2ddr_rdreq      <= 1'b0;
					  local_be          <= 4'hf;
					  local_wdata       <= um2ddr_reg[63:32];
					  state             <= wr_end_s;
					 end
					else
					 begin
					//  local_write_req   <= 1'b0;
					  state             <= wr_mid_sd;
					 end
				end
			wr_end_s:
			   begin
					if(local_ready&local_init_done)
					 begin
					  local_write_req   <= 1'b1;
					  um2ddr_rdreq      <= 1'b0;
					  local_be          <= 4'hf;
					  local_wdata       <= um2ddr_reg[31:0];
					  op_addr           <= op_addr + 4'h4;
					  if(pkt_len == 7'h0)
					   begin
					    state      <= idle_s;
					   end
					  else
					   begin
					    um2ddr_rdreq      <= 1'b1;
					    state             <= wr_start_s;
					   end
					 end
					else
					 begin
					  state             <= wr_end_s;
					 end
				end
		   rd_start_s:begin
			     um2ddr_command_rdreq <= 1'b0;
			      if(read_permit==1'b0)begin
					    state <= rd_start_s;
					  end
					else begin
					    rd_ddr2_size       <= pkt_len;
						 rd_ddr2_size_wrreq <= 1'b1;
						 state  <= rd_s;
					  end
			   end
			rd_s:begin 
			   rd_ddr2_size_wrreq <= 1'b0;
				if(local_ready&&local_init_done)
			     begin
					 local_read_req   <= 1'b1;
					 local_burstbegin <= 1'b1;
                local_be         <= 4'hf;
					 local_address		<=	op_addr;
					 if(pkt_len > 7'h8)
					   begin
 						  local_size <= 4'h4;
						  pkt_len    <= pkt_len - 4'h4;
						  op_addr    <= op_addr + 4'h4; 
						  state      <= wait_s;
					   end
					 else begin
						  	local_size <= pkt_len[3:0];	
	                 //op_addr    <= op_addr + pkt_len[3:0]; 					  
						  //local_read_req   <= 1'b0;
					     //local_burstbegin <= 1'b0;
						  state      <= idle_s;
					   end
				  end
				 else begin
				    local_read_req <= 1'b0;
				    state          <= rd_s;
				  end
			   end
			wait_s:begin
			       local_read_req <= 1'b0;
				    state          <= rd_s;
				end
			     
			default:begin
			     local_write_req      <= 1'b0;
		        local_read_req       <= 1'b0;
		        local_burstbegin     <= 1'b0;
              rd_ddr2_size_wrreq   <= 1'b0;
			     um2ddr_command_rdreq <= 1'b0;
			     um2ddr_rdreq         <= 1'b0;
			     state <= idle_s; 
				end
		 endcase
	 end
end
wire [9:0]   um2ddr_wrusedw; 
reg          um2ddr_rdreq;
wire [127:0] um2ddr_rdata;
wire         um2ddr_empty;         
um2ddr_fifo  um2ddr_fifo (
	    .aclr(!sys_rst_n),
	    .data(um2ddr_data),
	    .rdclk(ddr2_clk),
	    .rdreq(um2ddr_rdreq),
	    .wrclk(um2ddr_wrclk),
	    .wrreq(um2ddr_wrreq),
	    .q(um2ddr_rdata),
	    .rdempty(um2ddr_empty),
	    .wrusedw(um2ddr_wrusedw));
wire  um2ddr_afull;
assign um2ddr_afull = (um2ddr_wrusedw > 9'd127)?1'b1:1'b0;
wire [7:0]   um2ddr_command_wrusedw; 
reg          um2ddr_command_rdreq;
wire [33:0]  um2ddr_command_rdata;
wire         um2ddr_command_empty; 
um2ddr_command_fifo  um2ddr_command_fifo (
	    .aclr(!sys_rst_n),
	    .data(um2ddr_command),
	    .rdclk(ddr2_clk),
	    .rdreq(um2ddr_command_rdreq),
	    .wrclk(um2ddr_wrclk),
	    .wrreq(um2ddr_command_wrreq),
	    .q(um2ddr_command_rdata),
	    .rdempty(um2ddr_command_empty),
	    .wrusedw(um2ddr_command_wrusedw)); 
wire um2ddr_command_afull;
assign um2ddr_command_afull = (um2ddr_command_wrusedw > 8'hfa)?1'b1:1'b0;
endmodule
