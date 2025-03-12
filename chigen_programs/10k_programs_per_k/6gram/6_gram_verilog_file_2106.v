// Seed: 2569020174
module module_0 (
    output wor id_0,
    output tri id_1,
    output tri id_2,
    input wand id_3,
    input supply1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    output tri id_7
);
  always force id_1 = id_6;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input uwire id_2,
    output supply1 id_3,
    output tri0 id_4,
    input wand id_5
    , id_20,
    input tri id_6
    , id_21,
    output tri1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri id_10,
    input uwire id_11
    , id_22,
    input tri1 id_12,
    output wor id_13,
    output logic id_14,
    input supply1 id_15,
    input uwire id_16,
    output uwire id_17,
    input wire id_18
    , id_23
);
  always @(posedge id_21) begin : LABEL_0
    id_14 = #id_24  ~id_15;
  end
  module_0 modCall_1 (
      id_17,
      id_3,
      id_13,
      id_10,
      id_11,
      id_4,
      id_0,
      id_17
  );
  assign modCall_1.id_5 = 0;
endmodule
