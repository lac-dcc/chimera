// Seed: 4219499510
module module_0 (
    output wor id_0,
    input tri id_1,
    output supply1 id_2,
    output supply0 id_3
    , id_23,
    input supply0 id_4,
    output supply0 id_5,
    input tri0 id_6,
    output tri0 id_7,
    input tri0 id_8,
    input uwire id_9,
    output wor id_10,
    input wor id_11,
    input supply1 id_12,
    input tri1 id_13,
    input wire id_14,
    input wor id_15,
    output wire id_16,
    input uwire id_17,
    input uwire id_18,
    input wire id_19,
    output uwire id_20,
    output uwire id_21
);
  assign id_10 = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd19
) (
    output supply0 id_0,
    input supply1 id_1,
    input tri1 _id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    output wand id_6
);
  assign id_5 = 1;
  parameter [-1 'b0 : id_2  - ""] id_8 = -1;
  or primCall (id_6, id_3, id_8, id_1);
  always @(negedge 1 or 1) begin : LABEL_0
    disable id_9;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_6,
      id_0,
      id_4,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_0,
      id_4,
      id_3,
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_7 = 0;
endmodule
