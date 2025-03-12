// Seed: 2629652772
module module_0 (
    input uwire id_0,
    output wire id_1,
    input tri id_2,
    input tri id_3,
    input wire id_4,
    input supply1 id_5,
    input supply0 id_6,
    output uwire id_7,
    input uwire id_8,
    output tri0 id_9,
    input tri0 id_10,
    output tri id_11,
    input tri0 id_12,
    output wor id_13,
    input wand id_14
);
  if (1'b0) begin : LABEL_0
    assign id_9 = id_6;
  end
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output wire id_4,
    output wire id_5,
    output supply1 id_6,
    output tri1 id_7,
    input wire id_8,
    output wor id_9,
    input wor id_10,
    input tri0 id_11,
    input tri1 id_12,
    input tri id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_11,
      id_13,
      id_1,
      id_0,
      id_0,
      id_4,
      id_1,
      id_5,
      id_1,
      id_7,
      id_10,
      id_6,
      id_8
  );
  assign modCall_1.id_0 = 0;
endmodule
