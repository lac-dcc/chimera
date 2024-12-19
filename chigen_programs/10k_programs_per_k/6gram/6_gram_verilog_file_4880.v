// Seed: 2787019339
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(*) begin : LABEL_0
    if (1)
      #1 begin : LABEL_0
        disable id_16;
      end
  end
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
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4[1] = id_8;
  uwire id_12 = 1;
  assign id_11[1] = 1;
  and primCall (id_2, id_13, id_9, id_3, id_7, id_14, id_10, id_5, id_8);
  wand id_13, id_14;
  assign id_5 = id_1 ? 1 : id_14;
  module_0 modCall_1 (
      id_8,
      id_13,
      id_13,
      id_7,
      id_5,
      id_8,
      id_6,
      id_14,
      id_12,
      id_2,
      id_13,
      id_2,
      id_2,
      id_14,
      id_12
  );
endmodule
