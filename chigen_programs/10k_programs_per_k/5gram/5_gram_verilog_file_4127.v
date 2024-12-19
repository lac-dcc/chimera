// Seed: 798120363
module module_0 (
    input wand id_0,
    input wor id_1,
    input tri0 id_2,
    output wand id_3,
    output supply0 id_4,
    input tri1 id_5,
    input wor id_6,
    input supply0 id_7,
    output uwire id_8,
    output wor id_9,
    input uwire id_10,
    input wor id_11,
    output supply1 id_12,
    input wor id_13,
    input wor id_14,
    input wire id_15,
    input tri id_16
);
  assign id_4 = id_3++;
endmodule
module module_1 (
    input  wor  id_0,
    output wor  id_1,
    output wire id_2
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_18 = 0;
  assign id_1 = id_0 + id_0;
  reg id_4;
  always @(*) begin : LABEL_0
    id_4 <= 1;
  end
endmodule
