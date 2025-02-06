// Seed: 2604250121
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_9;
  assign id_1 = id_10;
  wire id_11;
  assign module_1.id_3 = 0;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_2 ? id_3 : $realtime;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_5,
      id_4,
      id_2,
      id_1,
      id_5,
      id_2,
      id_5
  );
  id_6(
      .id_0(id_4), .id_1(1 & id_1)
  );
  wire id_7;
endmodule
