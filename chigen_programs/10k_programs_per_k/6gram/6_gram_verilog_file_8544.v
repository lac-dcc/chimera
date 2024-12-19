// Seed: 19900568
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_2,
      id_9,
      id_6,
      id_4,
      id_7,
      id_2,
      id_8,
      id_3,
      id_9,
      id_6,
      id_6,
      id_2
  );
  id_10(
      .id_0(id_4 == 1), .id_1(1'b0)
  );
  assign id_1[1'b0] = id_4;
endmodule
