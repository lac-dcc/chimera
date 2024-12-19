// Seed: 1553818242
module module_0;
  wire id_1, id_2;
  for (id_3 = id_2; id_3; id_3 = id_1) assign id_1 = id_3;
  assign id_3 = id_1;
endmodule
module module_1;
  always id_1 <= {1, 1, id_1 ? id_1 : id_1, id_1, 1, 1'b0, 1};
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  logic id_0,
    input  tri0  id_1,
    output logic id_2
);
  id_4 :
  assert property (@(posedge 1'b0) id_4)
  else id_2 <= id_0;
  module_0 modCall_1 ();
  always id_4 = 1 | 1;
  assign id_4 = id_4;
  generate
    wire id_5, id_6;
  endgenerate
endmodule
