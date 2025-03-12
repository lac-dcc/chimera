// Seed: 2313744102
module module_0 (
    input  tri   id_0,
    output uwire id_1,
    input  uwire id_2
);
  assign id_1 = 1;
  wire id_4;
  assign id_1 = -1;
  assign module_1.id_0 = 0;
  bit id_5;
  ;
  assign id_1 = 1 * id_0;
  always id_5 <= ~-1;
  logic   id_6;
  integer id_7;
  ;
  always id_6 <= id_0;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wand id_4,
    output supply1 id_5,
    input tri1 id_6,
    input wor id_7
);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4
  );
  initial begin : LABEL_0
    return id_7 ? 1'b0 && id_4 : -1;
  end
  nand primCall (id_5, id_4, id_6, id_3, id_0, id_1, id_7);
endmodule
