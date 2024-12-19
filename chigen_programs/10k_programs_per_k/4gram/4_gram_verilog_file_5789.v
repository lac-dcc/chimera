// Seed: 3460088641
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input wire id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wor id_5
    , id_9,
    input wire id_6,
    input supply1 id_7
);
  uwire id_10 = id_7;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input uwire id_2,
    output tri id_3,
    output supply1 id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    input wire id_8,
    output tri1 id_9,
    input uwire id_10,
    input tri1 id_11,
    input supply0 id_12,
    input wire id_13
);
  always_ff @(id_13) begin : LABEL_0
    if (id_5) id_1 <= 1;
  end
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_7,
      id_5,
      id_8,
      id_6,
      id_13
  );
  generate
    assign id_3 = 1;
  endgenerate
endmodule
