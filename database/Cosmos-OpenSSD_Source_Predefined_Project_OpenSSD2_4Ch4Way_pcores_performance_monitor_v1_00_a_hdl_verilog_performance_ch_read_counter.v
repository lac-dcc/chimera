// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

`include "p_parameter.vh"

module performance_ch_read_counter
(
  //system
  input  wire                                     i_bus_clk,
  input  wire                                     i_bus_rst,
  
  //counter
  input  wire       [`SLV_DATA_WD-1:0]            i_config,
  input  wire                                     i_read_cnt_cp_cmplt,
  output wire       [`SLV_DATA_WD-1:0]            o_read_cnt,
  output wire       [11:0]                        o_read_req_cnt,
  
  //nand interface
  input  wire       [`WAY-1:0]                    i_read_start,
  input  wire       [`WAY-1:0]                    i_read_end,
  input  wire       [`WAY-1:0]                    i_op_fail,    //<= 수정 필요()
  output reg                                      o_read_ready
);
  //maximum average confi
  //     2500            25000         1000
  //-------------   ------------- --------------
  // prog(10bits) I read(12bits) I erase(10bits)
  //-------------   ------------- --------------
  wire [`SLV_DATA_WD-1:0] w_config;
  
  //trigger
  wire w_read_start;
  wire w_read_end;
  
  assign w_read_start = |{i_read_start};
  assign w_read_end   = |{i_read_end  };
  
  //cnt
  reg [31:0] r_read_cnt;
  
  //sum
  reg [31:0] r_read_cnt_sum;
  reg        r_read_sum_end;
  reg        r_read_sum_end_ack_1;
  reg        r_read_sum_end_ack_2;
  
  //config
  wire [11:0]  w_read_config;
  
  //req_cnt
  reg  [11:0]  r_read_req_cnt;
  
  //read end ack
  reg r_read_end;
  reg r_read_end_ack;
  
  reg [1:0] r_read_cur_state;
  reg [1:0] r_read_next_state;
  
  //state
  parameter READ_IDLE    = 2'b00;
  parameter READ_REQ_CNT = 2'b01;
  parameter CP_CMPLT     = 2'b11;
  parameter READ_SUM_END = 2'b10;
  
  assign w_config = i_config;
  assign w_read_config  = w_config[21:10];
  assign o_read_cnt = r_read_cnt_sum;  
  assign o_read_req_cnt = r_read_req_cnt;
  
  always @ (posedge i_bus_clk)
  begin
       r_read_end     <=  w_read_end;
       r_read_end_ack <= ~w_read_end & r_read_end;
  end
  
  always @ (posedge i_bus_clk)
  begin
       r_read_sum_end_ack_1 <= r_read_sum_end;
       r_read_sum_end_ack_2 <= ~r_read_sum_end & r_read_sum_end_ack_1;
  end
  
  //read
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst)
       begin
            r_read_cnt <= 'b0;
       end
       
       else
       begin
            if (w_read_start && w_read_end) r_read_cnt <= 'b0;
            else if(w_read_start)           r_read_cnt <= r_read_cnt + 'b1;
            else if(w_read_end)             r_read_cnt <= r_read_cnt;
            else if(r_read_end_ack)         r_read_cnt <= 'b0;
            else                            r_read_cnt <= r_read_cnt;
       end
  end

  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) r_read_cnt_sum <= 'b0;
       
       else
       begin
            if(w_read_start && w_read_end) r_read_cnt_sum <= r_read_cnt + r_read_cnt_sum;
            else if(w_read_end)            r_read_cnt_sum <= (i_op_fail) ? r_read_cnt_sum : r_read_cnt + r_read_cnt_sum;
            else if(r_read_sum_end_ack_2)  r_read_cnt_sum <= 'b0;
            else                           r_read_cnt_sum <= r_read_cnt_sum;
       end
  end

  //READ_REQ_CNT
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst)                  r_read_req_cnt <= 'b0;
       else if(w_read_end)            r_read_req_cnt <= (i_op_fail) ? r_read_req_cnt : r_read_req_cnt + 'b1;
       else if (r_read_sum_end_ack_2) r_read_req_cnt <= 'b0;
       else                           r_read_req_cnt <= r_read_req_cnt;
  end
  
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) r_read_cur_state <= READ_IDLE;
       else          r_read_cur_state <= r_read_next_state;
  end
  
  always @ (*)
  begin
       case(r_read_cur_state)
           READ_IDLE:
           begin
                r_read_next_state <= (w_read_start) ? READ_REQ_CNT : READ_IDLE;
                r_read_sum_end    <= 'b0;
           end
           READ_REQ_CNT:
           begin
                r_read_next_state <= (r_read_req_cnt == w_read_config) ? CP_CMPLT : (i_read_cnt_cp_cmplt) ? READ_SUM_END : READ_REQ_CNT;
                r_read_sum_end    <= 'b0;
           end
           CP_CMPLT:
           begin
                r_read_next_state <= (i_read_cnt_cp_cmplt) ? READ_SUM_END : CP_CMPLT;
                r_read_sum_end    <= 'b0;
           end 
           READ_SUM_END:
           begin
                r_read_next_state <= READ_IDLE;
                r_read_sum_end    <= 'b1;
           end
           default:
           begin
                r_read_next_state <= READ_IDLE;
                r_read_sum_end    <= 'b0;
           end
       endcase
  end

  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) o_read_ready <= 'b0;
       else
       begin
            case(r_read_cur_state)
                CP_CMPLT : o_read_ready <= 'b1;
                default:   o_read_ready <= 'b0;
            endcase
       end
       
  end
endmodule
