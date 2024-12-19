// Seed: 1087378850
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
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_11;
  assign id_4 = id_11;
endmodule
module module_1 (
    output supply1 id_0,
    output wire id_1,
    output supply0 id_2,
    output wor id_3,
    input tri1 id_4,
    output supply0 id_5,
    input wand id_6,
    input supply1 id_7,
    input supply0 id_8,
    input tri1 id_9,
    input uwire id_10,
    input wire id_11,
    output wand id_12,
    input supply1 id_13,
    output wand id_14,
    input tri id_15,
    output wand id_16,
    output wor id_17,
    output tri0 id_18,
    input uwire id_19,
    input wor id_20
);
  wire id_22;
  uwire id_23 = id_6;
  logic [7:0] id_24;
  wire id_25;
  wire id_26;
  assign id_2  = id_6;
  assign id_2  = 1;
  assign id_16 = id_15;
  assign id_18 = {1'b0{id_24[1'd0]}} == id_7;
  or primCall (
      id_17, id_22, id_23, id_15, id_27, id_11, id_9, id_6, id_26, id_4, id_19, id_25, id_24
  );
  wire id_27;
  module_0 modCall_1 (
      id_26,
      id_27,
      id_26,
      id_25,
      id_27,
      id_22,
      id_25,
      id_25,
      id_25,
      id_22
  );
endmodule
