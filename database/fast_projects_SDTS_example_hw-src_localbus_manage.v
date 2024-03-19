`timescale 1ns/1ps
module localbus_manage(
clk,
reset,
localbus_cs_n,
localbus_rd_wr,
localbus_data,
localbus_ale, 
localbus_ack_n,  
localbus_data_out,

cs_n,
rd_wr,
data,
ale, 
ack_n,  
data_out,

set_ip_src_valid,
set_ip_src,

mode,
xtr_id,

set_port

);
input clk;
input reset;

input localbus_cs_n;
input localbus_rd_wr;
input [31:0]  localbus_data;
input localbus_ale;
output  reg  localbus_ack_n;
output  reg  [31:0]  localbus_data_out;

output wire cs_n;
output wire rd_wr;
output wire [31:0]  data;
output reg ale;
input ack_n;
input [31:0]  data_out; 


output  reg set_ip_src_valid;
output  reg [130:0] set_ip_src;

output  reg mode;
output  reg [7:0] xtr_id;

output  reg [7:0] set_port;


//----------reg--------------//
reg [31:0]  localbus_addr;
reg [127:0] ip_src_1,ip_src_2,ip_src_3,ip_src_4,ip_src_5,ip_src_6,ip_src_7,ip_src_8;
reg [127:0] read_ip_src;


//--state--//
reg [3:0] localbus_state;

parameter   idle_s      = 4'd0,
            wait_set_s  = 4'd1,
            wait_read_s = 4'd2,
            wait_ack_s  = 4'd3,
            wait_back_s = 4'd4;


assign rd_wr = localbus_rd_wr;
assign data = localbus_data;
assign cs_n = localbus_cs_n;


//----------------localbus_state-------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
          set_ip_src_valid <= 1'b0;
          set_ip_src <= 130'b0;
          
          mode <= 1'b1;
          xtr_id <= 8'h12;
          set_port <= 8'h80;
          
          ale <= 1'b0;
          localbus_ack_n <= 1'b1;
          localbus_data_out <= 32'b0;
          
          localbus_addr <= 32'b0;
		  read_ip_src <= 128'b0;
         // ip_src_1 <= 128'b0;
		 ip_src_2 <= 128'b0;ip_src_3 <= 128'b0;ip_src_4 <= 128'b0;
          ip_src_5 <= 128'b0;ip_src_6 <= 128'b0;ip_src_7 <= 128'b0;ip_src_8 <= 128'b0;
          
          
          localbus_state <= idle_s;
      end
    else
      begin
        case(localbus_state)
          idle_s:
          begin
              if(localbus_ale == 1'b1)
                begin
                    localbus_addr <= localbus_data;
                    if(localbus_data[23] == 1'b1)
                      begin
                          ale <= 1'b0;
                          if(localbus_rd_wr == 1'b1) localbus_state <= wait_read_s;
                          else  localbus_state <= wait_set_s;
                          case(localbus_data[6:4])
                            3'd0: read_ip_src <= ip_src_1;
                            3'd1: read_ip_src <= ip_src_2;
                            3'd2: read_ip_src <= ip_src_3;
                            3'd3: read_ip_src <= ip_src_4;
                            3'd4: read_ip_src <= ip_src_5;
                            3'd5: read_ip_src <= ip_src_6;
                            3'd6: read_ip_src <= ip_src_7;
                            3'd7: read_ip_src <= ip_src_8;
                          endcase
                      end
                    else
                      begin
                          ale <= 1'b1;
                          localbus_state <= wait_ack_s;
                      end
                end
              else
                begin
                    ale <= 1'b0;
                    localbus_state <= idle_s;
                end
          end
          wait_set_s:
          begin
              if(localbus_cs_n == 1'b0)
                begin
                    case(localbus_addr[13:12])
                      2'd0: mode <= localbus_data[0];
                      2'd1:
                      begin
                          case(localbus_addr[1:0])
                            2'd0: set_ip_src[130:96] <= {localbus_addr[6:4],localbus_data};
                            2'd1: set_ip_src[95:64] <= localbus_data;
                            2'd2: set_ip_src[63:32] <= localbus_data;
                            2'd3:
                            begin
                                set_ip_src_valid <= 1'b1;
                                set_ip_src[31:0]  <= localbus_data;
                            end
                          endcase
                      end
                      2'd2: xtr_id <= localbus_data[7:0];
                      2'd3: set_port <= localbus_data[7:0];
                    endcase
                    localbus_ack_n <= 1'b0;
                    localbus_state <= wait_back_s;
                end
              else  localbus_state <= wait_set_s;
          end
          wait_read_s:
          begin
              if(localbus_cs_n == 1'b0)
                begin
                    case(localbus_addr[13:12])
                      2'd0: localbus_data_out <= {31'b0,mode};
                      2'd1:
                      begin
                        case(localbus_addr[1:0])
                          2'd0: localbus_data_out <= read_ip_src[127:96];
                          2'd1: localbus_data_out <= read_ip_src[95:64];
                          2'd2: localbus_data_out <= read_ip_src[63:32];
                          2'd3: localbus_data_out <= read_ip_src[31:0];
                        endcase
                      end
                      2'd2: localbus_data_out <= {24'b0,xtr_id};
                      2'd3: localbus_data_out <= {24'b0,set_port};
                    endcase
                    localbus_ack_n <= 1'b0;
                    localbus_state <= wait_back_s;
                end
              else  localbus_state <= wait_read_s;
          end
          wait_ack_s:
          begin
              ale <= 1'b0;
              if(ack_n == 1'b0)
                begin
                    localbus_data_out <= data_out;
                    localbus_ack_n <= 1'b0;
                    
                    localbus_state <= wait_back_s;
                end
              else  localbus_state <= wait_ack_s;
          end
          wait_back_s:
          begin
              if(set_ip_src_valid == 1'b1)
                begin
                    case(set_ip_src[130:128])
                      3'd0: ip_src_1 <= set_ip_src[127:0];
                      3'd1: ip_src_2 <= set_ip_src[127:0];
                      3'd2: ip_src_3 <= set_ip_src[127:0];
                      3'd3: ip_src_4 <= set_ip_src[127:0];
                      3'd4: ip_src_5 <= set_ip_src[127:0];
                      3'd5: ip_src_6 <= set_ip_src[127:0];
                      3'd6: ip_src_7 <= set_ip_src[127:0];
                      3'd7: ip_src_8 <= set_ip_src[127:0];
                    endcase
                end
              set_ip_src_valid <= 1'b0;
              if(localbus_cs_n == 1'b1)
                begin
                    localbus_ack_n <= 1'b1;
                    
                    localbus_state <= idle_s;
                end
              else  localbus_state <= wait_back_s;
          end
          default:
          begin
              localbus_state <= idle_s;
          end
        endcase
      end
end



















endmodule


