// Seed: 1440845613
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
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  supply1 id_11 = 1;
  tri0 id_12, id_13;
  assign id_11 = id_12 & 1;
  assign id_13 = {id_11 ^ id_10} == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1[1] = 1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_3,
      id_2,
      id_4,
      id_3
  );
endmodule
