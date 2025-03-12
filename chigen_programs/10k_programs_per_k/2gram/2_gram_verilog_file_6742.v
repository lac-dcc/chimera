// Seed: 638586835
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output wor id_2,
    output tri id_3,
    input tri id_4,
    output supply1 id_5,
    output supply0 id_6,
    input wire id_7,
    input tri1 id_8,
    output uwire id_9,
    output wand id_10,
    input tri1 id_11,
    output tri1 id_12,
    output wor id_13,
    output wor id_14,
    output tri id_15,
    input wire id_16
);
  wire id_18, id_19, id_20, id_21, id_22, id_23, id_24;
  assign id_10 = 1'b0;
  wire id_25;
  wire id_26;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd86
) (
    input uwire id_0,
    input wire id_1,
    input supply0 _id_2,
    input wand id_3,
    output tri0 id_4,
    input wor id_5
);
  wire [id_2 : ~  -1 'b0] id_7;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_4,
      id_5,
      id_3,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0
  );
  localparam id_8 = 1;
endmodule
