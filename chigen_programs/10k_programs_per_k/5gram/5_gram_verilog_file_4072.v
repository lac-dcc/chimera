// Seed: 3744409208
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = 1;
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
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5[1'd0] = 1'd0;
  and primCall (id_9, id_6, id_7, id_10, id_8, id_2, id_12, id_3, id_1, id_4);
  assign id_3 = id_7;
  assign id_9 = id_6;
  wire  id_10;
  wire  id_11;
  wor   id_12 = id_11;
  uwire id_13;
  initial id_12 = 1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_3,
      id_12,
      id_13,
      id_7,
      id_13
  );
  assign modCall_1.id_5 = 0;
  assign {"", id_1++, 1'b0, 1'b0} = id_13 == id_12;
  wire id_14;
  assign id_1 = id_4 & 1;
endmodule
