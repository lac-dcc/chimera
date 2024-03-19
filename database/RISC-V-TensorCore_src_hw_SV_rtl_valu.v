module valu (
  input logic nrst,
  input logic valu_en,
  input logic[31:0] inA,
  input logic[31:0] inB,
  input logic[7:0] vrfb_addr, // base address of the vector register file address from where to start storing output data
  input logic[8:0] op,
  output logic[31:0] out_res,
  output logic valid_out,
  output logic[7:0] vrfo_addr
  );
  
  
  always_comb begin
    if(!nrst) 
      out_res = 'z;
    else if(valu_en == 1'b1 && inA != 'hdead_dead && inB != 'hdead_dead) begin
      if( op == 9'h000 || op == 9'h004) 
        out_res = inA + inB;
      else if(op == 9'h0B8 || op == 9'h0BC) 
        out_res = inA * inB;
      else 
        out_res = 'hdead_dead;
      
      vrfo_addr = vrfb_addr; // send the destination address along with the output data to the output_fifo_queue
    end
    
    else 
      out_res = 'hdead_dead;
  end
  
  assign valid_out = (!nrst || out_res == 'hdead_dead || valu_en == 1'b0) ? 1'b0 : 1'b1; 
  
endmodule


    
  