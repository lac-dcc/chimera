// Seed: 3399059816
module module_0 (
    output supply0 id_0,
    input tri id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wor id_4,
    input wor id_5,
    output supply0 id_6,
    output wand id_7,
    input supply0 id_8,
    output supply1 id_9
);
  assign id_6 = id_2;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input tri0 id_2,
    input wor id_3,
    input wand id_4,
    output wire id_5,
    input uwire id_6,
    input tri0 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input wand id_10,
    output wire id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_8,
      id_3,
      id_2,
      id_9,
      id_0,
      id_5,
      id_10,
      id_5
  );
  assign modCall_1.id_8 = 0;
  initial begin : LABEL_0
    assign id_11 = id_1;
  end
endmodule
