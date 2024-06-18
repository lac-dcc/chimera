// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

/////////////////////////////////////////////////////////////////////////////////
// Company:   NUDT
// Engineer:  
// Create Date:    11/10/2010 
// Module Name:    command_parse 
// Project Name: 
// Tool versions: quartus 9.1
// Description:   1. 计算IP头部校验和
//                2. 合成报文。加入MAC头、IP头。                
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns
module pkt_gen(
       clk,
       reset_n,
       PROXY_MAC,
       PROXY_IP,
       FPGA_MAC,
       FPGA_IP,
       proxy_addr_valid,
       pkt_to_gen, //[36:34] 001:表示数据第一拍  011:表示数据中间拍  010:表示数据最后一拍 100:头尾同拍 [33:32]:有效字节数  [31:0]:报文
       pkt_to_gen_wr,
       pkt_to_gen_afull,
       length_to_gen,//[32:24]:命令的总拍数 [23:16]:count  [15:0]序列号
       length_to_gen_wr,
       length_to_gen_afull,   
       //FPGA返回给管理接口的报文;
      // ack_fifo_wrclk,
       ack_pkt,   //[35:34]01:表示数据第一拍  11:表示数据中间拍  10:表示数据最后一拍  [33:32]:有效字节数  [31:0]:报文
       ack_wr,
       ack_afull, 
       //FPGA返回给管理接口的报文有效标志位;这个FIFO非空表示报文FIFO中至少有一个完整的报文了
       ack_valid_wr,
       ack_valid_afull
       );
input        clk;
input        reset_n;
input [47:0] PROXY_MAC;
input [31:0] PROXY_IP;
input [47:0] FPGA_MAC;
input [31:0] FPGA_IP;
input        proxy_addr_valid;
input [36:0] pkt_to_gen;//[36:34] 001:表示数据第一拍  011:表示数据中间拍  010:表示数据最后一拍 100:头尾同拍 [33:32]:有效字节数  [31:0]:报文
input        pkt_to_gen_wr;
output       pkt_to_gen_afull;
input [32:0] length_to_gen;//[32:24]:命令的总拍数 [23:16]:count  [15:0]序列号
input        length_to_gen_wr;
output       length_to_gen_afull;
//FPGA返回给管理接口的报文;
//output       ack_fifo_wrclk;
output[35:0] ack_pkt;   //[35:34] 01:表示数据第一拍  11:表示数据中间拍  10:表示数据最后一拍 [33:32]:有效字节数  [31:0]:报文
output       ack_wr;
input        ack_afull;
//FPGA返回给管理接口的报文有效标志位;这个FIFO非空表示报文FIFO中至少有一个完整的报文了
output       ack_valid_wr;
input        ack_valid_afull;

wire          pkt_to_gen_afull;
wire          length_to_gen_afull;
//FPGA返回给管理接口的报文;
//wire          ack_fifo_wrclk;
reg [35:0]   ack_pkt;   //[35:34] 01:表示数据第一拍  11:表示数据中间拍  10:表示数据最后一拍 [33:32]:有效字节数  [31:0]:报文
reg          ack_wr;
//FPGA返回给管理接口的报文有效标志位;这个FIFO非空表示报文FIFO中至少有一个完整的报文了
reg          ack_valid_wr;
//assign ack_fifo_wrclk = clk;

reg  length_to_gen_rdreq;
reg  pkt_to_gen_rdreq;
reg  ack_afull_reg;
reg  ack_valid_afull_reg;
reg [15:0]sequence_number;
reg [7:0] count;
reg [3:0]pad_data_counter;
reg      crc_check_end;

reg crc_result_req;
reg crc_gen_status;

reg [31:0] crc_source_data,crc_checksum_data,check_sum_data;
wire [31:0] crc_result_data;  
reg [1:0] data_empty;
reg source_data_valid,source_data_sop,source_data_eop,crc_result_valid;
wire crc_valid;

wire[9:0] wrusedw_pkt_gen;
wire [36:0]pkt_to_gen_rdata; 
wire       pkt_to_gen_empty;

wire[8:0] wrusedw_length_gen;
wire[32:0]length_to_gen_rdata;
wire      length_to_gen_empty;

wire ack_fifo_wrpermit;
assign ack_fifo_wrpermit = (~ack_afull_reg) & (~ack_valid_afull_reg);


