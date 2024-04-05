`include "p_parameter.vh"

module performance_ch_erase_counter
(
  //system
  input  wire                                     i_bus_clk,
  input  wire                                     i_bus_rst,
  
  //counter
  input  wire       [`SLV_DATA_WD-1:0]            i_config,
  input  wire                                     i_erase_cnt_cp_cmplt,
  output wire       [`SLV_DATA_WD-1:0]            o_erase_cnt,
  output wire       [9:0]                         o_erase_req_cnt,
  
  //nand interface
  input  wire       [`WAY-1:0]                    i_erase_start,
  input  wire       [`WAY-1:0]                    i_erase_end,
  input  wire       [`WAY-1:0]                    i_op_fail,    //<= 수정 필요()
  output reg                                      o_erase_ready
);
  //maximum average confi
  //     2500            25000         1000
  //-------------   ------------- --------------
  // prog(10bits) I read(12bits) I erase(10bits)
  //-------------   ------------- --------------
  wire [`SLV_DATA_WD-1:0] w_config;
  
  //trigger
  wire w_erase_start;
  wire w_erase_end;
  
  assign w_erase_start = |{i_erase_start};
  assign w_erase_end   = |{i_erase_end  };
  
  //cnt
  reg [31:0] r_erase_cnt;
  
  //sum
  reg [31:0] r_erase_cnt_sum;
  reg        r_erase_sum_end;
  reg        r_erase_sum_end_ack_1;
  reg        r_erase_sum_end_ack_2;
  
  //config
  wire [9:0]  w_erase_config;
  
  //req_cnt
  reg  [9:0]  r_erase_req_cnt;
  
  //erase end ack
  reg r_erase_end;
  reg r_erase_end_ack;
  
  reg [1:0] r_erase_cur_state;
  reg [1:0] r_erase_next_state;
  
  //state
  parameter ERASE_IDLE    = 2'b00;//4'b0001;
  parameter ERASE_REQ_CNT = 2'b01;//4'b0010;
  parameter CP_CMPLT      = 2'b11;//4'b0100;
  parameter ERASE_SUM_END = 2'b10;//4'b1000;
  
  assign w_config = i_config;
  assign w_erase_config  = w_config[9:0];
  assign o_erase_cnt = r_erase_cnt_sum;  
  assign o_erase_req_cnt = r_erase_req_cnt;
  
  always @ (posedge i_bus_clk)
  begin
       r_erase_end     <=  w_erase_end;
       r_erase_end_ack <= ~w_erase_end & r_erase_end;
  end
  
  always @ (posedge i_bus_clk)
  begin
       r_erase_sum_end_ack_1 <= r_erase_sum_end;
       r_erase_sum_end_ack_2 <= ~r_erase_sum_end & r_erase_sum_end_ack_1;
  end
  
  //erase counter
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst)
       begin
            r_erase_cnt <= 'b0;
       end
       
       else
       begin
            if (w_erase_start && w_erase_end) r_erase_cnt <= 'b0;
            else if(w_erase_start)            r_erase_cnt <= r_erase_cnt + 'b1;
            else if(w_erase_end)              r_erase_cnt <= r_erase_cnt;
            else if(r_erase_end_ack)          r_erase_cnt <= 'b0;
            else                              r_erase_cnt <= r_erase_cnt;
       end
  end

  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) r_erase_cnt_sum <= 'b0;
       
       else
       begin
            if(w_erase_start && w_erase_end) r_erase_cnt_sum <= r_erase_cnt + r_erase_cnt_sum;
            else if(w_erase_end)             r_erase_cnt_sum <= (i_op_fail) ? r_erase_cnt_sum : r_erase_cnt + r_erase_cnt_sum;
            else if(r_erase_sum_end_ack_2)   r_erase_cnt_sum <= 'b0;
            else                             r_erase_cnt_sum <= r_erase_cnt_sum;
       end
  end

  //ERASE_REQ_CNT
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst)                   r_erase_req_cnt <= 'b0;
       else if(w_erase_end)            r_erase_req_cnt <= (i_op_fail) ? r_erase_req_cnt : r_erase_req_cnt + 'b1;
       else if (r_erase_sum_end_ack_2) r_erase_req_cnt <= 'b0;
       else                            r_erase_req_cnt <= r_erase_req_cnt;
  end
  
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) r_erase_cur_state <= ERASE_IDLE;
       else          r_erase_cur_state <= r_erase_next_state;
  end
  
  always @ (*)
  begin
       case(r_erase_cur_state)
           ERASE_IDLE:
           begin
                r_erase_next_state <= (w_erase_start) ? ERASE_REQ_CNT : ERASE_IDLE;
                r_erase_sum_end    <= 'b0;
           end
           ERASE_REQ_CNT:
           begin
                r_erase_next_state <= (r_erase_req_cnt == w_erase_config) ? CP_CMPLT : (i_erase_cnt_cp_cmplt) ? ERASE_SUM_END : ERASE_REQ_CNT;
                r_erase_sum_end    <= 'b0;
           end
           CP_CMPLT:
           begin
                r_erase_next_state <= (i_erase_cnt_cp_cmplt) ? ERASE_SUM_END : CP_CMPLT;
                r_erase_sum_end    <= 'b0;
           end 
           ERASE_SUM_END:
           begin
                r_erase_next_state <= ERASE_IDLE;
                r_erase_sum_end    <= 'b1;
           end
           default:
           begin
                r_erase_next_state <= ERASE_IDLE;
                r_erase_sum_end    <= 'b0;
           end
       endcase
  end

  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) o_erase_ready <= 'b0;
       else
       begin
            case(r_erase_cur_state)
                CP_CMPLT :  o_erase_ready <= 'b1;
                default:    o_erase_ready <= 'b0;
            endcase
       end
       
  end
endmodule
