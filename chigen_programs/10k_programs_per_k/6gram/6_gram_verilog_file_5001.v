// Seed: 4171510051
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input wand id_2,
    input tri1 id_3,
    output tri id_4,
    output uwire id_5,
    input wor id_6,
    input tri id_7,
    output supply0 id_8,
    input tri id_9,
    output wor id_10,
    output wire id_11,
    output tri0 id_12,
    input wor id_13
);
  wire id_15;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output wand id_2,
    input supply0 id_3,
    output wire id_4,
    input supply0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    output wor id_8,
    input tri0 id_9,
    output uwire id_10
    , id_14,
    input tri0 id_11,
    output wand id_12
    , id_15
);
  assign id_14 = 1'b0;
  always @(id_0) begin : LABEL_0
    deassign id_2;
  end
  initial assume (1);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_11,
      id_6,
      id_4,
      id_4,
      id_7,
      id_5,
      id_1,
      id_5,
      id_1,
      id_10,
      id_10,
      id_6
  );
endmodule
