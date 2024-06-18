// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

/////////////////////////////////////////////////////////////////////////////////
// Company:   NUDT
// Engineer:  
// Create Date:    11/08/2010 
// Module Name:    command_parse 
// Project Name: 
// Tool versions: quartus 9.1
// Description:   1. ????
//                2. ??????
//                3. ????                 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns
module command_parse(
       clk,
       reset_n,// active low
       //////??////////////
       command_data,        //???[34:32]001:???????  011:???????  010:????????   111:???????? [31:0]:??
       command_wr,
       command_fifo_full,
       sequence_d,          //[15:0]:??????[16]:?????? 1????? 0????? ???
       sequence_wr,
       sequence_fifo_full,
       //////////////////////////
       /////// local_bus ////////
       ale,    //Address Latch Enable.active high output
       cs_n,   //local bus chip select ,active low.
       rd_wr,  //read or write request.1: read  0: write  output
       //32-bit bidirectional multiplexed data and address bus inout
		   data_out,  
       ack_n_um,                //local bus ack.active low. input
       ack_n_cdp,               //local bus ack.active low. input
       ack_n_sram,              //local bus ack.active low. input
       
       rdata_um,                //local bus read data from um
       rdata_cdp,               //local bus read data from cdp
       rdata_sram,              //local bus read data from sram
      
       pkt_to_gen,//[36:34] 001:???????  011:???????  010:???????? 100:???? [33:32]:?????  [31:0]:??
       pkt_to_gen_wr,
       pkt_to_gen_afull,
       length_to_gen,//[32:24]:?????? [23:16]:count  [15:0]???
       length_to_gen_wr,
       length_to_gen_afull 
       );
input        clk;
input        reset_n;//active low
       
output       ale;                    //Address Latch Enable.active high output
output       cs_n;                   //local bus chip select ,active low.
output       rd_wr;                  //read or write request.1: read  0: write  output
//32-bit bidirectional multiplexed data and address bus inout                 
output[31:0] data_out;
input        ack_n_um;               //local bus ack.active low. input
input        ack_n_cdp;              //local bus ack.active low. input
input        ack_n_sram;             //local bus ack.active low. input
       
input [31:0] rdata_um;                //local bus read data from um
input [31:0] rdata_cdp;               //local bus read data from cdp
input [31:0] rdata_sram;              //local bus read data from sram


input [34:0] command_data;      //???[34:32]001:???????  011:???????  010:????????   100:???????? [31:0]:??
input        command_wr;
output       command_fifo_full;
input [16:0] sequence_d;        //[15:0]:??????[16]:?????? 1????? 0????? ???
input        sequence_wr;
output       sequence_fifo_full;


output [36:0]pkt_to_gen;//[36:34] 001:???????  011:???????  010:???????? 100:???? [33:32]:?????  [31:0]:??
output       pkt_to_gen_wr;
input        pkt_to_gen_afull;
output [32:0]length_to_gen;
output       length_to_gen_wr;
input        length_to_gen_afull; 

reg          ale;                    //Address Latch Enable.active high output
reg          cs_n;                   //local bus chip select ,active low.
reg          rd_wr;                  //read or write request.1: read  0: write  output
reg [31:0]   data_out;               //32-bit bidirectional multiplexed data and address bus inout


reg [36:0]   pkt_to_gen;
reg          pkt_to_gen_wr;
reg [32:0]   length_to_gen;
reg          length_to_gen_wr;

reg [31:0]   com_rdout;
reg [15:0]    result_cnt;     //??????????
reg [2:0]    head_tail_flag; //???????
reg [31:0]   op_addr;        //??????

reg [15:0]    burst;
reg [8:0]    timer;
reg [1:0]    wait_cnt;


reg [7:0] count;//??????

