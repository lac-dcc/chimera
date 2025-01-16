// Seed: 2076529235
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_7(
      .id_0(id_1),
      .id_1(id_5 & -1),
      .id_2({""{-1 <-> -1'd0}}),
      .id_3(id_2),
      .id_4(1),
      .id_5(1),
      .id_6(id_3)
  );
  wire id_8;
  id_9 :
  assert property (@(negedge id_9) id_1 * id_9 - -1);
endmodule
module module_1 (
    input wire  id_0,
    input uwire id_1,
    input uwire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
