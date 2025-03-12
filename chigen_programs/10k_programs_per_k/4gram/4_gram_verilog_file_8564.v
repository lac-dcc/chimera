// Seed: 2185363418
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input wire id_3,
    input wand id_4,
    output supply0 id_5,
    output supply1 id_6,
    input uwire id_7,
    output supply0 id_8,
    input wor id_9,
    input tri0 module_0,
    input uwire id_11
);
  wire id_13;
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd46,
    parameter id_13 = 32'd61,
    parameter id_2  = 32'd60,
    parameter id_6  = 32'd50
) (
    input wire id_0,
    input supply1 id_1,
    output tri _id_2,
    output wire id_3,
    input tri0 id_4,
    output wire id_5,
    input wand _id_6,
    input supply0 id_7,
    output supply1 id_8,
    input wire id_9,
    input tri id_10,
    output uwire _id_11,
    input supply0 id_12,
    output wor _id_13,
    output wire id_14,
    input wor id_15,
    output tri1 id_16,
    output uwire id_17,
    input tri id_18,
    input wand id_19,
    input uwire id_20
    , id_24,
    output supply0 id_21,
    input supply0 id_22
);
  static logic [1  ||  id_6 : id_2] id_25[1 : id_11  <  id_13];
  xnor primCall (
      id_8,
      id_7,
      id_15,
      id_9,
      id_19,
      id_28,
      id_12,
      id_0,
      id_1,
      id_24,
      id_30,
      id_29,
      id_26,
      id_27,
      id_22,
      id_25,
      id_10,
      id_18
  );
  wire id_26;
  ;
  supply0 id_27 = 1;
  wire id_28;
  wire id_29;
  logic id_30;
  ;
  module_0 modCall_1 (
      id_22,
      id_10,
      id_4,
      id_9,
      id_1,
      id_16,
      id_16,
      id_18,
      id_17,
      id_0,
      id_20,
      id_4
  );
  assign modCall_1.id_7 = 0;
  wire id_31;
endmodule
