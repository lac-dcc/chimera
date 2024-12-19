// Seed: 2670412529
module module_0 (
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
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri0 id_10 = 1'b0 <= id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_7,
      id_3,
      id_6,
      id_1,
      id_7,
      id_2,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
