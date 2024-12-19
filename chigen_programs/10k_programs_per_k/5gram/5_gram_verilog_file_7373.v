// Seed: 1715493308
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  generate
    assign id_4 = id_3;
  endgenerate
endmodule
module module_1 (
    input wor  id_0,
    input wire id_1
);
  assign id_3 = id_0;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
  id_6 :
  assert property (@(posedge 1) id_3 == id_3)
  else $display($display);
endmodule
