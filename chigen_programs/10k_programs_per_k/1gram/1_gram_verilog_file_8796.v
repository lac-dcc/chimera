// Seed: 3073383134
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always if (1) @(*) id_2 <= 1 >>> 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_9(
      id_5, id_4
  );
  always id_6 <= id_2;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
