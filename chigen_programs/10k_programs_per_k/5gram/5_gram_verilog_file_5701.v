// Seed: 213767503
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    output wire id_2,
    output wand id_3
);
  wire id_5;
  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd52,
    parameter id_5  = 32'd31
) (
    output tri0 id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input tri _id_5,
    output wand id_6
);
  logic id_8, id_9;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_6,
      id_0
  );
  wire id_10, _id_11;
  assign id_0 = id_9[id_11==id_5 : 'b0];
endmodule
