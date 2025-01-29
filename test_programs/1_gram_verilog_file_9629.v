// Seed: 116127267
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4, id_5;
  assign id_4 = id_1;
  logic [7:0] id_6, id_7;
  wire id_8, id_9;
  always_ff id_3 = 1 | id_6[1'b0];
  wire id_10;
endmodule
module module_1 (
    id_1#(.id_2(id_3)),
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7
  );
endmodule
