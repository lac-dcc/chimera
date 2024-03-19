module Buffer (output [63:0] bf_out, 
			   output reg [2:0] em_pl, 
			   input clk, reset, pop, push, input [63:0] bf_in);
  
  reg [63:0] bf [0:3];
  reg [1:0] add_wr;
  reg [1:0] add_rd;
  
  assign bf_out = bf[add_rd];
  
  always @(posedge clk)
  begin
    if(reset)
    begin
      bf[0] <= 64'b0;
      bf[1] <= 64'b0;
      bf[2] <= 64'b0;
      bf[3] <= 64'b0;
      em_pl = 3'd4;
      add_wr = 0;
      add_rd = 0;
    end
    else
    begin
      if(push == 1 && pop == 0 && em_pl > 3'd0)
      begin
        bf[add_wr] <= bf_in;
        em_pl = em_pl - 1;
        add_wr = add_wr + 1;
      end
      else if(push == 0 && pop == 1 && em_pl < 3'd4)
      begin
        em_pl = em_pl + 1;
        add_rd = add_rd + 1;
      end
      else if(push == 1 && pop == 1)
      begin
        if(em_pl == 3'd4)
        begin
          bf[add_wr] <= bf_in;
          add_wr = add_wr + 1;
          em_pl = em_pl - 1;
        end
        else
        begin
          bf[add_wr] <= bf_in;
          add_wr = add_wr + 1;
          add_rd = add_rd + 1;
        end
      end
    end
    
  end
  
endmodule
