// Seed: 4048966096
module module_0 (
    output supply1 id_0,
    output wor id_1,
    input supply0 id_2,
    input wor id_3,
    input supply1 id_4,
    input tri id_5,
    input wire id_6,
    output tri id_7,
    input uwire id_8,
    output tri0 id_9,
    output wand id_10
);
  tri0 id_12 = id_2 ^ (id_6) ? 1 * id_12 !== 1 : id_8;
  assign id_7 = id_12;
  assign id_9 = 1;
  always @(posedge 1) begin : LABEL_0
    if (1) $display(1);
  end
endmodule
module module_1 (
    input  wand id_0,
    output tri1 id_1
);
  wand id_3;
  assign id_1 = 1;
  wire id_4;
  integer id_5;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
