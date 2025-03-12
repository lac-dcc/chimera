// Seed: 1987871503
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input wand id_4,
    input tri id_5,
    output wor id_6,
    input uwire id_7,
    output logic id_8,
    output logic id_9,
    output supply1 id_10
);
  always_comb @(posedge id_5) begin : LABEL_0
    id_8 = 1;
    if (1) id_9 <= id_0;
  end
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output logic id_4,
    input uwire id_5,
    input supply1 id_6
    , id_16,
    input tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input tri0 id_10,
    output uwire id_11,
    input wand id_12,
    output wor id_13,
    output tri0 id_14
);
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_4 <=
      id_14#(
          .id_6 (1),
          .id_0 (1),
          .id_12(-1'b0 == 1),
          .id_6 (1),
          .id_9 (!1),
          .id_8 (1)
      )++
      == id_10;
    end else id_16 <= 1;
  end
  module_0 modCall_1 (
      id_6,
      id_14,
      id_2,
      id_5,
      id_5,
      id_3,
      id_11,
      id_12,
      id_4,
      id_4,
      id_14
  );
  assign modCall_1.id_10 = 0;
  assign id_1 = -1;
endmodule
