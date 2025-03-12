// Seed: 166854534
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = -1'b0 ^ id_2 ? -1 - ~id_3 : id_1;
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
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_9,
      id_2,
      id_5,
      id_9,
      id_9
  );
  inout logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  nand primCall (id_7, id_9, id_8, id_2, id_5, id_11);
  input wire id_2;
  output wire id_1;
  assign id_7[1] = id_8;
endmodule
