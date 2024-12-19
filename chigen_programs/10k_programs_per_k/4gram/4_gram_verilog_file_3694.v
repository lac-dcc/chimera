// Seed: 225793073
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = 1 ? 1'b0 : id_1 ? id_3 : id_4;
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
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always_latch disable id_11;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_7
  );
  assign modCall_1.id_3 = 0;
endmodule
