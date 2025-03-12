// Seed: 4120857677
module module_0 #(
    parameter id_12 = 32'd13,
    parameter id_14 = 32'd35
) (
    output supply0 id_0,
    input wand id_1,
    output wire id_2,
    input wand id_3,
    output supply0 id_4,
    output supply0 id_5,
    input supply1 id_6,
    output tri0 id_7,
    output tri1 id_8,
    output supply1 id_9
);
  assign id_7 = -1;
  wire  id_11;
  logic _id_12;
  ;
  wire id_13;
  assign id_5 = -1;
  wire _id_14;
  wire [~  id_12 : 1] id_15;
  logic [id_14 : -1 'b0] id_16 = 1;
  wire [1 : -1] id_17;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    input  wire  id_2,
    output tri0  id_3,
    output wor   id_4,
    input  tri0  id_5
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_1,
      id_0,
      id_3,
      id_5,
      id_4,
      id_3,
      id_3
  );
endmodule
