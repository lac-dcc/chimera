// Seed: 664743001
module module_0 (
    output supply1 id_0,
    input wire id_1,
    input supply0 id_2,
    output supply1 id_3,
    input uwire id_4,
    input wand id_5,
    input tri1 id_6,
    input uwire id_7,
    output supply0 id_8,
    output wire id_9,
    input tri1 id_10,
    output supply0 id_11,
    input wire id_12
    , id_24,
    input wor id_13,
    output wire id_14,
    input tri id_15,
    output supply1 id_16,
    input wand id_17,
    input wire id_18,
    output uwire id_19,
    input wand id_20,
    input wor id_21,
    input uwire id_22
);
  assign id_11 = 1;
  assign module_1.type_27 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    input  wand  id_2,
    input  wand  id_3,
    input  tri   id_4,
    input  uwire id_5,
    output uwire id_6,
    input  logic id_7,
    input  uwire id_8,
    input  uwire id_9
    , id_12,
    input  uwire id_10
);
  supply0 id_13;
  assign id_1 = 1;
  wire id_14, id_15, id_16;
  wire id_17;
  wire id_18, id_19, id_20 = id_13, id_21, id_22;
  module_0 modCall_1 (
      id_1,
      id_10,
      id_8,
      id_1,
      id_9,
      id_2,
      id_4,
      id_3,
      id_6,
      id_6,
      id_9,
      id_1,
      id_10,
      id_5,
      id_6,
      id_10,
      id_1,
      id_10,
      id_10,
      id_6,
      id_4,
      id_0,
      id_10
  );
  always begin : LABEL_0
    id_18 = ~id_5;
    id_12 <= id_7;
  end
  wire id_23, id_24;
  assign id_20 = 1;
endmodule
