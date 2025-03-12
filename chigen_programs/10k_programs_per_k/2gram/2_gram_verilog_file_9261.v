// Seed: 1813990697
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    input wire id_3,
    input uwire id_4,
    input uwire id_5,
    output tri0 id_6
);
  logic id_8;
  ;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    input wire id_6,
    input supply1 id_7,
    output tri id_8
);
  wire id_10;
  ;
  assign id_1 = 1;
  logic id_11;
  wire  id_12 = id_2;
  initial begin : LABEL_0
    id_11 = #id_13 1;
  end
  module_0 modCall_1 (
      id_7,
      id_0,
      id_8,
      id_7,
      id_5,
      id_6,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
