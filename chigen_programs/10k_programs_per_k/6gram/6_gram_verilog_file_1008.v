// Seed: 1309737072
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    input  tri0 id_2,
    output wand id_3
);
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_20 = 32'd32
) (
    output wand id_0,
    input supply1 id_1,
    input wand id_2,
    input tri1 id_3,
    output supply0 id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri1 id_7,
    output tri id_8,
    input supply1 id_9,
    input tri1 id_10,
    output supply0 id_11,
    output supply1 id_12,
    output logic id_13,
    output wor id_14,
    input supply1 id_15,
    input tri id_16,
    input wor id_17,
    input supply1 id_18,
    input wand id_19,
    input supply0 _id_20
);
  wire id_22;
  ;
  logic id_23, id_24;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_19,
      id_12
  );
  assign modCall_1.id_2 = 0;
  assign id_0 = id_7;
  tri1 [1 : id_20] id_25;
  wire id_26;
  wire id_27;
  wire id_28, id_29;
  assign id_25 = id_7 && ~(-1);
  assign id_11 = id_24;
  always id_13 = #(id_23  : 1  : id_27) 1'b0;
endmodule
