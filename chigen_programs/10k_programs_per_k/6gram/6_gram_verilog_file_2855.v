// Seed: 2555365033
module module_0 ();
  generate
    for (id_1 = 1'b0; 1; id_1 = id_1) begin : id_2
      always @(posedge "" + id_1) id_1 = 1 - 1;
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_3 ? 1 : 1'h0 ? id_4 : id_3 ? 1 : id_4 ? id_3 ^ 1 : id_4;
  always @(1'b0 or posedge 1) id_2 = id_3;
  module_0();
endmodule
