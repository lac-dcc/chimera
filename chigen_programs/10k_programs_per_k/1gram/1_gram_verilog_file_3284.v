// Seed: 2622512525
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output supply1 id_2,
    output tri0 id_3,
    input wand id_4,
    input wire id_5,
    input supply1 id_6
);
  logic id_8;
  always
    if (1'b0) begin : LABEL_0
      id_8 <= 1 !== id_5 & 1;
    end
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input wand id_2,
    input tri id_3,
    input uwire id_4,
    input supply1 id_5,
    input uwire id_6,
    input wand id_7
);
  wire id_9;
  wire id_10, id_11, id_12;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_1,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
