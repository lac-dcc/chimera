// Seed: 854145322
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output wor id_2,
    input uwire id_3,
    output tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wor id_7,
    input wire id_8,
    output wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    input wand id_12
);
  wire id_14;
  logic [-1 : -1] id_15;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri id_5
);
  logic id_7;
  assign id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_12 = 0;
  always @(negedge -1) begin : LABEL_0
    deassign id_7;
  end
endmodule
