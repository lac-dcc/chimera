// Seed: 1722633096
module module_0 (
    input uwire id_0,
    input tri id_1,
    input tri1 id_2,
    output tri id_3,
    input wire id_4,
    input wire id_5,
    input supply0 id_6,
    input tri id_7,
    input wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    input tri id_11,
    input wand id_12,
    input tri id_13
);
  wire id_15;
  wire id_16;
endmodule
macromodule module_1 #(
    parameter id_15 = 32'd75
) (
    input wand id_0,
    input tri0 id_1,
    output tri id_2,
    output uwire id_3,
    input tri0 id_4,
    inout wor id_5,
    output tri0 id_6,
    input wire id_7,
    output uwire id_8,
    input tri1 id_9,
    input tri id_10,
    output supply0 id_11,
    inout wire id_12,
    input tri0 id_13
);
  parameter id_15 = 1;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_4,
      id_6,
      id_9,
      id_4,
      id_7,
      id_4,
      id_1,
      id_12,
      id_9,
      id_7,
      id_7,
      id_12
  );
  assign modCall_1.id_3 = 0;
  assign id_5 = id_9;
  wire id_16;
  wire [(  1  ) : id_15] id_17;
endmodule
