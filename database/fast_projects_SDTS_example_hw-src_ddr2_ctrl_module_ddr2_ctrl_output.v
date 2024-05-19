// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module ddr2_ctrl_output(
sys_rst_n,

ddr2_clk,

local_rdata,
local_rdata_valid,

ddr2um_rdclk,
ddr2um_rdreq,
ddr2um_rdata,
ddr2um_valid_rdreq,
ddr2um_valid_rdata,
ddr2um_valid_empty,

rd_ddr2_size,
rd_ddr2_size_wrreq,
read_permit
);
input          sys_rst_n;
input          ddr2_clk;

input	[31:0]	local_rdata;
input		      local_rdata_valid;

input          ddr2um_rdclk;
input          ddr2um_rdreq;
output[127:0]  ddr2um_rdata;
input          ddr2um_valid_rdreq;
output[6:0]    ddr2um_valid_rdata;
output         ddr2um_valid_empty;

input[6:0]     rd_ddr2_size;
input          rd_ddr2_size_wrreq;
output         read_permit;
/////////////////////////////////////
wire[127:0]     ddr2um_rdata;
wire[6:0]       ddr2um_valid_rdata;
wire           read_permit;
reg [9:0]write_depth_cnt;
reg [2:0] current_state;
parameter idle  =3'h0,
          rd_2s =3'h1,
			 rd_3s =3'h2,
			 wr_1p =3'h3;
