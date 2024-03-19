`timescale 1ns/1ps

module match(
clk,
reset,

localbus_cs_n,
localbus_rd_wr,
localbus_data,
localbus_ale,
localbus_ack_n,
localbus_data_out,

metadata_valid,
metadata,


action_valid,
action,
action_data_valid,
action_data


);
input           clk;
input           reset;

input           localbus_cs_n;
input           localbus_rd_wr;
input [31:0]    localbus_data;
input           localbus_ale;
output          localbus_ack_n;
output [31:0]   localbus_data_out;



input           metadata_valid;
input [107:0]   metadata;

output          action_valid;
output[15:0]    action;
output          action_data_valid;
output[351:0]   action_data;

wire            action_valid;
wire  [15:0]    action;
wire            action_data_valid;
wire  [351:0]   action_data;

reg            localbus_ack_n;
reg [31:0]     localbus_data_out; 


//---//
wire            search_1_bv_valid,search_2_bv_valid,search_3_bv_valid,search_4_bv_valid;
wire  [35:0]   search_1_bv,search_2_bv,search_3_bv,search_4_bv;

//--reg--//
//reg localbus_cs_n_1,localbus_cs_n_2,localbus_cs_n_3,localbus_cs_n_4,localbus_cs_n_5;
reg localbus_ale_1,localbus_ale_2,localbus_ale_3,localbus_ale_4,localbus_ale_5;
wire  localbus_ack_n_1,localbus_ack_n_2,localbus_ack_n_3,localbus_ack_n_4,localbus_ack_n_5;
wire  [31:0]  localbus_data_out_1,localbus_data_out_2,localbus_data_out_3,localbus_data_out_4,localbus_data_out_5;


//--state--//
reg [3:0] set_state;

parameter     idle        = 4'd0,
              set_wait    = 4'd1,
              wait_back   = 4'd3;

//---------------------------set_state--------------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    set_state <= idle;
				localbus_data_out	<=	32'b0;
				localbus_ale_1	<=	1'b0;
				localbus_ale_2	<=	1'b0;
				localbus_ale_3	<=	1'b0;
				localbus_ale_4	<=	1'b0;
				localbus_ale_5	<=	1'b0;
			    localbus_ack_n <= 1'b1;
      end
    else
      begin
          case(set_state)
            idle:
            begin
                if((localbus_ale == 1'b1) && (localbus_data[23] == 1'b0))
                  begin
                      case(localbus_data[19:16])
                        4'd0: localbus_ale_1 <= localbus_ale;
                        4'd1: localbus_ale_2 <= localbus_ale;
                        4'd2: localbus_ale_3 <= localbus_ale;
                        4'd3: localbus_ale_4 <= localbus_ale;
                        4'd4: localbus_ale_5 <= localbus_ale;
                        default: localbus_ale_5 <= localbus_ale;
                        
                      endcase
                      set_state <= set_wait;
                  end
            end
            
            set_wait:
            begin
                localbus_ale_1 <= 1'b0;localbus_ale_2 <= 1'b0;localbus_ale_3 <= 1'b0;
                localbus_ale_4 <= 1'b0;localbus_ale_5 <= 1'b0;
                if((localbus_ack_n_1 == 1'b0) || (localbus_ack_n_2 == 1'b0) ||(localbus_ack_n_3 == 1'b0) ||
                  (localbus_ack_n_4 == 1'b0) ||(localbus_ack_n_5 == 1'b0))
                  begin
                    localbus_ack_n <= 1'b0;
                    set_state <= wait_back;
                    
                    case({localbus_ack_n_1,localbus_ack_n_2,localbus_ack_n_3,
                    localbus_ack_n_4,localbus_ack_n_5})
                      5'b01111: localbus_data_out <= localbus_data_out_1;
                      5'b10111: localbus_data_out <= localbus_data_out_2;
                      5'b11011: localbus_data_out <= localbus_data_out_3;
                      5'b11101: localbus_data_out <= localbus_data_out_4;
                      5'b11110: localbus_data_out <= localbus_data_out_5;
                      default:
                      begin
                          localbus_data_out <= localbus_data_out_5;
                      end
                    endcase
                  end
            end
            wait_back:
            begin
                if(localbus_cs_n == 1'b1)
                  begin
                      localbus_ack_n <= 1'b1;
                      set_state <= idle;
                  end
            end
            default:
            begin
                set_state <= idle;
            end
          endcase
      end
end


//---search_engine_1---//
search_engine search_engine_1(
.clk(clk),
.reset(reset),
.key_valid(metadata_valid),
.key(metadata[107:81]),
.bv_valid(search_1_bv_valid),
.bv(search_1_bv),
.localbus_cs_n(localbus_cs_n),
.localbus_rd_wr(localbus_rd_wr),
.localbus_data(localbus_data),
.localbus_ale(localbus_ale_1),
.localbus_ack_n(localbus_ack_n_1),
.localbus_data_out(localbus_data_out_1)
);

//---search_engine_2---//
search_engine search_engine_2(
.clk(clk),
.reset(reset),
.key_valid(metadata_valid),
.key(metadata[80:54]),
.bv_valid(search_2_bv_valid),
.bv(search_2_bv),
.localbus_cs_n(localbus_cs_n),
.localbus_rd_wr(localbus_rd_wr),
.localbus_data(localbus_data),
.localbus_ale(localbus_ale_2),
.localbus_ack_n(localbus_ack_n_2),
.localbus_data_out(localbus_data_out_2)
);

//---search_engine_3---//
search_engine search_engine_3(
.clk(clk),
.reset(reset),
.key_valid(metadata_valid),
.key(metadata[53:27]),
.bv_valid(search_3_bv_valid),
.bv(search_3_bv),
.localbus_cs_n(localbus_cs_n),
.localbus_rd_wr(localbus_rd_wr),
.localbus_data(localbus_data),
.localbus_ale(localbus_ale_3),
.localbus_ack_n(localbus_ack_n_3),
.localbus_data_out(localbus_data_out_3)
);

//---search_engine_4---//
search_engine search_engine_4(
.clk(clk),
.reset(reset),
.key_valid(metadata_valid),
.key(metadata[26:0]),
.bv_valid(search_4_bv_valid),
.bv(search_4_bv),
.localbus_cs_n(localbus_cs_n),
.localbus_rd_wr(localbus_rd_wr),
.localbus_data(localbus_data),
.localbus_ale(localbus_ale_4),
.localbus_ack_n(localbus_ack_n_4),
.localbus_data_out(localbus_data_out_4)
);

//----lookup_rule---//
lookup_rule lk_rule(
.clk(clk),
.reset(reset),
.bv_valid_1(search_1_bv_valid),
.bv_1(search_1_bv),
.bv_valid_2(search_2_bv_valid),
.bv_2(search_2_bv),
.bv_valid_3(search_3_bv_valid),
.bv_3(search_3_bv),
.bv_valid_4(search_4_bv_valid),
.bv_4(search_4_bv),
.action_valid(action_valid),
.action(action),
.action_data_valid(action_data_valid),
.action_data(action_data),
.localbus_cs_n(localbus_cs_n),
.localbus_rd_wr(localbus_rd_wr),
.localbus_data(localbus_data),
.localbus_ale(localbus_ale_5),
.localbus_ack_n(localbus_ack_n_5),
.localbus_data_out(localbus_data_out_5)
);
endmodule 