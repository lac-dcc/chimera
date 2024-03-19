module arbiter (
  input logic clk,
  input logic nrst,
  input logic ld_req,
  input logic valu_req,
  output logic ld_gnt,
  output logic valu_gnt
);
  
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst) begin
      ld_gnt 	<= 'd0;
      valu_gnt	<= 'd0;
    end
    
    else begin
      if(ld_req == 1) begin
        valu_gnt	<= 'b0;
        ld_gnt		<= 'b1;
      end
     
      else if (valu_req == 1 && ld_req == 0) begin
        ld_gnt 		<= 'b0;
        valu_gnt	<= 'b1;
      end
      
      else begin
        valu_gnt	<= 'b0;
        ld_gnt		<= 'b0;
      end
      
    end
    
  end
  
endmodule

