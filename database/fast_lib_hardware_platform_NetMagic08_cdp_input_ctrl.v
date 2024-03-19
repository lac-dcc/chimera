//input control module;
//by jzc 20101022;
`timescale 1ns/1ns
module input_ctrl(
    clk,
    reset,
    
    crc_check_wrreq,//data fifo;
    crc_check_data,
    crc_usedw,
    crc_result_wrreq,//crc check fifo;
    crc_result,
    
    um2cdp_tx_enable,//to user module;
    cdp2um_data_valid,
    cdp2um_data,
    
    input2output_wrreq,//to output control module;
    input2output_data,
    input2output_usedw,
	  
	 um2cdp_path
  );
    input clk;
    input reset;
    
    input crc_check_wrreq;
    input [138:0]crc_check_data;
    output [7:0]crc_usedw;
    input crc_result_wrreq;
    input crc_result;
    
    input um2cdp_tx_enable;
    output cdp2um_data_valid;
    output [138:0]cdp2um_data;
    
    output input2output_wrreq;
    output [138:0]input2output_data;
    input [7:0]input2output_usedw;
	 
	 input um2cdp_path;		//added by mxl_ccz_lq_0423 to define the direction of packets(to CDP itself or to UM);
    
    wire [7:0]crc_usedw;
    reg cdp2um_data_valid;
    reg [138:0]cdp2um_data;
    
    reg input2output_wrreq;
    reg [138:0]input2output_data;
    reg [138:0]data_reg;//storage the data,judge the last 4 byte,discard the crc;
    
    reg level2_fifo_rdreq;
    wire [138:0]level2_fifo_q;
    reg flag_fifo_rdreq;
    wire flag_fifo_q;
    wire flag_fifo_empty;
    
    reg [1:0]current_state;
    parameter idle=2'b0,
              transmit=2'b01,
              discard=2'b10,
              over_4byte=2'b11;
always@(posedge clk or negedge reset)
    if(!reset)
      begin
          level2_fifo_rdreq<=1'b0;
          flag_fifo_rdreq<=1'b0;
          cdp2um_data_valid<=1'b0;
          
          current_state<=idle;
      end
    else
      begin
          case(current_state)
              idle:
                  begin
                      flag_fifo_rdreq<=1'b0;
                      level2_fifo_rdreq<=1'b0;
                      cdp2um_data_valid<=1'b0;
                      input2output_wrreq<=1'b0;
                      if(um2cdp_tx_enable)//user module needs data;
                        begin
                            if((um2cdp_path == 1'b1 && input2output_usedw<8'd161) || um2cdp_path == 1'b0)//input_output_fifo can storage a full pkt or the packets are sent to UM;
                              begin
                                  if(!flag_fifo_empty)//flag fifo is not empty;
                                    begin
                                        if(flag_fifo_q==1'b1)//the data is valid;
                                          begin
                                              flag_fifo_rdreq<=1'b1;
                                              level2_fifo_rdreq<=1'b1;
                                              //cdp2um_data_valid<=1'b1;
                                              //cdp2um_data<=level2_fifo_q;
                                              //input2output_wrreq<=1'b1;
                                              //input2output_data<=level2_fifo_q;
                                              
                                              current_state<=transmit;
                                          end
                                        else//the data is invalid,so discard;
                                          begin
                                              flag_fifo_rdreq<=1'b1;
                                              level2_fifo_rdreq<=1'b1;
                                              
                                              current_state<=discard;
                                          end
                                    end
                                  else
                                    begin
                                        current_state<=idle;
                                    end
                              end
                            else//can't storage a full pkt;
                              begin
                                  current_state<=idle;
                              end
                        end
                      else//
                        begin
                            current_state<=idle;
                        end
                  end//end idle;
              transmit:
                  begin
                      flag_fifo_rdreq<=1'b0;
                      level2_fifo_rdreq<=1'b0;
                      cdp2um_data_valid<=1'b0;
                      input2output_wrreq<=1'b0;
                      data_reg<=level2_fifo_q;
                      if(level2_fifo_q[138:136]==3'b101)//header;
                        begin
                            level2_fifo_rdreq<=1'b1;
                            cdp2um_data_valid<=1'b0;
                            cdp2um_data<=data_reg;
                            input2output_wrreq<=1'b0;
                            input2output_data<=data_reg;
                                   
                            current_state<=transmit;
                        end
                      else if(level2_fifo_q[138:136]==3'b110)//tail;
                        begin
                            level2_fifo_rdreq<=1'b0;
                            if(level2_fifo_q[135:132]>4'b0011)//the last word have >4bytes valid data;
                              begin
                                  cdp2um_data_valid<=1'b1;
                                  cdp2um_data<=data_reg;
                                  input2output_wrreq<=1'b1;
                                  input2output_data<=data_reg;
                                  current_state<=over_4byte;
                              end
                            else if(level2_fifo_q[135:132]==4'b0011)
                              begin
                                   cdp2um_data_valid<=1'b1;
                                   cdp2um_data<=data_reg;
                                   cdp2um_data[138:136]<=3'b110;
                                   cdp2um_data[135:132]<=4'b1111;
                                   input2output_wrreq<=1'b1;
                                   input2output_data<=data_reg;
                                   input2output_data[138:136]<=3'b110;
                                   input2output_data[135:132]<=4'b1111;
                                   
                                   current_state<=idle;
                               end
                             else
                               begin
                                   cdp2um_data_valid<=1'b1;
                                   cdp2um_data<=data_reg;
                                   cdp2um_data[138:136]<=3'b110;
                                   cdp2um_data[135:132]<=4'b1111-(4'b0011-level2_fifo_q[135:132]);
                                   input2output_wrreq<=1'b1;
                                   input2output_data<=data_reg;
                                   input2output_data[138:136]<=3'b110;
                                   input2output_data[135:132]<=4'b1111-(4'b0011-level2_fifo_q[135:132]);
                                   current_state<=idle;
                               end
                        end
                      else//middle;
                        begin
                            level2_fifo_rdreq<=1'b1;
                            cdp2um_data_valid<=1'b1;
                            cdp2um_data<=data_reg;
                            input2output_wrreq<=1'b1;
                            input2output_data<=data_reg;
                            
                            current_state<=transmit;
                        end
                  end//end transmit;
              discard:
                  begin
                      flag_fifo_rdreq<=1'b0;
                      level2_fifo_rdreq<=1'b0;
                      if(level2_fifo_q[138:136]==3'b110)//tail;
                        begin
                            //level2_fifo_rdreq<=1'b1;
                            current_state<=idle;
                        end
                      else//middle;
                        begin
                            level2_fifo_rdreq<=1'b1;
                            current_state<=discard;
                        end
                  end
              over_4byte:
                  begin
                      cdp2um_data_valid<=1'b1;
                      cdp2um_data<=data_reg;
                      cdp2um_data[135:132]<=data_reg[135:132]-4'b0100;
                      input2output_wrreq<=1'b1;
                      input2output_data<=data_reg;
                      input2output_data[135:132]<=data_reg[135:132]-4'b0100;
                      current_state<=idle;
                  end
              default:
                  begin
                      current_state<=idle;
                  end    
          endcase//endcase;
      end


level2_256_139 level2_256_139(//level2 data fifo;
	.aclr(!reset),
	.clock(clk),
	.data(crc_check_data),
	.rdreq(level2_fifo_rdreq),
	.wrreq(crc_check_wrreq),
	.q(level2_fifo_q),
	.usedw(crc_usedw)
  );

rx_64_1 rx_64_1(//crc check result fifo;
	.aclr(!reset),
	.clock(clk),
	.data(crc_result),
	.rdreq(flag_fifo_rdreq),
	.wrreq(crc_result_wrreq),
	.empty(flag_fifo_empty),
	.q(flag_fifo_q)
   );

endmodule
