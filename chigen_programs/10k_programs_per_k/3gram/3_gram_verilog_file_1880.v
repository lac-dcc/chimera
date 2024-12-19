// Seed: 3070610068
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
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_11;
  assign id_11[1] = 1 - 1;
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  assign module_1.id_3 = 0;
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
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wand id_10;
  wire id_11;
  always @(id_8 / 1'b0 or posedge id_10) id_5 <= 1;
  and primCall (id_6, id_8, id_1, id_2, id_4, id_10, id_3, id_9, id_7);
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_7,
      id_7,
      id_10,
      id_11,
      id_6,
      id_3,
      id_11
  );
  assign id_3 = id_8;
  id_12 :
  assert property (@(posedge id_6) id_4)
  else id_6 = 1;
  wire id_13;
  always @(posedge id_1);
  wire id_14 = id_14;
  wire id_15;
endmodule
