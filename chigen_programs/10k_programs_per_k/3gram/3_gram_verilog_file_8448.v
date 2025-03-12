// Seed: 2454077812
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    input supply1 id_5
);
  always @(~1);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_0 = 32'd30
) (
    input tri0 _id_0,
    input uwire id_1,
    output supply0 id_2,
    output wand id_3,
    input supply0 id_4
);
  wire [1 : {  id_0  ,  1  ,  1 'd0 }] id_6;
  xnor primCall (id_2, id_4, id_6, id_1);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
