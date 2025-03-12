// Seed: 2281876928
module module_0 (
    input supply0 id_0
    , id_12,
    input wire id_1,
    input wor id_2,
    input wand id_3,
    input wire id_4,
    output tri id_5,
    input supply0 id_6,
    output uwire id_7,
    input wand id_8,
    input supply0 id_9,
    output uwire id_10
);
  logic id_13;
  wire id_14, id_15;
  logic id_16;
endmodule
module module_1 #(
    parameter id_16 = 32'd72,
    parameter id_4  = 32'd59,
    parameter id_8  = 32'd41
) (
    input supply0 id_0,
    input supply0 id_1,
    input tri0 id_2,
    output supply0 id_3,
    input tri0 _id_4,
    input uwire id_5,
    output wand id_6,
    inout supply1 id_7,
    input tri0 _id_8,
    input supply0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    output supply1 id_12,
    input tri1 id_13,
    input supply1 id_14,
    input wand id_15,
    input wor _id_16
);
  struct packed {
    struct packed {
      logic [id_4 : -1] id_18;
      logic id_19;
    } [id_8 : id_16] id_20;
  } id_21;
  ;
  nand primCall (
      id_3,
      id_2,
      id_10,
      id_11,
      id_20,
      id_18,
      id_0,
      id_19,
      id_14,
      id_21,
      id_7,
      id_9,
      id_1,
      id_5,
      id_15,
      id_13
  );
  module_0 modCall_1 (
      id_15,
      id_2,
      id_5,
      id_2,
      id_2,
      id_12,
      id_5,
      id_6,
      id_11,
      id_10,
      id_3
  );
endmodule