always@(posedge ddr2_clk or negedge sys_rst_n)
begin
    if(~sys_rst_n)begin
		  ddr2um_wrreq 		<= 1'b0;
		  write_depth_cnt    <= 10'b0;
		  current_state      <= idle;
	   end
	 else begin
	 case(current_state)
	  idle:begin
		   if(local_rdata_valid)
			  begin
				  ddr2um_data[127:96]  <= local_rdata;
				  current_state        <= rd_2s;
				  ddr2um_wrreq <= 1'b0;
				  if(ddr2um_valid_wrreq == 1'b1)
				   begin
					 write_depth_cnt <= write_depth_cnt + 1'b1 - (ddr2um_valid_data<<2);
				   end
				  else 
				   begin
				     write_depth_cnt <= write_depth_cnt + 4'h1;
				   end
			  end
			 else
			  begin
			     ddr2um_wrreq <= 1'b0;
				 //current_state       <= wr_1p;
			    if(ddr2um_valid_wrreq == 1'b1)
				    begin
				     write_depth_cnt <= write_depth_cnt - (ddr2um_valid_data<<2);
				    end
				  else 
				    begin
				     write_depth_cnt <= write_depth_cnt;
				    end
				  current_state        <= idle;
			  end
			 end
	  rd_2s:begin
	       if(local_rdata_valid)
			  begin
				  ddr2um_data[95:64]  <= local_rdata;
				  current_state        <= rd_3s;
				  write_depth_cnt <= write_depth_cnt + 4'h1;
				  //ddr2um_wrreq <= 1'b1;
			  end
			 else
			  begin
			     current_state        <= rd_2s;
			  end
			 end
		rd_3s:begin
		    if(local_rdata_valid)
			  begin
				  ddr2um_data[63:32]  <= local_rdata;
				  current_state       <= wr_1p;
				  write_depth_cnt     <= write_depth_cnt + 4'h1;
				  //ddr2um_wrreq <= 1'b1;
			  end
			 else
			  begin
			     current_state        <= rd_3s;
			  end
			 end
		wr_1p:begin
		    if(local_rdata_valid)
			  begin
				  ddr2um_data[31:0]  <= local_rdata;
				  ddr2um_wrreq       <= 1'b1;
				  current_state      <= idle;
				  if(ddr2um_valid_wrreq == 1'b1)
				    begin
					 write_depth_cnt <= write_depth_cnt + 1'b1 - (ddr2um_valid_data<<2);
				    end
				  else 
				    begin
				     write_depth_cnt <= write_depth_cnt + 4'h1;
				    end
				end
			 else 
				begin
			    ddr2um_wrreq        <= 1'b0;
				 //current_state       <= wr_1p;
			    if(ddr2um_valid_wrreq == 1'b1)
				    begin
				     write_depth_cnt <= write_depth_cnt - (ddr2um_valid_data<<2);
				    end
				  else 
				    begin
				     write_depth_cnt <= write_depth_cnt;
				    end
			  end 
		end
		default:
		 begin
		  ddr2um_wrreq 		<= 1'b0;
		  write_depth_cnt    <= 10'b1;
		  current_state      <= idle;
		 end
endcase
end
end
reg state;
parameter idle_s = 1'b0,
          stop_read_s = 1'b1;
always@(posedge ddr2_clk or negedge sys_rst_n)
begin
if(~sys_rst_n)begin
      rd_ddr2_size_rdreq <= 1'b0;
		  ddr2um_valid_wrreq <= 1'b0; 
		  state	<= idle_s;
	   end
else begin
case(state)
   idle_s:begin
      if(write_depth_cnt!=10'b0)begin
         if(write_depth_cnt>=rd_ddr2_size_rdata)begin
            ddr2um_valid_wrreq <= 1'b1;
            ddr2um_valid_data  <=  rd_ddr2_size_rdata>>2;
            rd_ddr2_size_rdreq <= 1'b1;
            state <= stop_read_s;
          end
         else begin
            ddr2um_valid_wrreq <= 1'b0; 
            rd_ddr2_size_rdreq <= 1'b0;
            state <= idle_s;
          end
       end
      else begin
          ddr2um_valid_wrreq <= 1'b0; 
          rd_ddr2_size_rdreq <= 1'b0;
          state <= idle_s;
       end
    end
   stop_read_s:begin
       rd_ddr2_size_rdreq  <= 1'b0;
       ddr2um_valid_wrreq <= 1'b0;
       state <= idle_s;
    end
   default:begin
        rd_ddr2_size_rdreq <= 1'b0;
		  ddr2um_valid_wrreq <= 1'b0; 
		  state	<= idle_s;
	   end 
endcase
end
end

wire [3:0]  rd_ddr2_size_wrusedw; 
reg         rd_ddr2_size_rdreq;
wire [6:0]  rd_ddr2_size_rdata;
wire        rd_ddr2_size_empty; 
wire [3:0]  rd_ddr2_size_rdusedw;
ddr2um_valid_fifo  rd_ddr2_size_fifo (
	    .aclr(!sys_rst_n),
	    .data(rd_ddr2_size),
	    .rdclk(ddr2_clk),
	    .rdreq(rd_ddr2_size_rdreq),
	    .wrclk(ddr2_clk),
	    .wrreq(rd_ddr2_size_wrreq),
	    .q(rd_ddr2_size_rdata),
	    .rdempty(rd_ddr2_size_empty),
	    .wrusedw(rd_ddr2_size_wrusedw));
	  //  .rdusedw(rd_ddr2_size_rdusedw) 
//assign rd_ddr2_size_afull = (rd_ddr2_size_wrusedw > 8'hfa)?1'b1:1'b0;

wire [9:0]   ddr2um_wrusedw; 
reg          ddr2um_wrreq;
reg  [127:0] ddr2um_data;
//wire         ddr2um_empty;         
ddr2um_fifo  ddr2um_fifo (
	    .aclr(!sys_rst_n),
	    .data(ddr2um_data),
	    .rdclk(ddr2um_rdclk),
	    .rdreq(ddr2um_rdreq),
	    .wrclk(ddr2_clk),
	    .wrreq(ddr2um_wrreq),
	    .q(ddr2um_rdata),
	    .rdempty(),
	    .wrusedw(ddr2um_wrusedw)); 
//assign ddr2um_afull = (ddr2um_wrusedw > 9'd127)?1'b1:1'b0;
wire [3:0]   ddr2um_valid_wrusedw; 
reg          ddr2um_valid_wrreq;
reg  [6:0]   ddr2um_valid_data;
wire         ddr2um_valid_empty; 
ddr2um_valid_fifo  ddr2um_valid_fifo (
	    .aclr(!sys_rst_n),
	    .data(ddr2um_valid_data),
	    .rdclk(ddr2um_rdclk),
	    .rdreq(ddr2um_valid_rdreq),
	    .wrclk(ddr2_clk),
	    .wrreq(ddr2um_valid_wrreq),
	    .q(ddr2um_valid_rdata),
	    .rdempty(ddr2um_valid_empty),
	    .wrusedw(ddr2um_valid_wrusedw)); 
//assign ddr2um_valid_afull = (ddr2um_valid_wrusedw > 8'hfa)?1'b1:1'b0;

assign read_permit = ((rd_ddr2_size_wrusedw + ddr2um_valid_wrusedw)<= 4'h6)? 1'b1 : 1'b0;
endmodule
