// Seed: 2097584672
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_8(
      .id_0(), .id_1(1), .id_2(1)
  );
  wire id_9, id_10;
  assign id_5 = 1;
  assign id_2 = 1;
  tri0 id_11, id_12, id_13;
  always foreach (id_14) id_9 = ~1;
  id_15 :
  assert property (@(posedge 1'd0) (id_12))
  else if (1) @(*) $display(id_7, ~1, id_15, id_12);
  wire id_16;
  wire id_17;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_11 = 0;
endmodule
