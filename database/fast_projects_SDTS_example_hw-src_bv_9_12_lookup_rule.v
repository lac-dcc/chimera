`timescale 1ns/1ps
/*
ACTION[15:0] [15] encap LISP head pkt [15]disencap lisp head pk t[13]replce MAC ADDR [12]transmit port number   [11:8]resv [7:0]output port number
*/

module lookup_rule(
clk,
reset,
bv_valid_1,
bv_1,
bv_valid_2,
bv_2,
bv_valid_3,
bv_3,
bv_valid_4,
bv_4,
action_valid,
action,
action_data_valid,
action_data,

localbus_cs_n,
localbus_rd_wr,
localbus_data,
localbus_ale,
localbus_ack_n,
localbus_data_out


);

input             clk;
input             reset;
input             bv_valid_1;
input [35:0]      bv_1;
input             bv_valid_2;
input [35:0]      bv_2;
input             bv_valid_3;
input [35:0]      bv_3;
input             bv_valid_4;
input [35:0]      bv_4;

output            action_valid;
output[15:0]      action;
output            action_data_valid;
output[351:0]     action_data;//rloc_src,rloc_dst,mac_dst,mac_src;

input             localbus_cs_n;
input             localbus_rd_wr;
input [31:0]      localbus_data;
input             localbus_ale;
output            localbus_ack_n;
output  [31:0]    localbus_data_out;


reg         action_valid;
reg [15:0]  action;
reg         action_data_valid;
reg [351:0] action_data;
reg localbus_ack_n;
reg [31:0]  localbus_data_out;
//--reg--//
reg [31:0]  localbus_addr;
reg [35:0] bv;
reg [17:0] bv_18;
reg [8:0] bv_9;
reg [4:0] bv_5;
//--------ram-----------//
//---rule_ram---//
reg   [5:0] address_a,address_b;
reg   wren_b;
reg   rden_a,rden_b;
reg   [31:0]  data_b;
wire  [31:0]  q_a,q_b;

//---xtr_info_ram---//
reg [5:0] xtr_info_addr_a;
reg [5:0] xtr_info_addr_b;
reg xtr_info_wren_b;
reg xtr_info_rden_a;
reg xtr_info_rden_b;
reg   [351:0]  xtr_info_data_b;
wire  [351:0]  xtr_info_q_a;
wire  [351:0]  xtr_info_q_b;

reg [351:0] xtr_info_action_data;

//----------state------//
reg [3:0] set_state;

reg flag;

reg hold1clk_in_1;
wire  hold1clk_out_1,hold1clk_out_2,hold1clk_out_3,hold1clk_out_4,hold1clk_out_5,
      hold1clk_out_6,hold1clk_out_7,hold1clk_out_8,hold1clk_out_9;
reg[6:0] addr1,addr2,addr3;

reg [15:0]  action_1_r,action_2_r,action_3_r;//pipeline:deliver_action;
reg [5:0] index;

parameter     idle            = 4'd0,
              ram_set_action  = 4'd1,
              read_ram_action = 4'd2,
              wait_1_action   = 4'd3,
              wait_2_action   = 4'd4,
              ram_read_action = 4'd5,
              ram_set_action_data  = 4'd6,
              ram_read_action_data = 4'd7,
              wait_1_action_data   = 4'd8,
              wait_2_action_data   = 4'd9,
              read_ram_action_data = 4'd10,
              wait_back       = 4'd11;
              
//---------------------------state-------------------//
//--------------bv_&----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    flag <= 1'b0;
      end
    else
      begin
          if(bv_valid_1 == 1'b1)
            begin
                flag <= 1'b1;
                bv <= bv_1 & bv_2 & bv_3 &bv_4;
            end
          else  flag <= 1'b0;
      end
end
//--------------stage_1_bv_18----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    hold1clk_in_1 <= 1'b0;
			    addr1 <= 7'b0;
      end
    else
      begin
          if(flag == 1'b1)
            begin
                hold1clk_in_1 <= 1'b1;
                if((bv[35]==1'b1) && (bv[34:0] != 35'b0))
                  begin
                      if(bv[34:17] == 18'b0)
                      begin
                          bv_18 <= bv[17:0];
                          addr1 <= {1'b1,6'd17};
                      end
                      else  
                      begin
                          bv_18 <= bv[34:17];
                          addr1 <= {1'b1,6'b0};
                      end
                  end
                else
                  begin
                      bv_18 <= 18'b0;
                      addr1 <= 7'b0;
                  end
                
            end
          else
            begin
              hold1clk_in_1 <= 1'b0;
            end
      end
end
//--------------stage_2_bv_9----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    addr2 <=7'b0;
				bv_9 <= 9'b0;
      end
    else
      begin
          if(hold1clk_out_1 == 1'b1)
            begin
                if(addr1[6]==1'b1)
                  if(bv_18[17:9]== 9'b0)
                    begin
                        bv_9 <= bv_18[8:0];
                        addr2 <= addr1 + 7'd9;
                    end
                  else
                  begin
                      bv_9 <= bv_18[17:9];
                      addr2 <= addr1;
                  end
                else  addr2 <= 7'b0;
            end
      end
end
//--------------stage_3_bv_5----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    addr3 <= 7'b0;
				bv_5 <= 5'b0;
      end
    else
      begin
          if(hold1clk_out_2 == 1'b1)
            begin
                if(addr2[6]==1'b1)
                  if(bv_9[8:4]== 5'b0)
                  begin
                      bv_5 <= bv_9[4:0];
                      addr3 <= addr2 + 7'd4;
                  end
                  else
                  begin
                      bv_5 <= bv_9[8:4];
                      addr3 <= addr2;
                  end
                else  addr3 <= 7'b0;
            end
      end
end
//--------------stage_4_read_rule----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    rden_a <= 1'b0;
      end
    else
      begin
          if(hold1clk_out_3 == 1'b1)
            begin
                rden_a <= 1'b1;
                if(addr3[6]==1'b0)  address_a <= 6'b0;
                else
                  begin
                      if(bv_5[4])  address_a <= addr3[5:0] + 6'd1;
                      else if(bv_5[3])  address_a <= addr3[5:0] + 6'd2;
                      else if(bv_5[2])  address_a <= addr3[5:0] + 6'd3;
                      else if(bv_5[1])  address_a <= addr3[5:0] + 6'd4;
                      else if(bv_5[0])  address_a <= addr3[5:0] + 6'd5;
                      else address_a <= 6'b0;   
                  end
            end
          else rden_a <= 1'b0;
      end
end
//--------------lookup_rule_output----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    action_valid <= 1'b0;
				action <= 16'b0;
      end
    else
      begin
          if(hold1clk_out_6 == 1'b1)
            begin
                action_valid <= 1'b1;
                action <= q_a[15:0];
                index <= q_a[21:16];
            end
          else  action_valid <= 1'b0;
      end
end
//-----------read_action_data_ram----------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    action_1_r <= 16'b0;
      end
    else
      begin
          if(action_valid == 1'b1)
            begin
                action_1_r <= action;
                xtr_info_addr_a <= index;
                xtr_info_rden_a <= 1'b1;
            end
          else
            begin
                xtr_info_rden_a <= 1'b0;
            end
      end
end
//---action_deliver_2----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    action_2_r <= 16'b0;
      end
    else
      begin
          action_2_r <= action_1_r;
      end
end
//---action_deliver_3----//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    action_3_r <= 16'b0;
      end
    else
      begin
          action_3_r <= action_2_r;
      end
end
          
//------------action_data-----------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    action_data_valid <= 1'b0;
			    action_data <= 352'b0;
      end
    else
      begin
          if(hold1clk_out_9 == 1'b1)
            begin
                action_data_valid <= 1'b1;
                action_data <= xtr_info_q_a;              
            end
          else
            begin
              action_data_valid <= 1'b0;
            end
      end
end


//-------set_state-------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    set_state <= idle;
			    wren_b <= 1'b0;
			    rden_b <= 1'b0;
			    xtr_info_wren_b <= 1'b0;
			    xtr_info_rden_b <= 1'b0;
			    xtr_info_data_b <= 352'b0;
			    xtr_info_action_data <= 352'b0;
			    localbus_data_out <= 32'b0;
			    localbus_ack_n <= 1'b1;
				localbus_addr <= 32'b0;
				data_b <= 32'b0;
				xtr_info_addr_b <= 6'b0;
				address_b <= 6'b0;
      end
    else
      begin
          case(set_state)
            idle:
            begin
                if(localbus_ale == 1'b1)
                  begin
                      localbus_addr <= localbus_data;
                      if(localbus_data[12] == 1'b0)
                        begin
                          if(localbus_rd_wr == 1'b0)
                            begin
                                set_state <= ram_set_action;
                            end
                          else
                            begin
                                set_state <= ram_read_action;
                            end
                        end
                      else
                        begin
                          if(localbus_rd_wr == 1'b0)
                            begin
                                set_state <= ram_set_action_data;
                            end
                          else
                            begin
                                set_state <= ram_read_action_data;
                            end
                        end
                  end
                else  set_state <= idle;
            end
            ram_set_action:
            begin
                if(localbus_cs_n == 1'b0)
                  begin
                      wren_b <= 1'b1;
                      address_b <= localbus_addr[5:0];
                      data_b <= localbus_data;
                      
                      localbus_ack_n <= 1'b0;
                      set_state <= wait_back;
                  end
            end
            ram_read_action:
            begin
                if(localbus_cs_n == 1'b0)
                  begin
                      rden_b <= 1'b1;
                      address_b <= localbus_addr[5:0];
                      
                      set_state <= wait_1_action;
                  end
            end
            wait_1_action:
            begin
                rden_b <= 1'b0;
                set_state <= wait_2_action;
            end
            wait_2_action:
            begin
                set_state <= read_ram_action;
            end
            read_ram_action:
            begin
                localbus_data_out <= q_b;
                localbus_ack_n <= 1'b0;
                set_state <= wait_back;
            end
            ram_set_action_data:
            begin
                if(localbus_cs_n == 1'b0)
                  begin
                      case(localbus_addr[3:0])
                        4'd0: xtr_info_data_b[351:320] <= localbus_data; 
                        4'd1: xtr_info_data_b[319:288] <= localbus_data;
                        4'd2: xtr_info_data_b[287:256] <= localbus_data; 
                        4'd3: xtr_info_data_b[255:224] <= localbus_data;
                        4'd4: xtr_info_data_b[223:192] <= localbus_data; 
                        4'd5: xtr_info_data_b[191:160] <= localbus_data;
                        4'd6: xtr_info_data_b[159:128] <= localbus_data; 
                        4'd7: xtr_info_data_b[127:96] <= localbus_data;
                        4'd8: xtr_info_data_b[95:64]  <= localbus_data; 
                        4'd9: xtr_info_data_b[63:32]  <= localbus_data;
                        4'd10:
                          begin
                            xtr_info_data_b[31:0]  <= localbus_data;
                            xtr_info_addr_b <= localbus_addr[9:4];
                            xtr_info_wren_b <= 1'b1;
                          end
                        default:  xtr_info_data_b[31:0] <= localbus_data;
                      endcase
                      
                      localbus_ack_n <= 1'b0;
                      set_state <= wait_back;
                  end
                else set_state <= ram_set_action_data;
            end
            ram_read_action_data:
            begin
                if(localbus_cs_n == 1'b0)
                  begin
                      case(localbus_addr[3:0])
                        4'd0:
                        begin
                            set_state <= wait_1_action_data;
                            
                            xtr_info_addr_b <= localbus_addr[9:4];
                            xtr_info_rden_b <= 1'b1;
                        end
                        4'd1:
                        begin
                            localbus_data_out <= xtr_info_action_data[319:288];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd2:
                        begin
                            localbus_data_out <= xtr_info_action_data[287:256];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end 
                        4'd3:
                        begin
                            localbus_data_out <= xtr_info_action_data[255:224];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd4:
                        begin
                            localbus_data_out <= xtr_info_action_data[223:192];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd5:
                        begin
                            localbus_data_out <= xtr_info_action_data[191:160];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd6:
                        begin
                            localbus_data_out <= xtr_info_action_data[159:128];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd7:
                        begin
                            localbus_data_out <= xtr_info_action_data[127:96];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd8:
                        begin
                            localbus_data_out <= xtr_info_action_data[95:64];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd9:
                        begin
                            localbus_data_out <= xtr_info_action_data[63:32];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                        4'd10:
                        begin
                            localbus_data_out <= xtr_info_action_data[31:0];
                            localbus_ack_n <= 1'b0;
                            
                            set_state <= wait_back;
                        end
                      endcase
                  end
                else  set_state <= ram_read_action_data;
            end
            wait_1_action_data:
            begin
                xtr_info_rden_b <= 1'b0;
                set_state <= wait_2_action_data;
            end
            wait_2_action_data:
            begin
                set_state <= read_ram_action_data;
            end
            read_ram_action_data:
            begin
                localbus_ack_n <= 1'b0;
                localbus_data_out <= xtr_info_q_b[351:320];
                xtr_info_action_data <= xtr_info_q_b;
                
                set_state <= wait_back;
            end
            wait_back:
            begin
                wren_b <= 1'b0;
                xtr_info_wren_b <= 1'b0;
                
                if(localbus_cs_n == 1'b1)
                  begin
                      localbus_ack_n <= 1'b1;
                      set_state <= idle;
                  end
                else  set_state <= wait_back;
            end
            default:
            begin
                set_state <= idle;
            end
          endcase
      end
end


ram_32_64 rule_ram(
.address_a(address_a),
.address_b(address_b),
.clock(clk),
.data_a(32'b0),
.data_b(data_b),
.rden_a(rden_a),
.rden_b(rden_b),
.wren_a(1'b0),
.wren_b(wren_b),
.q_a(q_a),
.q_b(q_b)
);
ram_352_64 xtr_info_ram(
.address_a(xtr_info_addr_a),
.address_b(xtr_info_addr_b),
.clock(clk),
.data_a(352'b0),
.data_b(xtr_info_data_b),
.rden_a(xtr_info_rden_a),
.rden_b(xtr_info_rden_b),
.wren_a(1'b0),
.wren_b(xtr_info_wren_b),
.q_a(xtr_info_q_a),
.q_b(xtr_info_q_b)
);





//--stage_2--//
hold1clk h1c_1(
.clk(clk),
.reset(reset),
.stage_enable_in(flag),
.stage_enable_out(hold1clk_out_1)
);
//--stage_3--//
hold1clk h1c_2(
.clk(clk),
.reset(reset),
.stage_enable_in(hold1clk_out_1),
.stage_enable_out(hold1clk_out_2)
);
//--stage_4--//
hold1clk h1c_3(
.clk(clk),
.reset(reset),
.stage_enable_in(hold1clk_out_2),
.stage_enable_out(hold1clk_out_3)
);
//--stage_5--//
hold1clk h1c_4(
.clk(clk),
.reset(reset),
.stage_enable_in(hold1clk_out_3),
.stage_enable_out(hold1clk_out_4)
);
//--stage_6--//
hold1clk h1c_5(
.clk(clk),
.reset(reset),
.stage_enable_in(hold1clk_out_4),
.stage_enable_out(hold1clk_out_5)
);
//--stage_7--//
hold1clk h1c_6(
.clk(clk),
.reset(reset),
.stage_enable_in(hold1clk_out_5),
.stage_enable_out(hold1clk_out_6)
);
//--stage_8--//
hold1clk h1c_7(
.clk(clk),
.reset(reset),
.stage_enable_in(action_valid),
.stage_enable_out(hold1clk_out_7)
);
//--stage_9--//
hold1clk h1c_8(
.clk(clk),
.reset(reset),
.stage_enable_in(hold1clk_out_7),
.stage_enable_out(hold1clk_out_8)
);
//--stage_10--//
hold1clk h1c_9(
.clk(clk),
.reset(reset),
.stage_enable_in(hold1clk_out_8),
.stage_enable_out(hold1clk_out_9)
);




endmodule