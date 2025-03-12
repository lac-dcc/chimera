// Seed: 4151310536
module module_0 (
    input supply1 id_0,
    output wor id_1,
    output tri0 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri id_6,
    output wand id_7,
    output wand id_8
);
  always @(posedge 1'd0) begin : LABEL_0
    force id_2 = id_5;
  end
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input wire id_2,
    input tri1 id_3,
    output tri1 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wor id_7,
    output uwire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_4,
      id_1,
      id_5,
      id_5,
      id_6,
      id_4,
      id_8
  );
  assign modCall_1.id_5 = 0;
endmodule
