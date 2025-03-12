// Seed: 39518848
module module_0 (
    input supply0 id_0,
    output wand id_1
);
endmodule
module module_1 #(
    parameter id_10 = 32'd96
) (
    input uwire id_0[id_10 : -1],
    output wire id_1,
    input supply0 id_2,
    input wire id_3,
    input uwire id_4,
    input tri0 id_5,
    input wand id_6,
    input wand id_7,
    output tri0 id_8,
    input wor id_9,
    input wand _id_10
);
  logic id_12 = -1;
  module_0 modCall_1 (
      id_2,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input supply1 id_0,
    output tri0 id_1,
    output supply1 id_2,
    output tri id_3,
    output supply0 id_4,
    input uwire id_5,
    input tri0 id_6
);
  logic id_8;
  logic id_9;
  logic id_10;
  ;
  assign id_10 = id_6;
  module_0 modCall_1 (
      id_6,
      id_2
  );
  struct packed {
    integer id_11;
    logic   id_12;
  } id_13;
  union packed {
    logic id_14 = 1;
    logic id_15[1 : 1  |  1];
  } id_16;
  wire id_17;
  ;
  logic id_18;
endmodule