//////////////FIFO ???//////////////
wire [9:0]  wrusedw_com;
wire [34:0] command_rdata;
reg         command_rd;
wire        command_empty;
wire        command_fifo_full;
data_fifo com_fifo(
	.aclr(!reset_n),
	.data(command_data),
	.rdclk(clk),
	.wrclk(clk),
	.rdreq(command_rd),
	.wrreq(command_wr),
	.q(command_rdata),
	.rdempty(command_empty),
	.wrusedw(wrusedw_com));

assign command_fifo_full = (wrusedw_com > 10'd650)?1'b1:1'b0;  
 
wire[8:0] wrusedw_sequence;
wire[16:0]sequence_rdata;
reg       sequence_rd;
wire      sequence_empty;
wire      sequence_fifo_full;
com_valid_fifo com_valid_fifo(
	.aclr(!reset_n),
	.data(sequence_d),
    .rdclk(clk),
	.wrclk(clk),
	.rdreq(sequence_rd),
	.wrreq(sequence_wr),
	.q(sequence_rdata),
	.rdempty(sequence_empty),
	.wrusedw(wrusedw_sequence));
assign sequence_fifo_full = (wrusedw_sequence > 9'd510)?1'b1:1'b0; 

reg [33:0] result_head_data;
reg        result_head_rdreq;
reg        result_head_wrreq;
wire[33:0] result_head_rdata;
wire       result_head_afull;
wire[9:0]  wrusedw_head;
// ?????????????????
result_fifo result_head_fifo (
	.aclr(!reset_n),
	.data(result_head_data),
	.clock(clk),
	.rdreq(result_head_rdreq),
	.wrreq(result_head_wrreq),
	.q(result_head_rdata),
	.usedw(wrusedw_head));

 assign result_head_afull = (wrusedw_head > 10'd650)?1'b1:1'b0; 
 
// ?????????????????---?n? 
 reg  [33:0] result_data;
 reg         result_rdreq;
 reg         result_wrreq;
 wire [33:0] result_rdata;
 wire        result_afull;
 wire [9:0]  wrusedw_result;
 //??????????????????????????????????
result_fifo result_fifo(
	.aclr(!reset_n),
	.data(result_data),
	.clock(clk),
	.rdreq(result_rdreq),
	.wrreq(result_wrreq),
	.q(result_rdata),
	.usedw(wrusedw_result));
assign result_afull = (wrusedw_result > 10'd650)?1'b1:1'b0; 

reg [32:0] pkt_length_data;//[15:0]???  [23:16]:????[32:24]:???????????????4???
reg        pkt_length_rdreq;
reg        pkt_length_wrreq;
wire       pkt_length_empty;
wire [32:0]pkt_length_rdata;
wire       pkt_length_afull;
wire [8:0] wrusedw_pkt_length;
//??????????????????? ???????????????4???
pkt_length_fifo pkt_length_fifo (
	.aclr(!reset_n),
	.data(pkt_length_data),
	.clock(clk),
	.rdreq(pkt_length_rdreq),
	.wrreq(pkt_length_wrreq),
	.q(pkt_length_rdata),
	.empty(pkt_length_empty),
	.usedw(wrusedw_pkt_length));
 assign pkt_length_afull = (wrusedw_pkt_length > 9'd510)?1'b1:1'b0; 


wire parse_permit; 
assign parse_permit = (~command_empty) & (~sequence_empty) & (~result_head_afull) & (~result_afull) & (~pkt_length_afull);//1:???? 0????
wire ack_n;
assign ack_n = ack_n_um & ack_n_cdp & ack_n_sram;
parameter idle_s            = 4'h0,
	      	parse_s           = 4'h1,
	       	read_addr_s       = 4'h2,
	      	read_s            = 4'h3,
	   	    read_ale_s        = 4'h4,
	      	read_wait_s       = 4'h5,
	      	read_cs_s         = 4'h6,
	      	read_ack_s        = 4'h7,
	      	write_addr_s      = 4'h8,
	      	write_s           = 4'h9,
	      	write_ale_s       = 4'ha,
	      	write_wait_s      = 4'hb,
	      	write_data_s      = 4'hc,
	      	write_cs_s        = 4'hd,
	      	write_ack_s       = 4'he,	
	      	drop_s            = 4'hf;
reg [3:0] com_parse_state;   
always@(posedge clk or negedge reset_n)
begin
	if(~reset_n)begin
		 command_rd          <= 1'b0;
		 sequence_rd         <= 1'b0;
		 ale                 <= 1'b0;
		 cs_n                <= 1'b1;
		 rd_wr   <= 1'b1;
		 result_wrreq        <= 1'b0;
		 result_head_wrreq   <= 1'b0;
		 pkt_length_wrreq    <= 1'b0;
		 timer           <= 9'b0;
		 com_parse_state     <= idle_s;
	end
	else begin
		case(com_parse_state)
		  idle_s: begin
		      ale                 <= 1'b0;
		      cs_n                <= 1'b1;
		      result_wrreq        <= 1'b0;
		      result_head_wrreq   <= 1'b0;
		      pkt_length_wrreq    <= 1'b0;
		      result_cnt          <= 16'h0;
		      pkt_length_data     <= 33'h0;
		      timer           <= 9'b0;
		   	casex({parse_permit,sequence_rdata[16]})
		   	  2'b11: begin
   	          	command_rd      <= 1'b1;
   	          	sequence_rd     <= 1'b1;
   	            com_rdout       <= command_rdata[31:0];//2011 4 12
   	            head_tail_flag  <= command_rdata[34:32];
   	            pkt_length_data[15:0] <= sequence_rdata[15:0];
   	          	com_parse_state <= parse_s;
   	          end
   	      2'b10: begin
   	            command_rd      <= 1'b1;
   	            sequence_rd     <= 1'b1;
   	            com_parse_state <= drop_s;
   	          end 
   	      default:begin
   	     	      command_rd      <= 1'b0;
		            sequence_rd     <= 1'b0;
   	     	      com_parse_state <= idle_s; 
   	     	    end
		    endcase
		  end
		 parse_s:begin
		 	  command_rd      <= 1'b0;
   	    sequence_rd     <= 1'b0;
   	    result_cnt      <= 16'b0;
   	    case(com_rdout[27:24])
   	      4'h1:begin//??????
   	      	case({head_tail_flag,com_rdout[8]})
   	      	 4'b1001:begin//????
   	      		 result_head_data    <= 34'h001000100;
		           result_head_wrreq   <= 1'b1;
		           result_wrreq        <= 1'b0;
		           pkt_length_data[32:24] <= 9'h001;
		           pkt_length_data[23:16] <= pkt_length_data[23:16] + 1'b1;
		           pkt_length_wrreq    <= 1'b1; 
		           com_parse_state     <= idle_s; 
   	      	  end
   	      	 4'b1000:begin//????????
   	      	 	 result_head_wrreq   <= 1'b0;
		           result_wrreq        <= 1'b0;
		           pkt_length_wrreq    <= 1'b0;
		           com_parse_state     <= idle_s; 
   	      	  end
   	      	default:begin
   	      		 result_head_wrreq   <= 1'b0;
		           result_wrreq        <= 1'b0;
		           if(pkt_length_data[32:24] == 9'h0)
		             pkt_length_wrreq    <= 1'b0;
		           else
		             pkt_length_wrreq    <= 1'b1;
		           com_parse_state     <= drop_s;  
   	      		end 
   	      	endcase 
   	       end
   	      4'h2:begin//????
   	      	case({head_tail_flag,com_rdout[9]})
   	      	 4'b1001:begin//????
   	      		 result_head_data    <= 34'h002000200;
		           result_head_wrreq   <= 1'b1;
		           result_wrreq        <= 1'b0;
		           pkt_length_data[32:24]  <= 9'h001;
		           pkt_length_data[23:16]  <= pkt_length_data[23:16] + 1'b1;
		           pkt_length_wrreq    <= 1'b1; 
		           com_parse_state     <= idle_s; 
   	      	  end
   	      	 4'b1000:begin//???? ???
   	      	 	 result_head_wrreq   <= 1'b0;
		           result_wrreq        <= 1'b0;
		           pkt_length_wrreq    <= 1'b0;
		           com_parse_state     <= idle_s; 
   	      	  end
   	      	default:begin
   	      		 result_head_wrreq   <= 1'b0;
		           result_wrreq        <= 1'b0;
		           if(pkt_length_data[32:24] == 9'h0)
		             pkt_length_wrreq    <= 1'b0;
		           else
		             pkt_length_wrreq    <= 1'b1;
		           com_parse_state     <= drop_s;  
   	      		end 
   	      	endcase 
   	       end
   	      4'h3:begin//???
   	          result_head_wrreq   <= 1'b0;
		          result_wrreq        <= 1'b0;
   	          burst           <= com_rdout[23:8];
   	          command_rd      <= 1'b1;
   	          com_parse_state <= read_addr_s;
   	        end
   	      4'h4:begin//???
   	      	  result_head_wrreq   <= 1'b0;
		          result_wrreq        <= 1'b0;
   	      	  burst           <= com_rdout[23:8];
   	          command_rd      <= 1'b1;
   	          com_parse_state <= write_addr_s;
   	      	end

   	     default:begin
   	     	   result_head_wrreq   <= 1'b0;
		         result_wrreq        <= 1'b0;
   	     	   command_rd      <= 1'b1;
   	     	   com_parse_state <= drop_s;  
   	     	 end
   	    endcase  
		  end
		 read_addr_s:begin
		 	  command_rd      <= 1'b0;
		 	  op_addr         <= command_rdata[31:0];
   	    head_tail_flag  <= command_rdata[34:32];
   	    com_parse_state <= read_s;
		 	end
		 read_s: begin
		 	 result_wrreq      <= 1'b0;
		 	   if( ack_n != 1'b0 )begin
		 	   	data_out        <= op_addr;//??
		 	    rd_wr           <= 1'b1;//read
		 	    wait_cnt  <= 2'b0;
		 	    com_parse_state <= read_ale_s;
		 	   end
		 	   else begin//??????????
		 	   	  com_parse_state <= read_s;
		 	    end
		 	 end
		 read_ale_s:begin
		 	  if(wait_cnt==2'b10)begin
		 	  	wait_cnt  <= 2'b0;
			    ale <= 1'b1;//????
			    com_parse_state <= read_wait_s;
			   end
			  else begin
			  	 wait_cnt <= wait_cnt + 1'b1;
			  	 com_parse_state <= read_ale_s;
			   end
			 end 
	   read_wait_s:begin
	   	  if(wait_cnt==2'b10)begin
	   	  	wait_cnt  <= 2'b0;
	  	    ale <= 1'b0;
			    com_parse_state <= read_cs_s;
			   end
			  else begin
			  	wait_cnt <= wait_cnt + 1'b1;
			  	com_parse_state <= read_wait_s;
			   end
	  	end
	   read_cs_s:begin//????
	   	  if(wait_cnt==2'b10)begin
	   	  	wait_cnt <= 2'b0;
	   	    data_out        <= 32'h0;
	   	    cs_n            <= 1'b0;
	   	    result_cnt      <= result_cnt + 1'b1;
	   	    burst           <= burst - 1'b1;
	   	    com_parse_state <= read_ack_s;
	   	   end
	   	  else begin
	   	  	wait_cnt <= wait_cnt + 1'b1;
			    com_parse_state <= read_cs_s;
	   	  end
	   	end
	   read_ack_s:begin
	   	  case({ack_n,timer[8],(|burst)})
	   	    3'b000,3'b010:begin//??????
	   	        case({ack_n_um,ack_n_cdp,ack_n_sram})
	   	           3'b011:begin
	   	              result_data <= {2'b0,rdata_um}; 
	   	            end
	   	           3'b101:begin
	   	              result_data <= {2'b0,rdata_cdp};
	   	            end
	   	           3'b110:begin
                      result_data <= {2'b0,rdata_sram};
	   	            end
	   	           default:begin
	   	              result_data <= 34'b0;
	   	            end
	   	         endcase
	   	        result_wrreq      <= 1'b1;
	   	        cs_n              <= 1'b1;
	   	        timer           <= 9'b0;
	   	        pkt_length_data[32:24] <= pkt_length_data[32:24] + 9'h002;
	   	        pkt_length_data[23:16] <= pkt_length_data[23:16] + 1'b1;
	   	        result_head_data  <= {10'h005,result_cnt,8'h0};
	   	        result_head_wrreq <= 1'b1;
	   	       if(head_tail_flag == 3'b010)begin//???
	   	       	  pkt_length_wrreq <= 1'b1;
	   	          com_parse_state  <= idle_s;
	   	        end
	   	        else begin//?????????????
	   	        	 command_rd      <= 1'b1;
	   	        	 com_rdout       <= command_rdata[31:0];
	   	        	 head_tail_flag  <= command_rdata[34:32];
	   	        	 com_parse_state <= parse_s;
	   	         end
	   	      end
	   	    3'b110,3'b111:begin//??
	   	        cs_n              <= 1'b1;
	   	        pkt_length_data[32:24] <= pkt_length_data[32:24] + 9'h001;
	   	        pkt_length_data[23:16] <= pkt_length_data[23:16] + 1'b1;
	   	        result_head_data  <= {10'h005,(result_cnt-1'b1),8'h0};
	   	        result_head_wrreq <= 1'b1;
	   	        timer           <= 9'b0;
	   	        if(head_tail_flag == 3'b010)begin//???
	   	       	  pkt_length_wrreq <= 1'b1;
	   	          com_parse_state  <= idle_s;
	   	        end
	   	        else begin//?????????????
	   	        	 command_rd      <= 1'b1;
	   	        	 com_rdout       <= command_rdata[31:0];
	   	        	 head_tail_flag  <= command_rdata[34:32];
	   	        	 com_parse_state <= parse_s;
	   	         end
	   	      end
	   	    3'b001,3'b011:begin//????????
	   	        case({ack_n_um,ack_n_cdp,ack_n_sram})
	   	           3'b011:begin
	   	              result_data <= {2'b0,rdata_um}; 
	   	            end
	   	           3'b101:begin
	   	              result_data <= {2'b0,rdata_cdp};
	   	            end
	   	           3'b110:begin
                      result_data <= {2'b0,rdata_sram};
	   	            end
	   	           default:begin
	   	              result_data <= 34'b0;
	   	            end
	   	         endcase
	   	        result_wrreq      <= 1'b1;
	   	        timer           <= 9'b0;
	   	        cs_n              <= 1'b1;
	   	        op_addr           <= op_addr + 1'b1;
	   	        pkt_length_data[32:24]   <= pkt_length_data[32:24] + 9'h001;
	   	        com_parse_state   <= read_s;
	   	      end
          3'b100,3'b101:begin
              result_wrreq      <= 1'b0;
          	  timer  <= timer + 1'b1;
          	  com_parse_state   <= read_ack_s;
          	end
         endcase
	   	end
	   write_addr_s:begin
	   	  command_rd      <= 1'b0;
		 	  op_addr         <= command_rdata[31:0];
   	    head_tail_flag  <= command_rdata[34:32];
   	    com_parse_state <= write_s; 
	   	end
	   write_s:begin
	   	  if( ack_n != 1'b0 )begin
		 	   	data_out        <= op_addr;//??
		 	    rd_wr           <= 1'b0;//write
		 	     wait_cnt  <= 2'b0;
		 	    com_parse_state <= write_ale_s;
		 	   end
		 	   else begin//??????????
		 	   	  com_parse_state <= write_s;
		 	    end
	   	end
	   write_ale_s:begin
	   	  if(wait_cnt==2'b10)begin
	   	  	wait_cnt <= 2'b0;
			    ale <= 1'b1;//????
			    com_parse_state <= write_wait_s;
			   end
			  else begin
			  	 wait_cnt <= wait_cnt + 1'b1;
			  	 com_parse_state <= write_ale_s;
			  	end
			 end 
	   write_wait_s:begin
	   	   if(wait_cnt==2'b10)begin
	   	   	 wait_cnt <= 2'b0;
	  	     ale <= 1'b0; 
			     com_parse_state <= write_data_s;
			    end
			   else begin
			   	 wait_cnt <= wait_cnt + 1'b1;
			   	 com_parse_state <= write_wait_s;
			   	end
	  	end
	   write_data_s:begin
	   	  if(wait_cnt==2'b10)begin
	   	  wait_cnt <= 2'b0;
	       command_rd      <= 1'b1;
	  	   data_out        <= command_rdata[31:0];
	  	   head_tail_flag  <= command_rdata[34:32];
	  	   wait_cnt        <= 2'b0;
	  	   com_parse_state <= write_cs_s;
	  	  end
	  	 else begin
	  	 	 wait_cnt <= wait_cnt + 1'b1;
			   com_parse_state <= write_data_s;
	  	 	end
	   	end
	   write_cs_s:begin//????
	   	   command_rd      <= 1'b0; 
	   	   if(wait_cnt==2'b10)begin
	   	   	 wait_cnt        <= 2'b0;
	   	     cs_n            <= 1'b0;
	   	     result_cnt      <= result_cnt + 1'b1;
	   	     burst           <= burst - 1'b1;
	   	     com_parse_state <= write_ack_s;
	   	    end
	   	   else begin
	   	   	 wait_cnt <= wait_cnt + 1'b1;
			   	 com_parse_state <= write_cs_s;
	   	   	end
	   	end
	   write_ack_s:begin
	   	  case({ack_n,timer[8],(|burst)})
	   	    3'b000,3'b010:begin//??????
	   	        cs_n  <= 1'b1;          
	   	        rd_wr <= 1'b1;
	   	        timer           <= 9'b0;
	   	        pkt_length_data[32:24] <= pkt_length_data[32:24] + 9'h001;
	   	        pkt_length_data[23:16] <= pkt_length_data[23:16] + 1'b1;
	   	        result_head_data   <= {10'h006,result_cnt,8'h0};
	   	        result_head_wrreq  <= 1'b1;
	   	       if(head_tail_flag == 3'b010)begin//???
	   	       	  pkt_length_wrreq <= 1'b1;
	   	          com_parse_state  <= idle_s;
	   	        end
	   	        else begin//?????????????
	   	        	 command_rd      <= 1'b1;
	   	        	 com_rdout       <= command_rdata[31:0];
	   	        	 head_tail_flag  <= command_rdata[34:32];
	   	        	 com_parse_state <= parse_s;
	   	         end
	   	      end
	   	    3'b110,3'b111:begin//??
	   	        cs_n              <= 1'b1;
	   	        timer           <= 9'b0;
	   	         rd_wr <= 1'b1;
	   	        pkt_length_data[32:24] <= pkt_length_data[32:24] + 9'h001;
	   	        pkt_length_data[23:16] <= pkt_length_data[23:16] + 1'b1;
	   	        result_head_data  <= {10'h006,(result_cnt-1'b1),8'h0};
	   	        result_head_wrreq <= 1'b1;
	   	        if(head_tail_flag == 3'b010)begin//???
	   	       	  pkt_length_wrreq <= 1'b1;
	   	          com_parse_state  <= idle_s;
	   	        end
	   	        else begin//????????????? ???????????????????
	   	        	 command_rd       <= 1'b1;
	   	        	 pkt_length_wrreq <= 1'b1;
	   	        	 com_parse_state  <= drop_s;
	   	         end
	   	      end
	   	    3'b001,3'b011:begin//????????
	   	        cs_n              <= 1'b1;
	   	         rd_wr <= 1'b1;
	   	         timer           <= 9'b0;
	   	        op_addr           <= op_addr + 1'b1;
	   	        com_parse_state   <= write_s;
	   	      end
          3'b100,3'b101:begin
          	  timer  <= timer + 1'b1;
          	  com_parse_state   <= write_ack_s;
          	end
          endcase
	   	end
		 drop_s: begin
   	       sequence_rd      <= 1'b0; 
   	       pkt_length_wrreq <= 1'b0;
   	     if((command_rdata[34:32]==3'b010)||(command_rdata[34:32]==3'b100))
   	          begin
   	          	 command_rd       <= 1'b0;
   	          	 com_parse_state  <= idle_s;
   	          end
   	     else
   	          begin
   	          	 command_rd       <= 1'b1;
   	          	 com_parse_state  <= drop_s;
   	          	end
   	   end 
		 default:begin
		  	command_rd          <= 1'b0;
		    sequence_rd         <= 1'b0;
		    ale                 <= 1'b0;
		    cs_n                <= 1'b1;
		    com_parse_state     <= idle_s;
		  end
	  endcase
	end
end

reg [8:0]  result_cnt0;
reg        first_head_flag;
reg [15:0]  rd_result_cnt;//????????
parameter gen_idle_s         = 2'h0,
	   	    gen_wr_head_s      = 2'h1,
	   	    gen_wr_rdresult_s  = 2'h2;
reg [1:0] pkt_to_gen_state;
always@(posedge clk or negedge reset_n)
begin
	 if(~reset_n)begin
	 	  pkt_length_rdreq   <= 1'b0;
	 	  result_rdreq       <= 1'b0;
	 	  result_head_rdreq  <= 1'b0;
	 	  pkt_to_gen_wr      <= 1'b0;
	 	  length_to_gen_wr   <= 1'b0;
	 	  pkt_to_gen_state   <= gen_idle_s;
	 	end
	 else begin
	 	 case(pkt_to_gen_state)
	 	    gen_idle_s:begin
	 	    	  pkt_length_rdreq   <= 1'b0;
	 	        result_rdreq       <= 1'b0;
	 	        result_head_rdreq  <= 1'b0;
	 	        pkt_to_gen_wr      <= 1'b0;
	 	        length_to_gen_wr   <= 1'b0;
	 	        if((!pkt_length_empty)&(!pkt_to_gen_afull)&(!length_to_gen_afull))
    	              begin
    	        	       length_to_gen      <= pkt_length_rdata;
    	        	       result_cnt0        <= pkt_length_rdata[32:24];
    	        	       result_head_rdreq  <= 1'b1;//?????
    	        	       pkt_length_rdreq   <= 1'b1; //??????
    	        	       first_head_flag    <= 1'b1;
    	        	       pkt_to_gen_state   <= gen_wr_head_s;  	        	       
    	              end
    	      else
    	                begin 	   	              
    	   	              result_head_rdreq  <= 1'b0;
    	        	        pkt_length_rdreq   <= 1'b0; 
    	   	              pkt_to_gen_state   <= gen_idle_s;
    	                end
	 	    	end 
	 	   gen_wr_head_s:begin
	 	   	  pkt_length_rdreq   <= 1'b0;
	 	   	  result_head_rdreq  <= 1'b0;
	 	   	  pkt_to_gen[33:0]   <= result_head_rdata;
	 	   	  pkt_to_gen_wr      <= 1'b1;
	 	   	  if(result_cnt0==9'h001)begin//??????
    	        	result_head_rdreq <= 1'b0;
    	        	//?????FIFO
    	        	length_to_gen_wr  <= 1'b1;//?????FIFO
    	        if(first_head_flag) 
    	        	 pkt_to_gen[36:34]<= 3'b100;
    	        else
    	        	 pkt_to_gen[36:34]<= 3'b010;
    	        	 pkt_to_gen_state <= gen_idle_s;
    	      end 
    	    else begin////??????
    	    	   result_cnt0    <= result_cnt0 - 1'b1;
    	        if(first_head_flag)
    	        	 begin
    	        	   first_head_flag   <= 1'b0;
    	        	   pkt_to_gen[36:34] <= 3'b001;
    	        	 end
    	        else
    	        	 begin
    	        	   pkt_to_gen[36:34] <= 3'b011;
    	        	 end
    	        case(result_head_rdata[27:24])
    	           4'h1,4'h2,4'h6:begin//???????????????
    	           	   result_head_rdreq  <= 1'b1;//??????????
    	        	     pkt_to_gen_state   <= gen_wr_head_s; 
    	           	end
    	           4'h5:begin//???
    	           	   if(result_head_rdata[23:8]==16'h0)begin//???
    	           	   	  result_head_rdreq  <= 1'b1;//??????????
    	        	        pkt_to_gen_state   <= gen_wr_head_s; 
    	           	    end
    	           	   else begin//??????
    	           	   	  result_head_rdreq  <= 1'b0;
    	        	        rd_result_cnt      <= result_head_rdata[23:8];
    	        	        result_rdreq       <= 1'b1;
    	        	        pkt_to_gen_state   <= gen_wr_rdresult_s; 
    	           	   	end
    	           	end
    	           default:begin
    	           	   result_rdreq       <= 1'b1;
    	           	   pkt_to_gen_state   <= gen_idle_s; 
    	           	end
    	        endcase
    	    	end    
	 	   	end
	 	   gen_wr_rdresult_s:begin
    	        	    pkt_to_gen[33:0]  <= result_rdata[33:0];
    	        	    if(rd_result_cnt==16'h01)//?????????
    	        	       begin
    	        	       	  result_rdreq <= 1'b0;
    	        	       	  if(result_cnt0==9'h001)
    	        	       	    begin
    	        	       	      result_head_rdreq  <= 1'b0;
    	        	          	//?????FIFO
    	        	          	  length_to_gen_wr   <= 1'b1; 
    	        	              pkt_to_gen[36:34]  <= 3'b010;
    	        	              pkt_to_gen_state   <= gen_idle_s;
    	        	       	    end
    	        	       	  else
    	        	       	    begin
    	        	       	    	pkt_to_gen[36:34]  <= 3'b011;
    	        	       	    	result_head_rdreq  <= 1'b1;
    	        	              pkt_to_gen_state   <= gen_wr_head_s;   
    	        	       	    end
    	        	       end
    	        	    else
    	        	       begin
    	        	       	 result_rdreq       <= 1'b1;
    	        	         pkt_to_gen[36:34]  <= 3'b011;
    	        	         pkt_to_gen_state   <= gen_wr_rdresult_s; 
    	        	       end
    	        	    result_cnt0       <= result_cnt0 - 1'b1;
    	           	  rd_result_cnt     <= rd_result_cnt - 1'b1;
    	        	    pkt_to_gen_wr     <= 1'b1;
	 	   	      end
	 	   
	 	    default:begin
	 	    	   pkt_length_rdreq   <= 1'b0;
	 	         result_rdreq       <= 1'b0;
	 	         result_head_rdreq  <= 1'b0;
	 	         pkt_to_gen_wr      <= 1'b0;
	 	         length_to_gen_wr   <= 1'b0;
	 	         pkt_to_gen_state   <= gen_idle_s;
	 	    	 end
	 	 endcase
	end
end 
endmodule 