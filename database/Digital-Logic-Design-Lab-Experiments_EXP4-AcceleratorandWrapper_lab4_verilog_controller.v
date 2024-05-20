// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`define init 3'b000
`define wait_s 3'b001
`define beg_cal 3'b010
`define cal 3'b011
`define end_cal 3'b100
`define r_wait 3'b101
`define read_s 3'b110
`define out_cal 3'b111

//cal_done ?
module controller(clk,rst,rst_cnt,rst_fifo,start,eng_start,eng_done,wr_req,inc_cnt,full,empty,read,rd_req,finished);
  input clk,rst,start,eng_done,full,read,empty;
  output reg rst_cnt,rst_fifo,eng_start,wr_req,inc_cnt,rd_req,finished;
  reg [2:0] ns,ps;
  always @(start,eng_done,full,empty,read) begin
    ns = 0;
    {rst_cnt,rst_fifo,eng_start,wr_req,inc_cnt,rd_req,finished} = 7'b0;
    case (ps)
    `init: begin {rst_cnt,rst_fifo} = 2'b11; ns = (start) ? `wait_s : `init;  end 
    `wait_s: begin ns = start ? `wait_s : `beg_cal; end
    `beg_cal: begin eng_start = 1'b1; ns = `cal; end
    `cal: begin ns = eng_done ? `end_cal : `cal; wr_req = eng_done; end
    `end_cal: begin inc_cnt = 1'b1; ns = (full) ? `r_wait : `beg_cal; end
    `r_wait: begin ns = read ? `read_s : `r_wait; end
    `read_s: begin ns = `out_cal; rd_req = 1'b1; end
    `out_cal: begin ns = read ? `out_cal : `init; finished = !read; end

    endcase
  end
  always @(posedge clk,rst) begin
    if(rst) ps <= `init;
    else ps <= ns;
  end
endmodule



module coutnter(clk,rst,cnt_num,inc_cnt);
  input clk,rst,inc_cnt;
  output reg [3:0] cnt_num;
  always @(posedge clk) begin
    if(rst) cnt_num <= 4'b0;
    else begin
      if(inc_cnt) cnt_num <= cnt_num+1;
    end
    
    
  end
endmodule