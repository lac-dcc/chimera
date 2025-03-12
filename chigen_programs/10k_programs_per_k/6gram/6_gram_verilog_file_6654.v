// Seed: 3724468854
module module_0 (
    output wire id_0,
    output wand id_1,
    output tri0 id_2,
    input tri0 id_3
    , id_16,
    input wor id_4,
    output tri1 id_5,
    output tri0 id_6,
    input tri1 id_7,
    output supply0 id_8,
    input supply1 id_9,
    output tri1 id_10,
    output wor id_11,
    input wand id_12,
    output tri1 id_13,
    output wand id_14
);
  assign id_16[-1'b0] = id_3;
endmodule
module module_1 (
    output wire  id_0,
    input  tri   id_1,
    output logic id_2,
    output tri   id_3,
    input  tri0  id_4,
    output tri   id_5
);
  wire id_7;
  always @(posedge id_1) begin : LABEL_0
    id_2 <= id_7;
    wait (-1);
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_1,
      id_1,
      id_0,
      id_5,
      id_1,
      id_0,
      id_4,
      id_3,
      id_0,
      id_4,
      id_0,
      id_3
  );
  assign modCall_1.id_11 = 0;
endmodule
