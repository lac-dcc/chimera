// Seed: 1498265851
module module_0 (
    input supply0 id_0,
    input supply0 id_1
    , id_21,
    output tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri id_8,
    input wor id_9,
    output wand id_10,
    input supply0 id_11,
    output wor id_12,
    input wand id_13,
    output supply1 id_14,
    output tri1 id_15,
    input supply1 id_16,
    input supply1 id_17,
    input tri0 id_18,
    output supply0 id_19
);
  id_22(
      .id_0(id_0++)
  );
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output supply1 id_2,
    input logic id_3,
    output supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    output logic id_7
);
  always @(1) begin : LABEL_0
    id_7 <= id_3;
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_0,
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_0,
      id_4,
      id_5,
      id_1,
      id_6,
      id_2,
      id_2,
      id_0,
      id_0,
      id_5,
      id_2
  );
endmodule
