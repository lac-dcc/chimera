// Seed: 1710353876
module module_0 (
    input tri id_0,
    input wor id_1,
    input wand id_2,
    output uwire id_3,
    output supply0 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input supply0 id_7
);
  assign id_5 = id_6;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input tri id_0,
    output tri id_1,
    input supply1 id_2
);
  wire [1 : 1] id_4;
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0
  );
endmodule
module module_2 #(
    parameter id_0 = 32'd89
) (
    input  wand  _id_0,
    output uwire id_1,
    input  wand  id_2,
    output uwire id_3,
    input  wire  id_4
);
  wire [1 : id_0] id_6;
  wire id_7;
  wire id_8;
  wire id_9, id_10, id_11;
  logic id_12;
  logic id_13;
  ;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_1,
      id_1,
      id_3,
      id_4,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
