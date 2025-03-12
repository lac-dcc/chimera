// Seed: 2507013612
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input wand id_2,
    input supply1 id_3,
    input wor id_4,
    output wire id_5,
    input supply0 id_6,
    output tri1 id_7,
    input tri1 id_8
);
  struct packed {
    logic id_10;
    logic id_11;
  } id_12;
  ;
  assign id_5 = id_12.id_10;
  wire id_13;
endmodule
module module_1 #(
    parameter id_14 = 32'd6
) (
    input uwire id_0,
    input supply0 id_1,
    input wand id_2[-1 : id_14  ?  -1 : id_14],
    input tri0 id_3,
    output wire id_4,
    input wire id_5,
    input supply0 id_6,
    output supply1 id_7,
    output supply0 id_8,
    input wor id_9,
    output wire id_10,
    input wor id_11,
    output wor id_12,
    output tri0 id_13,
    input supply0 _id_14,
    input wand id_15,
    input supply0 id_16,
    output tri id_17,
    input supply1 id_18,
    input tri0 id_19,
    output tri1 void id_20,
    output supply1 id_21,
    output tri id_22
);
  module_0 modCall_1 (
      id_9,
      id_6,
      id_1,
      id_2,
      id_9,
      id_21,
      id_0,
      id_12,
      id_18
  );
  assign modCall_1.id_1 = 0;
endmodule
