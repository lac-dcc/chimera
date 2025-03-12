// Seed: 1046928933
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    output wire id_4,
    inout tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    output supply1 id_8
);
  parameter id_10 = 1;
  wire id_11 = id_6;
  parameter id_12 = 1;
  wire [1 : -1 'b0] id_13;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input tri1 id_2,
    input uwire id_3,
    output tri1 id_4,
    output wire id_5,
    output tri id_6,
    inout supply1 id_7,
    input tri0 id_8,
    input wand id_9,
    output tri id_10,
    input wor id_11,
    input uwire id_12,
    input uwire id_13,
    input wire id_14,
    input tri0 id_15,
    input supply1 id_16
);
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_0,
      id_2,
      id_4,
      id_7,
      id_13,
      id_7,
      id_6
  );
  assign modCall_1.id_7 = 0;
endmodule
