// Seed: 3494913506
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output uwire id_2,
    output tri id_3,
    output wor id_4,
    input tri0 module_0,
    output supply1 id_6,
    input wand id_7,
    output wire id_8,
    input wor id_9,
    output tri0 id_10,
    output supply1 id_11,
    output tri1 id_12
);
  assign id_4 = -1;
  assign id_4 = id_5;
  parameter id_14 = (1) & "";
  logic id_15;
endmodule
module module_1 #(
    parameter id_0  = 32'd8,
    parameter id_10 = 32'd28,
    parameter id_14 = 32'd97,
    parameter id_4  = 32'd65,
    parameter id_6  = 32'd97,
    parameter id_7  = 32'd30,
    parameter id_8  = 32'd72
) (
    output wor _id_0,
    output uwire id_1,
    input wand id_2,
    output wand id_3,
    input supply1 _id_4
    , id_16,
    input supply1 id_5,
    input tri0 _id_6,
    input tri0 _id_7,
    input supply1 _id_8,
    output tri0 id_9,
    input tri _id_10,
    output supply0 id_11,
    output wand id_12,
    input wand id_13,
    input wire _id_14
);
  struct packed {
    struct packed {
      logic [id_6 : id_10]   id_17;
      logic [~  id_8 : id_0] id_18;
    } [id_7 : -1 'b0] id_19;
    logic [id_14  >  id_4 : id_8] id_20;
  } id_21;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_1,
      id_9,
      id_9,
      id_5,
      id_12,
      id_5,
      id_9,
      id_2,
      id_12,
      id_9,
      id_9
  );
  assign modCall_1.id_0 = 0;
endmodule
