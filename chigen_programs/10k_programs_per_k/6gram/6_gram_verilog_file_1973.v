// Seed: 423798120
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always @(*) id_1 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  int id_5 (
      .id_0(!id_1),
      .id_1(1),
      .id_2(id_1)
  );
  module_0 modCall_1 (
      id_1,
      id_4,
      id_3,
      id_1
  );
  wire id_6;
endmodule
