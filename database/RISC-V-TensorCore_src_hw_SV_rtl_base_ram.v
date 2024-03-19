module base_ram (
  input logic clk,
  input logic nrst,
  input logic we,
  input logic re,
  input logic[7:0] raddr1,
  input logic[7:0] raddr2,
  input logic[7:0] waddr,
  input logic[31:0] wdata,
  output logic[31:0] rdataA,
  output logic[31:0] rdataB
);
  
  logic[31:0] mem [255:0]; //Define memory of size to hold 8 elements of 32 VRs
  
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst) begin
      rdataA <= 'hdead_dead;
      rdataB <= 'hdead_dead;
    end
    
    else if (we && !re) begin
      mem[waddr] <= wdata;
      rdataA	 <= rdataA;
      rdataB	 <= rdataB;
    end
    
    else if (re && !we) begin
      rdataA	<= mem[raddr1];
      rdataB	<= mem[raddr2];
      //wdata		<= wdata;
    end
    
    else if(we && re) begin
      mem[waddr]<= wdata;
      rdataA	<= mem[raddr1];
      rdataB	<= mem[raddr2];
    end
    
    else begin
      rdataA	<= rdataA;
      rdataB	<= rdataB;
    end
    
  end
endmodule


      
      
      