// edge detect module
// Commandeered from Dr. Saar Drimer (https://www.boldport.com/blog/2015/4/3/edge-detect-ad-nauseam)
module edge_detect(
  input clk,
  // Unspecific inputs and outputs
  // e.g.
  input IN,
  output OUT
  );

  // Very similar to our previous edge detect module:

  reg a, b;

  wire enter;

  // reset unassigned
  assign enter = ~IN;

// the edge detect signal is (b AND (NOT a))
  assign OUT = a & !b;

  always @(posedge clk) begin
    a <= enter;
    b <= a;
  end
endmodule
