// Seed: 1141505802
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input tri id_2,
    input supply0 id_3
);
  assign module_2.id_0 = 0;
  localparam id_5 = 'd0;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input wire id_2,
    input uwire id_3,
    input tri0 id_4,
    output wire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_0 = 32'd90
) (
    input uwire _id_0,
    output supply1 id_1,
    input wor id_2,
    input uwire id_3,
    input tri id_4,
    output wor id_5,
    input tri0 id_6,
    input supply0 id_7
);
  logic [7:0] id_9;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_2
  );
  assign id_9[id_0] = 1'h0;
endmodule
