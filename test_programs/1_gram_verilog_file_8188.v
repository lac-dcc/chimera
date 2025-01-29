// Seed: 120670034
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input wor id_4,
    input supply0 id_5,
    output uwire id_6,
    input tri id_7
);
  wire id_9;
  tri1 id_10;
  parameter id_11 = 1'b0;
  assign id_10 = 1;
  wire id_12, id_13;
  uwire id_14;
  wire  id_15;
  localparam id_16 = id_14;
  assign id_6 = id_10;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri0 id_3,
    output wand id_4,
    output wire id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri1 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_4,
      id_8,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
  id_11(
      id_3 + id_3
  );
  wire id_12, id_13, id_14;
  wire id_15, id_16;
endmodule
