// edge detect module
// Commandeered from Dr. Saar Drimer (https://www.boldport.com/blog/2015/4/3/edge-detect-ad-nauseam)
module edge_detect(
  input  clk,
  input IN,
  output OUT
  );

  reg a, b;
  wire reset;
  wire enter;

  // reset unassigned
  assign enter = ~IN;

// the edge detect signal is (b AND (NOT a))
  assign OUT = a & !b;

  always @(posedge clk) begin
    // It's always good to have a reset condition, otherwise
    // the state of the register will show up as undertemined
    // in simulation ('x')
    if (reset) begin
       a <= 0;
       b <= 0;
    end
    else begin
      a <= enter;
      b <= a;
    end
  end
endmodule
