// Seed: 2828400295
module module_0 (
    input tri1 id_0
);
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output wire id_2
);
  always_ff begin : LABEL_0
    `define pp_4 0
    `pp_4 <= `pp_4 & 1'b0 & !`pp_4;
  end
  module_0 modCall_1 (id_1);
endmodule
module module_2 (
    input uwire id_0,
    output tri0 id_1,
    output supply0 id_2,
    output wor id_3,
    output wor id_4,
    output tri1 id_5
);
  wire id_7;
  wire id_8;
  and primCall (id_2, id_8, id_7, id_0);
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endmodule
module module_3 #(
    parameter id_10 = 32'd92,
    parameter id_38 = 32'd17,
    parameter id_4  = 32'd64
) (
    input uwire id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wor id_3,
    input tri1 _id_4,
    output supply1 id_5,
    output tri0 id_6
    , id_33,
    input uwire id_7,
    output tri0 id_8,
    input wor id_9,
    input tri1 _id_10,
    input tri1 id_11,
    input tri1 id_12,
    input supply1 id_13,
    input supply0 id_14,
    input supply1 id_15,
    output supply1 id_16,
    output uwire id_17
    , id_34,
    input tri id_18,
    output tri1 id_19,
    output supply1 id_20,
    input supply1 id_21,
    output supply1 id_22,
    input uwire id_23,
    output supply0 id_24,
    input uwire id_25,
    input tri0 id_26,
    input supply1 id_27,
    input tri0 id_28,
    output supply1 id_29,
    input tri id_30,
    output supply0 id_31
);
  always begin : LABEL_0
    id_33 = id_27;
  end
  logic id_35;
  logic [7:0][id_4 : id_10  +  1 'b0] id_36;
  logic id_37;
  parameter id_38 = {1{1}} !=? 1;
  wire id_39;
  assign id_8 = id_36[id_38 :-1];
  module_0 modCall_1 (id_26);
endmodule
