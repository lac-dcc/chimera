// Seed: 2571799528
module module_0 (
    input  tri1  id_0,
    input  wand  id_1,
    output tri0  id_2,
    input  tri0  id_3,
    input  tri0  id_4,
    input  tri1  id_5,
    input  uwire id_6,
    input  wire  id_7,
    output uwire id_8
);
  assign module_1.id_24 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri id_2,
    output uwire id_3,
    output wand id_4,
    input supply1 id_5,
    output supply1 id_6,
    input tri id_7,
    output uwire id_8,
    output uwire id_9,
    input uwire id_10
    , id_27,
    output tri1 id_11,
    input wor id_12,
    input tri0 id_13,
    output uwire id_14,
    input uwire id_15,
    input wire id_16,
    input wand id_17,
    input uwire id_18,
    output tri0 id_19
    , id_28,
    input wire id_20,
    input tri1 id_21,
    output uwire id_22
    , id_29,
    input tri1 id_23,
    inout supply0 id_24
    , id_30,
    output wire id_25
);
  wire id_31;
  nor primCall (
      id_6,
      id_23,
      id_10,
      id_7,
      id_17,
      id_15,
      id_13,
      id_18,
      id_27,
      id_31,
      id_2,
      id_16,
      id_28,
      id_29,
      id_5,
      id_21,
      id_20,
      id_30,
      id_24,
      id_0,
      id_12
  );
  module_0 modCall_1 (
      id_18,
      id_24,
      id_11,
      id_15,
      id_13,
      id_0,
      id_10,
      id_21,
      id_6
  );
  always $display;
endmodule
