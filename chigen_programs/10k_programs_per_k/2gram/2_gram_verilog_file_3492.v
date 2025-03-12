// Seed: 4277560512
module module_0 (
    input tri id_0,
    input tri id_1,
    input uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wand id_7
);
  wire id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd83
) (
    input wire id_0,
    input tri id_1,
    output tri id_2,
    input supply0 id_3,
    input wor id_4,
    output tri0 id_5
    , _id_10,
    output uwire id_6,
    output tri id_7,
    input wor id_8
);
  localparam id_11 = 1;
  parameter id_12 = id_11[id_10];
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_8,
      id_8,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.id_6 = 0;
  assign id_2 = id_4;
  logic [1 'b0 : -1] id_13;
  ;
endmodule
