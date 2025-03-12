// Seed: 911667785
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    output tri1 id_3,
    output supply1 id_4,
    output wand id_5,
    input wire id_6,
    input supply1 id_7,
    input uwire id_8,
    input wand id_9,
    output tri0 id_10,
    output uwire id_11,
    input wire id_12
);
  generate
    logic id_14;
    ;
  endgenerate
  assign id_14 = 1;
  parameter id_15 = 1;
  logic id_16;
  wire [-1 : 1] id_17;
  wire id_18;
  assign id_3 = id_6;
  wire [-1 : ""] id_19;
  parameter id_20 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd15
) (
    output tri id_0[id_1 : -1],
    input tri1 _id_1,
    input wand id_2,
    input supply1 id_3
);
  localparam id_5 = 1;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3,
      id_2,
      id_2,
      id_3,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
