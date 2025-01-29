// Seed: 664550946
module module_0 (
    id_1#(.id_2(-1)),
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  tri0 id_10, id_11 = 1;
  wire id_12;
  tri  id_13 = id_3, id_14 = (id_11), id_15;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_10 = 0;
  supply0 id_6 = 1, id_7;
endmodule
