// Seed: 2647312889
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4,
    input tri1 id_5,
    output uwire id_6,
    output tri id_7,
    output uwire id_8,
    output supply0 id_9,
    input tri id_10,
    output wand id_11,
    output tri1 id_12,
    output wor id_13,
    output wor id_14,
    output supply1 id_15,
    output tri id_16,
    input tri1 id_17,
    output wor id_18,
    input supply1 id_19,
    input supply1 id_20,
    input wire id_21,
    input tri1 id_22,
    input tri0 id_23,
    input wand id_24,
    input supply0 id_25,
    output tri0 id_26,
    input supply0 id_27,
    output supply1 id_28,
    input tri0 id_29,
    input wand id_30,
    output wire id_31,
    input tri id_32,
    output supply0 id_33,
    input wor id_34,
    input wand id_35,
    output supply1 id_36,
    output tri0 id_37,
    output uwire id_38,
    input wand id_39,
    input supply1 id_40,
    input wire id_41,
    output tri1 id_42,
    input uwire id_43
);
  wire id_45;
  wire id_46;
  assign (supply1, highz0) id_12 = 1 - id_3;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  wire  id_3
);
  wire id_5;
  case (id_3)
    -1:   wire id_6, id_7, id_8;
    id_1: wire id_9, id_10;
  endcase
  id_11(
      !-1
  );
  wire id_12 = !id_3;
  wire id_13 = id_5;
  parameter real id_14 = 1;
  wire id_15;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_3,
      id_3,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.type_16 = 0;
endmodule
