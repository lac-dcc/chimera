// Seed: 2538550102
module module_0 (
    input tri id_0,
    input wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input tri id_9,
    input wand id_10,
    output supply1 id_11,
    input wand id_12,
    input wire id_13,
    output wand id_14
);
  wire id_16;
  wire id_17;
  always @(posedge 1 or 1) begin : LABEL_0
    id_3 = 1;
  end
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri id_4,
    output uwire id_5
);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_5,
      id_3,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_0,
      id_5,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.type_4 = 0;
  assign id_5 = id_0;
endmodule
