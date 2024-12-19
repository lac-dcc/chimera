// Seed: 3818581171
module module_0 (
    output wire id_0,
    output wire id_1,
    input  tri0 id_2,
    input  wire id_3,
    input  wire id_4
);
  generate
    assign id_1 = id_4;
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wire id_4,
    input tri1 id_5,
    output wire id_6
);
  assign id_6 = 1 ? 1 : 1;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_5,
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
  assign id_6 = id_2;
  wire id_8;
endmodule
