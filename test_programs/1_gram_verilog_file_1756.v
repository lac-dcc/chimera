// Seed: 2581124651
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input wor id_2,
    input wire id_3,
    output tri0 id_4,
    output tri1 id_5,
    input wor id_6,
    input tri0 id_7,
    output wire id_8,
    output tri1 id_9,
    input supply0 id_10,
    input wand id_11,
    input wand id_12
);
  assign id_4 = 1;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    input wand id_2,
    output tri1 id_3,
    input wand id_4,
    input tri id_5,
    input wand id_6,
    input supply0 id_7,
    input tri1 id_8,
    output tri1 id_9,
    input wire id_10,
    input wire id_11,
    input tri0 id_12,
    input tri id_13
);
  bit id_15;
  always_ff
    if (-1) begin : LABEL_0
      id_0 <= id_15;
    end
  module_0 modCall_1 (
      id_3,
      id_11,
      id_4,
      id_4,
      id_9,
      id_9,
      id_7,
      id_4,
      id_3,
      id_9,
      id_1,
      id_7,
      id_7
  );
  assign modCall_1.id_3 = 0;
  assign id_3 = {id_4, 1, 1, id_1, 1, -1'd0 + -1, 1'b0};
endmodule
