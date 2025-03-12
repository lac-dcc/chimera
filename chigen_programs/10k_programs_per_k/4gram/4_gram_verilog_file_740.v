// Seed: 4273772643
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input tri1 id_2,
    output wor id_3,
    output tri0 id_4,
    output uwire id_5,
    output tri0 id_6,
    input wand id_7,
    input supply0 id_8,
    input wire id_9,
    output wand id_10,
    input supply0 id_11,
    input supply1 id_12,
    output uwire id_13,
    output wand id_14,
    output wor id_15,
    output tri0 id_16
);
endmodule
module module_1 #(
    parameter id_10 = 32'd4
) (
    input wor id_0,
    output wor id_1,
    input uwire id_2,
    output uwire id_3,
    input uwire id_4,
    input tri id_5,
    input tri id_6,
    input supply0 id_7,
    input uwire id_8,
    output logic id_9,
    output wand _id_10,
    input supply0 id_11,
    input supply0 id_12
);
  assign id_9 = -1;
  logic [7:0][-1 : ~  id_10] id_14, id_15, id_16, id_17;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_2,
      id_3,
      id_1,
      id_3,
      id_1,
      id_4,
      id_0,
      id_12,
      id_3,
      id_8,
      id_6,
      id_1,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.id_11 = 0;
  initial begin : LABEL_0
    id_9 <= id_4;
  end
  assign id_3 = ~id_0;
  assign id_17[-1] = id_12 === id_14 < id_6;
  wire id_18;
endmodule
