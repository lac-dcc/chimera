// Seed: 3161077727
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout supply1 id_1;
  assign id_1 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output reg id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_4;
  initial id_5 <= id_4 < 1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_3,
      id_4,
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
