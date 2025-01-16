// Seed: 3638947576
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    output uwire id_2,
    input tri id_3,
    output wand id_4,
    output wire void id_5,
    input uwire id_6
);
  time id_8;
  initial assume (id_0) #id_9 id_8 = id_6;
  wire id_10;
  wire id_11, id_12, id_13;
  wire id_14;
endmodule
program module_1 (
    input logic id_0,
    input tri0 id_1,
    inout uwire id_2,
    input supply0 id_3,
    input tri id_4,
    output logic id_5,
    output wand id_6,
    input wire id_7,
    input wire id_8,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    input wor id_12,
    input tri id_13,
    input tri0 id_14,
    input supply1 id_15,
    input tri0 id_16,
    output supply1 id_17,
    input tri0 id_18,
    input uwire id_19,
    input supply0 id_20,
    input uwire id_21,
    output supply1 id_22
);
  assign id_5 = -1'b0;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_20,
      id_22,
      id_22,
      id_10,
      id_2,
      id_2,
      id_13
  );
  assign modCall_1.id_1 = 0;
  always_ff begin : LABEL_0
    id_5 <= id_0;
  end
  wire id_24, id_25, id_26;
  assign id_5 = 1;
endmodule
