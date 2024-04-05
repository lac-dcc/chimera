`include "p_parameter.vh"

module performance_ch_prog_counter
(
  //system
  input  wire                                     i_bus_clk,
  input  wire                                     i_bus_rst,
  
  //counter
  input  wire       [`SLV_DATA_WD-1:0]            i_config,
  input  wire                                     i_prog_cnt_cp_cmplt,
  output wire       [`SLV_DATA_WD-1:0]            o_prog_cnt,
  output wire       [9:0]                         o_prog_req_cnt,
  
  //nand interface
  input  wire       [`WAY-1:0]                    i_prog_start,
  input  wire       [`WAY-1:0]                    i_prog_end,
  input  wire       [`WAY-1:0]                    i_op_fail,    //<= 수정 필요()
  output reg                                      o_prog_ready
);
  //maximum average confi
  //     2500            25000         1000
  //-------------   ------------- --------------
  // prog(10bits) I read(12bits) I erase(10bits)
  //-------------   ------------- --------------
  wire [`SLV_DATA_WD-1:0] w_config;
  
  //trigger
  wire w_prog_start;
  wire w_prog_end;
  
  assign w_prog_start = |{i_prog_start};
  assign w_prog_end   = |{i_prog_end  };
  
  //cnt
  reg [31:0] r_prog_cnt;
  
  //sum
  reg [31:0] r_prog_cnt_sum;
  reg        r_prog_sum_end;
  reg        r_prog_sum_end_ack_1;
  reg        r_prog_sum_end_ack_2;
  
  //config
  wire [9:0]  w_prog_config;
  
  //req_cnt
  reg  [9:0]  r_prog_req_cnt;
  
  //prog end ack
  reg r_prog_end;
  reg r_prog_end_ack;
  
  reg [1:0] r_prog_cur_state;
  reg [1:0] r_prog_next_state;
  
  //state
  parameter PROG_IDLE    = 2'b00;
  parameter PROG_REQ_CNT = 2'b01;
  parameter CP_CMPLT     = 2'b11;
  parameter PROG_SUM_END = 2'b10;
  
  assign w_config = i_config;
  assign w_prog_config  = w_config[31:22];
  assign o_prog_cnt = r_prog_cnt_sum;  
  assign o_prog_req_cnt = r_prog_req_cnt;
  
  always @ (posedge i_bus_clk)
  begin
       r_prog_end     <=  w_prog_end;
       r_prog_end_ack <= ~w_prog_end & r_prog_end;
  end
  
  always @ (posedge i_bus_clk)
  begin
       r_prog_sum_end_ack_1 <= r_prog_sum_end;
       r_prog_sum_end_ack_2 <= ~r_prog_sum_end & r_prog_sum_end_ack_1;
  end
  
  //prog
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst)
       begin
            r_prog_cnt <= 'b0;
       end
       
       else
       begin
            if (w_prog_start && w_prog_end) r_prog_cnt <= 'b0;
            else if(w_prog_start)           r_prog_cnt <= r_prog_cnt + 'b1;
            else if(w_prog_end)             r_prog_cnt <= r_prog_cnt;
            else if(r_prog_end_ack)         r_prog_cnt <= 'b0;
            else                            r_prog_cnt <= r_prog_cnt;
       end
  end

  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) r_prog_cnt_sum <= 'b0;
       
       else
       begin
            if(w_prog_start && w_prog_end) r_prog_cnt_sum <= r_prog_cnt + r_prog_cnt_sum;
            else if(w_prog_end)            r_prog_cnt_sum <= (i_op_fail) ? r_prog_cnt_sum : r_prog_cnt + r_prog_cnt_sum;
            else if(r_prog_sum_end_ack_2)  r_prog_cnt_sum <= 'b0;
            else                           r_prog_cnt_sum <= r_prog_cnt_sum;
       end
  end

  //prog_req_cnt
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst)                  r_prog_req_cnt <= 'b0;
       else if(w_prog_end)            r_prog_req_cnt <= (i_op_fail) ? r_prog_req_cnt : r_prog_req_cnt + 'b1;
       else if (r_prog_sum_end_ack_2) r_prog_req_cnt <= 'b0;
       else                           r_prog_req_cnt <= r_prog_req_cnt;
  end
  
  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) r_prog_cur_state <= PROG_IDLE;
       else          r_prog_cur_state <= r_prog_next_state;
  end
  
  always @ (*)
  begin
       case(r_prog_cur_state)
           PROG_IDLE:
           begin
                r_prog_next_state <= (w_prog_start) ? PROG_REQ_CNT : PROG_IDLE;
                r_prog_sum_end    <= 'b0;
           end
           PROG_REQ_CNT:
           begin
                r_prog_next_state <= (r_prog_req_cnt == w_prog_config) ? CP_CMPLT : (i_prog_cnt_cp_cmplt) ? PROG_SUM_END : PROG_REQ_CNT;
                r_prog_sum_end    <= 'b0;
           end
           CP_CMPLT:
           begin
                r_prog_next_state <= (i_prog_cnt_cp_cmplt) ? PROG_SUM_END : CP_CMPLT;
                r_prog_sum_end    <= 'b0;
           end 
           PROG_SUM_END:
           begin
                r_prog_next_state <= PROG_IDLE;
                r_prog_sum_end    <= 'b1;
           end
           default:
           begin
                r_prog_next_state <= PROG_IDLE;
                r_prog_sum_end    <= 'b0;
           end
       endcase
  end

  always @ (posedge i_bus_clk or posedge i_bus_rst)
  begin
       if(i_bus_rst) o_prog_ready <= 'b0;
       else
       begin
            case(r_prog_cur_state)
                CP_CMPLT : o_prog_ready <= 'b1;
                default:   o_prog_ready <= 'b0;
            endcase
       end
       
  end
endmodule
