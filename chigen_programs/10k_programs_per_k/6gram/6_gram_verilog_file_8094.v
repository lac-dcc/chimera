// Seed: 2092167120
module module_0 (
    input wire id_0,
    input wand id_1,
    input tri id_2,
    input wor id_3,
    input supply0 id_4,
    input supply1 id_5
);
endmodule
module module_1 (
    output wand id_0,
    output supply0 id_1,
    output supply1 id_2,
    output tri1 id_3,
    output tri0 id_4,
    input tri id_5
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
module module_2 (
    output wire id_0,
    input  wire id_1,
    inout  tri0 id_2
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_7 = 0;
  bit id_4;
  ;
  assign id_2 = id_4 & id_4 ? {-1'b0 - id_4, id_1 != 1, id_2, -1} : 1;
  always @(-1 == -1 or negedge id_2) begin : LABEL_0
    id_4 <= -1;
  end
endmodule
