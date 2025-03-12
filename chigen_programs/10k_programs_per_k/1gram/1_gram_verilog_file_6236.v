// Seed: 3644017701
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wire id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri id_7,
    output wire id_8,
    output wor id_9
);
  wire id_11, id_12[-1 : -1];
  wire id_13;
  assign id_7 = (id_5);
endmodule
module module_1 #(
    parameter id_18 = 32'd63,
    parameter id_5  = 32'd0,
    parameter id_9  = 32'd8
) (
    input supply1 id_0,
    input uwire id_1
    , id_25 = 1'b0,
    output uwire id_2,
    output wand id_3,
    output tri0 id_4,
    input wand _id_5,
    input wand id_6,
    input uwire id_7,
    input wire id_8,
    input wor _id_9,
    input tri1 id_10,
    input supply0 id_11,
    input tri1 id_12,
    input uwire id_13,
    input tri id_14,
    output wand id_15,
    output wire id_16[id_5 : id_18],
    output tri id_17,
    output supply1 _id_18,
    input tri id_19,
    output tri id_20,
    output uwire id_21,
    inout supply1 id_22,
    input supply1 id_23
);
  logic [1 : -1 'b0] id_26, id_27;
  tri1 [id_9  ==  -1 'b0 : ~  1] id_28 = 1;
  struct packed {
    union packed {logic id_29;} id_30;
    logic id_31;
    id_32 id_33;
    union packed {
      logic id_34;
      logic id_35;
    } id_36;
  } id_37;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_1,
      id_22,
      id_15,
      id_7,
      id_16,
      id_22,
      id_21,
      id_17
  );
  assign modCall_1.id_9 = 0;
endmodule
