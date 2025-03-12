// Seed: 52419722
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output tri1 id_2,
    input tri id_3,
    input wor id_4,
    output supply1 id_5,
    output wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    input wand id_9,
    output supply1 id_10,
    output wand id_11,
    output uwire id_12,
    output tri1 id_13,
    input supply1 id_14,
    input tri id_15,
    output supply1 id_16,
    input tri1 id_17
);
  wire id_19;
  assign module_1.id_1 = 0;
  parameter id_20 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd85
) (
    input tri1 id_0,
    input wire _id_1,
    inout supply1 id_2
);
  wire [!  id_1 : -1] id_4;
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0
  );
endmodule
