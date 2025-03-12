// Seed: 1977424664
module module_0 (
    input wire id_0,
    output wor id_1,
    input uwire id_2,
    input supply1 id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri1 id_6,
    input wire id_7,
    output supply1 id_8,
    input tri1 id_9,
    output tri id_10,
    input tri0 id_11,
    input wor id_12,
    output wand id_13,
    input tri0 id_14,
    output supply0 id_15,
    output wor id_16
);
  always @(posedge 1 or -1) begin : LABEL_0
    $unsigned(48);
    ;
  end
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    input supply1 id_2,
    input wire id_3,
    input wor id_4,
    input tri1 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri1 id_9
    , id_14,
    input wor id_10,
    output uwire id_11,
    output tri0 id_12
);
  assign id_11 = 1;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_9,
      id_1,
      id_9,
      id_6,
      id_5,
      id_11,
      id_2,
      id_12,
      id_3,
      id_4,
      id_1,
      id_0,
      id_12,
      id_11
  );
  assign modCall_1.id_12 = 0;
endmodule
