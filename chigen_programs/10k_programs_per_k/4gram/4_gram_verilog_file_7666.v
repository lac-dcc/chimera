// Seed: 2968881472
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
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1'b0 * id_7 - 1 ? 1 : id_3;
  wire id_8;
  id_9(
      .id_0(1),
      .id_1(""),
      .id_2(1),
      .id_3(1),
      .id_4(1'b0),
      .id_5(1 * 1 - id_1),
      .id_6(id_5),
      .id_7(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4, id_5;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_1
  );
endmodule
