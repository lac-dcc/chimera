// Seed: 4288352633
module module_0 (
    input supply1 id_0,
    output wire id_1,
    input wire id_2,
    output supply1 id_3,
    output tri1 id_4,
    input uwire id_5,
    output tri0 id_6,
    input wand id_7,
    output tri1 id_8,
    output tri id_9
);
  always @(-1 or id_0) begin : LABEL_0
    fork
      id_11;
    join
  end
  wire id_12;
  wire id_13;
  assign id_3 = !id_12;
endmodule
module module_1 (
    output wand id_0,
    output supply0 id_1,
    input wor id_2,
    output wor id_3,
    input tri id_4,
    output uwire id_5,
    output supply0 id_6,
    output supply0 id_7,
    input wand id_8,
    input supply1 id_9,
    input tri1 id_10
    , id_19,
    input uwire id_11,
    input wand id_12,
    input tri1 id_13,
    input wor id_14,
    input uwire id_15,
    output supply1 id_16,
    input tri id_17
);
  assign id_6 = id_2;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_12,
      id_5,
      id_1,
      id_8,
      id_7,
      id_9,
      id_5,
      id_3
  );
  assign modCall_1.id_9 = 0;
endmodule
