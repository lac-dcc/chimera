// Seed: 3364123213
module module_0 (
    input wand id_0,
    input wire id_1,
    input wire id_2,
    input tri0 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input wor id_6,
    output tri0 id_7
);
  wire id_9;
  assign id_7 = 1;
  assign module_1.id_0 = 0;
endmodule
macromodule module_1 #(
    parameter id_5 = 32'd88
) (
    output tri0  id_0,
    input  tri   id_1
    , id_4,
    input  uwire id_2
);
  defparam id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0
  );
  assign id_0 = id_1;
endmodule
module module_2 (
    input wire id_0,
    input wand id_1
    , id_12,
    input tri id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    input supply1 id_7,
    inout tri0 id_8,
    output supply0 id_9,
    input tri id_10
);
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_2,
      id_9,
      id_7,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
