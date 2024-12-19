// Seed: 4260046767
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = 1 ? 1 : id_2;
  wire id_3 = id_3;
  wire id_4;
  final $display(1);
endmodule
module module_1 (
    input supply1 id_0,
    input uwire   id_1
);
  wire id_3;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output uwire id_0,
    input uwire id_1,
    output wire id_2,
    input wor id_3,
    output wand id_4,
    input supply0 id_5
    , id_42,
    input tri1 id_6,
    output tri0 id_7,
    output uwire id_8,
    input supply1 id_9,
    input tri1 id_10,
    input supply1 id_11,
    output tri1 id_12,
    input wire id_13,
    output wire id_14,
    input tri id_15,
    input supply1 id_16,
    output supply0 id_17
    , id_43,
    input tri id_18,
    output tri1 id_19,
    output wand id_20,
    input wand id_21
    , id_44,
    input uwire id_22,
    output wire id_23,
    output wand id_24,
    output tri0 id_25,
    output wand id_26,
    input tri1 id_27,
    input tri1 id_28,
    input tri0 id_29,
    output wand id_30,
    input uwire id_31,
    output supply1 id_32,
    output wand id_33,
    input wor id_34,
    output supply0 id_35,
    input uwire id_36,
    output tri0 id_37,
    output wand id_38,
    input supply0 id_39,
    output supply0 id_40
);
  wire id_45;
  wire id_46;
  assign module_3.id_8 = 0;
endmodule
module module_3 (
    output tri   id_0,
    input  wand  id_1,
    input  wand  id_2,
    input  wand  id_3,
    input  logic id_4,
    input  logic id_5,
    inout  wand  id_6,
    input  wire  id_7,
    input  wor   id_8,
    output logic id_9
);
  always
    if (1) id_0 = 1'b0;
    else id_9 <= #1 id_4;
  assign id_9 = id_5;
  nor primCall (id_6, id_7, id_4, id_5, id_3, id_1, id_2, id_8);
  module_2 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_7,
      id_6,
      id_0,
      id_1,
      id_1,
      id_3,
      id_6,
      id_1,
      id_6,
      id_3,
      id_8,
      id_6,
      id_8,
      id_6,
      id_6,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_3,
      id_6,
      id_0,
      id_7,
      id_6,
      id_0,
      id_2,
      id_0,
      id_6,
      id_0,
      id_0,
      id_7,
      id_6
  );
endmodule
