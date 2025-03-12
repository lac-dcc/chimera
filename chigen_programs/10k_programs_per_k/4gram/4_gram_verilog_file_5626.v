// Seed: 4151463740
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input supply0 id_3,
    output uwire id_4,
    input wor id_5,
    output uwire id_6,
    input uwire id_7,
    input tri id_8,
    output wand id_9
);
  assign id_0 = id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wor id_3
);
  assign id_1 = $clog2(83);
  ;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3,
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_11 = 32'd14
) (
    input wor id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wor id_4,
    input supply1 id_5,
    output uwire id_6,
    output wire id_7,
    input tri id_8,
    output supply1 id_9
);
  logic [-1 : 1 'b0] _id_11;
  wire [-1 'b0 : id_11] id_12;
  wire id_13;
  module_0 modCall_1 (
      id_9,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_3,
      id_8,
      id_1,
      id_7
  );
  assign modCall_1.id_2 = 0;
  parameter id_14 = -1;
endmodule
