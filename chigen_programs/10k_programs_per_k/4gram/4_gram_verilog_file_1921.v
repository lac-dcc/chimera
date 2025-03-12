// Seed: 1577307960
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input wor id_2,
    input uwire id_3,
    output wor id_4,
    input wire id_5,
    input uwire id_6,
    output tri id_7,
    input wor id_8,
    output wire id_9,
    input uwire id_10,
    output tri0 id_11,
    input supply1 id_12,
    output wand id_13,
    input uwire id_14,
    output tri1 id_15,
    input wire id_16,
    input tri0 id_17,
    output wor id_18,
    input wire id_19,
    output uwire id_20,
    output supply0 id_21,
    input uwire id_22,
    output wand id_23,
    output supply1 id_24,
    input tri0 id_25,
    output wire id_26,
    output tri id_27,
    input tri0 id_28
    , id_30
);
  wire id_31;
  ;
  wire id_32;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri id_4,
    output tri id_5,
    input tri1 id_6,
    output logic id_7,
    input wand id_8,
    input tri0 id_9,
    output wor id_10
);
  wire id_12;
  wire id_13, id_14;
  always @(-1 or posedge id_14) id_7 = 1'b0;
  assign id_10 = -1'd0;
  assign id_13 = id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_5,
      id_4,
      id_10,
      id_0,
      id_10,
      id_4,
      id_10,
      id_0,
      id_5,
      id_6,
      id_3,
      id_5,
      id_3,
      id_5,
      id_10,
      id_6,
      id_10,
      id_10,
      id_4,
      id_10,
      id_10,
      id_1
  );
  logic [-1 : -1] id_15 = id_4;
endmodule
