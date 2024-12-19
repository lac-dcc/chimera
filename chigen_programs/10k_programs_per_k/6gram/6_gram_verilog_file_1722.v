// Seed: 3779039723
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    output wand id_2,
    input tri0 id_3,
    output wire id_4,
    input wire id_5,
    input wire id_6,
    input wire id_7,
    output uwire id_8,
    input tri0 module_0,
    output wor id_10,
    input supply1 id_11,
    output wire id_12,
    output wor id_13
);
  always @* begin : LABEL_0
    id_4 = id_9;
  end
endmodule
module module_1 (
    output wand id_0,
    input supply0 module_1,
    input tri id_2,
    input supply0 id_3,
    input wire id_4,
    input supply0 id_5,
    inout wor id_6,
    inout supply1 id_7,
    output tri id_8
);
  wire id_10;
  wire id_11;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_7,
      id_6,
      id_8,
      id_5,
      id_6,
      id_4,
      id_7,
      id_2,
      id_7,
      id_2,
      id_8,
      id_0
  );
  assign modCall_1.type_1 = 0;
  wire id_12;
  assign id_12 = id_12;
endmodule
