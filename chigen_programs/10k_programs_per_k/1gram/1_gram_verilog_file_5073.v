// Seed: 550150013
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input tri id_2,
    output wor id_3,
    input supply1 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input uwire id_7,
    input wor id_8
);
  tri1  id_10 = -1;
  logic id_11;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd0,
    parameter id_2  = 32'd59
) (
    input tri id_0,
    output tri0 id_1,
    input tri1 _id_2,
    output tri1 id_3[id_2 : 1],
    input tri id_4,
    input wire id_5,
    output wire id_6,
    input wand id_7,
    output wand id_8,
    input wand id_9,
    output supply0 id_10,
    input supply1 id_11,
    output wand id_12["" : 1 'b0],
    output wand id_13,
    input tri0 _id_14,
    input wand id_15
    , id_18,
    input supply1 id_16
);
  assign id_10 = 1 & id_2;
  struct packed {
    struct packed {
      logic id_19;
      logic id_20;
      logic id_21;
      logic id_22  = 1'b0;
    } id_23;
    union packed {
      logic id_24;
      logic id_25[id_14 : 1];
      logic id_26;
    } id_27;
  } id_28;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_5,
      id_10,
      id_5,
      id_15,
      id_15,
      id_0,
      id_16
  );
endmodule
