// Seed: 1135406595
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input uwire id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    output supply1 id_6,
    input supply1 id_7,
    input tri id_8
);
  supply1 id_10 = id_1;
  assign module_1.type_0 = 0;
  assign id_6 = (1);
  always_latch @(1 or posedge 1) begin : LABEL_0
    id_6 = 1 + {id_1, 1} - id_8 == id_7;
  end
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    output tri1 id_0,
    output wor  id_1,
    input  tri  id_2
);
  wire id_4;
  wand id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
endmodule
