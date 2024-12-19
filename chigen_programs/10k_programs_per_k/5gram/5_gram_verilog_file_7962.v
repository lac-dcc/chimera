// Seed: 1627995672
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
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_8;
  genvar id_9;
  id_10(
      .id_0(id_8),
      .id_1(id_7),
      .id_2(id_9 != id_8),
      .id_3(id_5),
      .id_4(!id_7),
      .id_5(id_1 == 1),
      .id_6((1) == 1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_3,
      id_6,
      id_3,
      id_2
  );
  wire id_8;
  wire id_9 = id_6;
endmodule
