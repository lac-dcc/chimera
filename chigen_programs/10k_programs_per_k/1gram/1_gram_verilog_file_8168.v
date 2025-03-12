// Seed: 3728711441
module module_0 (
    input tri0 id_0,
    output uwire id_1
    , id_9,
    input wor id_2,
    output tri0 id_3,
    output uwire id_4,
    input tri1 id_5,
    input supply0 id_6,
    output tri0 id_7
);
  union packed {
    struct packed {
      logic id_10;
      id_11 id_12  = 1;
    } id_13;
    logic id_14;
    logic id_15;
  } id_16;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd82
) (
    input wor id_0,
    input tri id_1,
    input supply0 _id_2,
    input supply0 id_3,
    output supply0 id_4,
    input tri0 id_5,
    output tri0 id_6,
    input uwire id_7,
    output supply1 id_8,
    input tri0 id_9,
    input uwire id_10,
    input wor id_11,
    output wor id_12,
    output supply1 id_13,
    input tri1 id_14,
    input wire id_15,
    input wor id_16,
    output wire id_17,
    output uwire id_18,
    input uwire id_19,
    output wor id_20,
    output supply0 id_21,
    input supply0 id_22,
    output wand id_23,
    input supply1 id_24,
    output supply1 id_25
);
  assign id_21 = id_10;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_3,
      id_8,
      id_23,
      id_9,
      id_0,
      id_17
  );
  assign modCall_1.id_3 = 0;
  wire id_27 [-1 : id_2];
  wire id_28;
  assign id_27 = id_19;
  and primCall (
      id_17,
      id_0,
      id_16,
      id_15,
      id_9,
      id_10,
      id_19,
      id_3,
      id_7,
      id_1,
      id_14,
      id_24,
      id_5,
      id_11,
      id_22
  );
endmodule
