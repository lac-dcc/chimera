// Seed: 3846037009
module module_0 (
    input tri1 id_0,
    input wor id_1,
    output tri id_2,
    input tri0 id_3,
    output supply1 id_4,
    input tri1 id_5,
    output wor id_6,
    input wand id_7,
    input supply1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    output supply1 id_11,
    input wire id_12,
    input supply1 id_13,
    input tri1 id_14,
    input tri id_15,
    output tri0 id_16
);
  assign id_2 = id_15 * id_0 ? id_12 : 1;
  assign module_1.id_3 = 0;
  wire id_18;
  always @(posedge 1) begin : LABEL_0
    id_6 = 1;
  end
endmodule
module module_1 (
    input tri0 id_0,
    output wand id_1,
    input wire id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input uwire id_6,
    output tri id_7,
    output wor id_8,
    output tri id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_2,
      id_7,
      id_2,
      id_8,
      id_6,
      id_3,
      id_6,
      id_3,
      id_8,
      id_6,
      id_3,
      id_4,
      id_4,
      id_7
  );
endmodule
