// Seed: 761925275
module module_0 (
    output tri   id_0,
    input  wor   id_1,
    input  uwire id_2,
    input  wand  id_3,
    output tri0  id_4,
    output tri   id_5
);
  logic id_7;
  ;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    output tri1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    output logic id_5,
    input tri1 id_6,
    output wor id_7
);
  initial begin : LABEL_0
    id_5 <= -1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_7,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_2 = 32'd66
) (
    input uwire id_0,
    output wand id_1,
    output supply1 _id_2
);
  wire id_4[id_2 : 1 'd0];
  ;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