reg [2:0] checksum_computing_status;
//IP头效验和计算
reg [15:0] packet_number;
reg        ip_head_checksum_ack;
reg        ip_head_checksum_req;
reg [16:0] ip_checksum;
reg [19:0] check_sum;
reg [15:0] packet_length;
reg [15:0]ip_checksum_result;

//IP头效验和计算状态机  
parameter   checksum_idle_s = 3'h0,
            checksum_1_s = 3'h1,
            checksum_2_s = 3'h2,
            checksum_3_s = 3'h3,
            checksum_4_s = 3'h4,
            checksum_5_s = 3'h5,
            checksum_end_s = 3'h6;
always @(posedge clk or negedge reset_n)
if(~reset_n)  begin
  ip_head_checksum_ack <= 1'b0;//IP效验和检查请求和应答，握手信号。
  check_sum <= 20'h0_84fe;//4500 + 4000（rag flag , Frag segment） + fffd（TTL , and protocol） = 184fd  把进位加到最低位 得到84fe
  checksum_computing_status <= checksum_idle_s;
end
else  begin
  case(checksum_computing_status)
    checksum_idle_s:  begin
      ip_head_checksum_ack <= 1'b0;//IP效验和检查请求和应答，握手信号。
      if(proxy_addr_valid) begin
      	check_sum   <= check_sum + FPGA_IP[31:16] + FPGA_IP[15:0]; //源IP地址的高16位 低16位
      	ip_checksum <= PROXY_IP[15:0]+ PROXY_IP[31:16];//目的IP地址低16位 目的IP地址高16位
        checksum_computing_status <= checksum_1_s;
      end
      else begin
        checksum_computing_status <= checksum_idle_s;
      end 
    end       
    checksum_1_s:  begin
    	check_sum <= check_sum + ip_checksum; 
      checksum_computing_status <= checksum_2_s;
    end	
    checksum_2_s:  begin
    	if(|check_sum[19:16] == 1'b1)  begin
    	  check_sum <= check_sum[15:0] + check_sum[19:16];
    	  checksum_computing_status <= checksum_2_s;
    	end
    	else
    	  checksum_computing_status <= checksum_3_s;
    end	
    checksum_3_s:  begin
    	if(ip_head_checksum_req == 1'b1)  begin
    	  ip_checksum <= check_sum[15:0] + packet_number;
        checksum_computing_status <= checksum_4_s;
      end
      else
        checksum_computing_status <= checksum_3_s;
    end	
    checksum_4_s:  begin
    	ip_checksum <= ip_checksum[15:0] + packet_length + ip_checksum[16];
      checksum_computing_status <= checksum_5_s;
    end	
    checksum_5_s:  begin
    	if(ip_checksum[16] == 1'b1)  begin
    	  ip_checksum <= ip_checksum[15:0] + ip_checksum[16];
    	  checksum_computing_status <= checksum_5_s;
    	end
    	else  begin
    	  checksum_computing_status <= checksum_end_s;
    	  ip_head_checksum_ack <= 1'b1;
    	  ip_checksum_result <= ~ip_checksum[15:0];
    	end
    end	
    checksum_end_s:  begin
      if(ip_head_checksum_req)  begin
        ip_head_checksum_ack <= 1'b1;
        checksum_computing_status <= checksum_end_s;
      end
      else begin
        ip_head_checksum_ack <= 1'b0;
        check_sum <= 20'h0_84fe;
        checksum_computing_status <= checksum_idle_s;
      end
    end
    default  :  begin
      ip_head_checksum_ack <= 1'b0;
      checksum_computing_status <= checksum_idle_s;
    end
  endcase
end
parameter    idle_s      = 4'h0,
             wr0_s       = 4'h1,
             wr1_s       = 4'h2,
             wr2_s       = 4'h3,
             wr3_s       = 4'h4,
             wr4_s       = 4'h5,
             wr5_s       = 4'h6,
             wr6_s       = 4'h7,
             wr7_s       = 4'h8,
             wr8_s       = 4'h9,
             wr9_s       = 4'ha,
             wr10_s      = 4'hb,
             wr11_s      = 4'hc,
             add_pad_s   = 4'hd,
             wait_crc_s  = 4'he;         
reg [3:0]gen_pkt_state;
always@(posedge clk or negedge reset_n)
begin
    if(!reset_n)
     	begin
     	  ack_wr                 <= 1'b0;
     	  ack_valid_wr           <= 1'b0;
     	  length_to_gen_rdreq    <= 1'b0;
     	  pkt_to_gen_rdreq       <= 1'b0;
     	  packet_number          <= 16'h0;
        gen_pkt_state          <= idle_s;
     	 end
     else begin
        ack_afull_reg       <= ack_afull;
        ack_valid_afull_reg <= ack_valid_afull;
     	    case(gen_pkt_state)     
     	     idle_s:
     	       begin
                 ack_wr              <= 1'b0;
     	           ack_valid_wr        <= 1'b0;
     	           length_to_gen_rdreq <= 1'b0;
     	           pkt_to_gen_rdreq    <= 1'b0;
     	           pad_data_counter    <= 4'h0;
   		          if(ack_fifo_wrpermit&(!pkt_to_gen_empty)&(!length_to_gen_empty))
   		              begin
     	                length_to_gen_rdreq   <= 1'b1;
     	                ip_head_checksum_req  <= 1'b1;
     	                packet_number         <= packet_number + 1'b1;
     	                packet_length         <= {length_to_gen_rdata[32:24],2'b0} + 16'h1a;//命令总拍数乘以4 加上20字节的IP头 加上命令数 序列号 6字节
     	                count                 <= length_to_gen_rdata[23:16];
     	                sequence_number       <= length_to_gen_rdata[15:0];
     	                gen_pkt_state         <= wr0_s;
     	              end
     	            else
     	              begin
     	                 pkt_to_gen_rdreq     <= 1'b0;
     	                 length_to_gen_rdreq  <= 1'b0;
     	                 gen_pkt_state        <= idle_s;
     	              end
     	       end    	     
     	     wr0_s:begin//目的MAC
     	              length_to_gen_rdreq   <= 1'b0;
     	       	      ack_pkt       <= {4'h4,PROXY_MAC[47:16]};
     	       	      ack_wr        <= 1'b1;    	       	      	       
     	       	      gen_pkt_state <= wr1_s;        
     	           end           	       
     	    wr1_s: begin
     	       	 ack_pkt       <= {4'hc,PROXY_MAC[15:0],FPGA_MAC[47:32]};
     	       	 ack_wr        <= 1'b1;
     	       	 gen_pkt_state <= wr2_s; 
     	       end  
     	   wr2_s:begin//源MAC
     	       	  ack_pkt       <= {4'hc,FPGA_MAC[31:0]};
     	       	  ack_wr        <= 1'b1;
     	       	  gen_pkt_state <= wr3_s; 
     	       end     
     	   wr3_s:begin//0800 4500
     	      	  ack_pkt       <= {4'hc,32'h0800_4500};
     	      	  ack_wr        <= 1'b1;
     	      	  gen_pkt_state <= wr4_s; 
     	      end
     	   wr4_s:begin//总长度、标识
     	      	 ack_pkt        <= {4'hc,packet_length,packet_number};
     	      	 ack_wr         <= 1'b1;
     	      	 gen_pkt_state  <= wr5_s; 
     	      end
     	   wr5_s:begin//标记 片段偏移 生存期 协议 4000 fffd 
     	   	     ack_pkt        <= {4'hc,32'h4000_fffd};
     	      	 ack_wr         <= 1'b1;
     	      	 gen_pkt_state  <= wr6_s; 
     	      end
     	   wr6_s:begin//IP头校验和、源IP高16位
     	   	     if(ip_head_checksum_ack)begin
     	   	     	 ack_pkt      <= {4'hc,ip_checksum_result,FPGA_IP[31:16]};
     	   	     	 ack_wr       <= 1'b1;
     	   	     	 ip_head_checksum_req <= 1'b0;
     	   	     	 gen_pkt_state <= wr7_s; 
     	   	     	end
     	   	     else begin
     	   	     	 ack_wr        <= 1'b0;
     	   	     	 gen_pkt_state <= wr6_s; 
     	   	     	end
     	   	  end	
     	   wr7_s:begin
     	   	     ack_pkt       <= {4'hc,FPGA_IP[15:0],PROXY_IP[31:16]};
     	   	     ack_wr        <= 1'b1;
     	   	     gen_pkt_state <= wr8_s;
     	   	  end
     	   wr8_s:begin 
     	   	     ack_pkt       <= {4'hc,PROXY_IP[15:0],count,8'b0};
     	   	     ack_wr        <= 1'b1;
     	   	     gen_pkt_state <= wr9_s; 
     	   	  end	
     	   wr9_s:begin
     	   	     ack_pkt       <= {4'hc,sequence_number,16'b0};
     	   	     ack_wr        <= 1'b1;
     	   	     pkt_to_gen_rdreq <= 1'b1;
     	   	     gen_pkt_state <= wr10_s; 
     	   	  end
   		   wr10_s:begin 
             if(pkt_to_gen_rdata[36:34]==3'b100)
   		    	   begin
   		    	      pkt_to_gen_rdreq <= 1'b0;
   		    	   	  ack_pkt          <= {2'h3,pkt_to_gen_rdata[33:0]};
   		    	   	  pad_data_counter <= 1'h1 + pad_data_counter;
   		    	      ack_wr           <= 1'b1;
   		    	      gen_pkt_state    <= add_pad_s;
   		    	   end
   		    	else //if(pkt_to_gen_rdata[36:34]==3'b001)
   		    	   begin
   		    	     ack_pkt           <= {2'h3,pkt_to_gen_rdata[33:0]};
   		    	     ack_wr            <= 1'b1;  		    	     
   		    	     pad_data_counter  <= 1'h1 + pad_data_counter;
   		    	     pkt_to_gen_rdreq  <= 1'b1;
   		    	     gen_pkt_state     <= wr11_s;
   		    	   end
   		    end  
     	wr11_s:
     	     begin
     	     	 if(pkt_to_gen_rdata[36:34]==3'b010)
     	     	   begin
     	     	   	    ack_pkt          <= {2'h3,pkt_to_gen_rdata[33:0]};
     	     	        pad_data_counter <= 1'h1 + pad_data_counter;
   		    	        ack_wr           <= 1'b1;
   		    	        pkt_to_gen_rdreq <= 1'b0;
     	     	   	 if(pad_data_counter>=4'h4)
     	     	   	   begin 
   		    	        crc_check_end     <= 1'b1;
   		    	        gen_pkt_state     <= wait_crc_s;
   		    	       end
   		    	     else
   		    	       begin
   		    	        pkt_to_gen_rdreq <= 1'b0;
   		    	        gen_pkt_state    <= add_pad_s;
   		    	       end
   		    	   end
     	     	else
     	     	   begin
     	     	   	 ack_pkt             <= {2'h3,pkt_to_gen_rdata[33:0]};
     	     	   	 pad_data_counter    <= 1'h1 + pad_data_counter;
   		    	     ack_wr              <= 1'b1; 
   		    	     pkt_to_gen_rdreq    <= 1'b1;
   		    	     gen_pkt_state       <= wr11_s;
     	     	   end
     	     end     	     
     	 add_pad_s:begin
     	      	  pkt_to_gen_rdreq     <= 1'b0;
                pad_data_counter     <= 1'h1 + pad_data_counter;
    	          ack_pkt[35:0]        <= 36'hc_0000_0000; 
    	          ack_wr               <= 1'b1; //应该是四个字节全有效
                if(pad_data_counter == 4'h4)  
                    begin  //补充6拍数据，到64字节！
                     gen_pkt_state     <= wait_crc_s;
                     crc_check_end     <= 1'b1;
                    end
               else 
                   begin
                     crc_check_end     <= 1'b0;
                     gen_pkt_state     <= add_pad_s;
                  end
            end 
     	 wait_crc_s: begin
     	  	   pkt_to_gen_rdreq <= 1'b0;
             crc_check_end    <= 1'b0;
          if(crc_result_req == 1'b1)  
            begin
    	        ack_pkt <= {4'h8,check_sum_data[7:0],check_sum_data[15:8],check_sum_data[23:16],check_sum_data[31:24]}; 
    	        ack_wr <= 1'b1;
   		      	ack_valid_wr  <= 1'b1;
   		    	  gen_pkt_state <= idle_s;
    	      end
    	    else  
    	      begin
    	        ack_wr         <= 1'b0;
    	  	    gen_pkt_state  <= wait_crc_s;
    	      end
        end
      default:begin
      	  ack_wr                 <= 1'b0;
     	    ack_valid_wr           <= 1'b0;
     	    length_to_gen_rdreq    <= 1'b0;
     	    pkt_to_gen_rdreq       <= 1'b0;
     	    packet_number          <= 16'h0;
          gen_pkt_state          <= idle_s;
      	end
     endcase
    end
  end

parameter crc_gen_ip_packet = 1'b0,
          crc_gen_wait_result = 1'b1;
          
always @(posedge clk or negedge reset_n)           
if(!reset_n )  begin
  source_data_valid <= 1'b0;
  source_data_sop <= 1'b0;
  source_data_eop <= 1'b0;
  crc_result_valid <= 1'b0;
  data_empty <= 2'h0;
  crc_result_req <= 1'b0;
  crc_gen_status <= crc_gen_ip_packet;
end
else begin
  crc_result_valid <= crc_valid;
  crc_checksum_data <= crc_result_data;
	case(crc_gen_status)
	  crc_gen_ip_packet:  
	     begin
	         crc_result_req  <= 1'b0;
	  	      case({crc_check_end,ack_wr,ack_pkt[35:34]})
	  	         4'b0101:  
	  	             begin
                      source_data_valid <= 1'b1;
                      source_data_sop   <= 1'b1;
                      crc_source_data   <= ack_pkt[31:0];
                      crc_gen_status    <= crc_gen_ip_packet;
	  	             end
	  	         4'b0111: 
	  	             begin
                      source_data_valid <= 1'b1;
                      source_data_sop   <= 1'b0;
                      crc_source_data   <= ack_pkt[31:0];
                      crc_gen_status    <= crc_gen_ip_packet;
	  	             end
	  	         4'b1111: 
	  	             begin
                      source_data_valid <= 1'b1;
                      source_data_sop   <= 1'b0;
                      crc_source_data   <= ack_pkt[31:0];
                      crc_gen_status    <= crc_gen_wait_result;
                      source_data_eop   <= 1'b1;
                      data_empty        <= 2'b0;
	  	            end
	  	         4'b1110: 
	  	             begin
                      source_data_valid <= 1'b1;
                      source_data_sop   <= 1'b0;
                      crc_source_data   <= ack_pkt[31:0];
                      crc_gen_status    <= crc_gen_wait_result;
                      source_data_eop   <= 1'b1;
                      data_empty        <= 2'b0;
	  	            end
	  	        default:
	  	            begin
                     source_data_valid  <= 1'b0;
                     crc_gen_status     <= crc_gen_ip_packet;
	  	             end
	  	        endcase 
	         end
	         
	  crc_gen_wait_result:  
	    begin
         source_data_valid <= 1'b0;
         source_data_eop   <= 1'b0;
         data_empty        <= 2'h0;
      if(crc_result_valid == 1'b1) 
         begin
      	   crc_result_req  <= 1'b1;
      	   check_sum_data  <= crc_checksum_data;
           crc_gen_status  <= crc_gen_ip_packet; //CRC生成结束
         end
      else  
        begin
      	   crc_result_req  <= 1'b0;
      	   crc_gen_status  <= crc_gen_wait_result;
        end
	  end
	  default: 
	    begin
        data_empty        <= 2'h0;
        source_data_valid <= 1'b0;
        source_data_sop   <= 1'b0;
        source_data_eop   <= 1'b0;
        crc_result_valid  <= 1'b0;
        data_empty        <= 2'h0;
        crc_gen_status    <= crc_gen_ip_packet;
	   end
	endcase
end

crc32_gen  My_CRC32_GEN(
	.clk(clk),
	.data(crc_source_data),
	.datavalid(source_data_valid),
	.empty(data_empty),
	.endofpacket(source_data_eop),
	.reset_n(reset_n),
	.startofpacket(source_data_sop),
	.checksum(crc_result_data),
	.crcvalid(crc_valid)
	);

//FIFO实例化/////////

  pkt_gen_fifo pkt_gen_fifo(
	.aclr(!reset_n),
	.data(pkt_to_gen),
	.clock(clk),
	.rdreq(pkt_to_gen_rdreq),
	.wrreq(pkt_to_gen_wr),
	.q(pkt_to_gen_rdata),
	.empty(pkt_to_gen_empty),
	.usedw(wrusedw_pkt_gen));
assign pkt_to_gen_afull = (wrusedw_pkt_gen > 10'd650)?1'b1:1'b0;


  length_gen_fifo length_gen_fifo(
	.aclr(!reset_n),
	.data(length_to_gen),
	.clock(clk),
	.rdreq(length_to_gen_rdreq),
	.wrreq(length_to_gen_wr),
	.q(length_to_gen_rdata),
	.empty(length_to_gen_empty),
	.usedw(wrusedw_length_gen));
assign length_to_gen_afull = (wrusedw_length_gen > 9'd510)?1'b1:1'b0;
endmodule