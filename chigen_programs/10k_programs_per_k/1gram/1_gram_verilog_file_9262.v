// Seed: 3483841892
module module_0 (
    output tri id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    output uwire id_4,
    output wand id_5
);
  logic id_7 = id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd89
) (
    input tri1 id_0,
    output uwire id_1,
    input uwire _id_2,
    input tri id_3,
    input tri id_4,
    input wire id_5[id_2 : 1],
    input tri0 id_6,
    input supply0 id_7,
    input wand id_8,
    input supply0 id_9
);
  localparam id_11 = 1 + 1;
  wire [-1 : 1] id_12;
  reg id_13;
  ;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_8,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
  initial if (id_11) if (1'b0) id_13 <= #id_8 id_0;
endmodule
