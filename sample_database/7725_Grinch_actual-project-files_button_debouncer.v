// This program was cloned from: https://github.com/Fe1LDr/Grinch
// License: MIT License

module button_debouncer #(
  parameter    CNT_WIDTH = 16
)(
  input clk     ,
  input arst_n  ,
  input sw_i    ,  
 
  output reg sw_state_o,  
  output reg sw_down_o,  
  output reg sw_up_o   
);
 
reg   [1:0] sw_r;
always @ ( posedge clk or negedge arst_n ) begin
  if ( !arst_n )
    sw_r <= 2'b00;
  else
    sw_r <= {sw_r[0], sw_i};
end 

reg [CNT_WIDTH-1:0] sw_count;
 
wire sw_change_f = (sw_state_o != sw_r[1]);
wire sw_cnt_max  = &sw_count;  
 
always @( posedge clk or negedge arst_n  ) begin
  if ( !arst_n ) begin
    sw_count   <= 0;
    sw_state_o <= 1;
  end 
  else if(sw_change_f) begin
    sw_count <= sw_count + 'd1;  
    if ( sw_cnt_max )
      sw_state_o <= ~sw_state_o;  
  end
  else begin
    sw_count <= 0;  
  end
 end
 
always @(posedge clk) begin
  sw_down_o <= sw_change_f & sw_cnt_max & ~sw_state_o;
  sw_up_o   <= sw_change_f & sw_cnt_max &  sw_state_o;
end
 
endmodule