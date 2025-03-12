// Seed: 4090849719
module module_0 (
    output tri id_0,
    input wor id_1,
    input tri1 id_2,
    input supply1 id_3,
    output wand id_4
);
  always @(id_3 or((-1) < id_2)) begin : LABEL_0
    assert (1);
  end
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input tri0 id_2,
    output supply0 id_3,
    output tri id_4
);
  wire id_6, id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_2,
      id_3
  );
  wire id_8;
  ;
  logic id_9;
  ;
endmodule
module module_0 #(
    parameter id_19 = 32'd90,
    parameter id_23 = 32'd66,
    parameter id_3  = 32'd64
) (
    output tri1 id_0,
    output supply1 id_1,
    output supply1 id_2,
    input wire _id_3,
    input uwire id_4,
    output supply1 id_5,
    input tri1 id_6,
    output tri id_7,
    input supply1 id_8,
    output wor id_9,
    input wire id_10,
    output wor id_11,
    input supply1 id_12
    , id_21,
    input tri1 id_13,
    input supply0 id_14,
    output uwire id_15,
    output tri1 id_16,
    input wor id_17,
    output supply0 id_18
    , id_22,
    output wand _id_19
);
  assign id_15 = id_17 !=? 1;
  module_0 modCall_1 (
      id_15,
      id_14,
      id_6,
      id_4,
      id_18
  );
  assign modCall_1.id_3 = 0;
  parameter id_23 = ~1;
  wire  [ id_3 : id_23] module_2;
  logic [id_19 : 1 'b0] id_24;
  ;
endmodule
