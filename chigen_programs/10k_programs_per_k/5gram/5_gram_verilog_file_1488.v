// Seed: 3333802986
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri id_4,
    input wor id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input uwire id_9,
    output tri0 id_10,
    input tri id_11
    , id_18,
    input tri id_12,
    output supply0 id_13,
    output wor id_14,
    input tri0 id_15,
    input uwire id_16
);
  wire id_19;
  always @(posedge 1 or posedge id_1) begin : LABEL_0
    assume (id_0);
    if (1 == -1) disable id_20;
  end
  assign id_18 = id_5;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    input supply1 id_2,
    input uwire id_3,
    output supply0 id_4,
    input wand id_5,
    input tri0 id_6,
    output wor id_7,
    output wire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_8,
      id_5,
      id_5,
      id_8,
      id_1,
      id_1,
      id_1,
      id_7,
      id_2,
      id_2,
      id_8,
      id_8,
      id_3,
      id_5
  );
  assign modCall_1.id_11 = 0;
endmodule
