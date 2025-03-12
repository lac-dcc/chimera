// Seed: 1609705671
module module_0 (
    output wor id_0,
    input wire id_1,
    output wire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wand id_5,
    input wand id_6,
    output supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    input tri0 id_10,
    input tri1 id_11,
    input wor id_12,
    input tri0 id_13
    , id_33,
    input uwire id_14,
    input supply1 id_15,
    input tri0 id_16,
    input uwire id_17,
    input wand id_18,
    input wand id_19,
    input tri id_20,
    output tri0 id_21,
    output wire id_22,
    input wor id_23,
    input wor module_0,
    input tri1 id_25,
    input tri0 id_26,
    output supply1 id_27,
    input wand id_28,
    input tri1 id_29,
    input tri id_30,
    input uwire id_31
);
  timeunit 1ps; id_34 :
  assert property (@(posedge (id_9 ? id_10 : id_22++) - id_30) id_33)
  else $clog2(87);
  ;
endmodule
module module_0 #(
    parameter id_1 = 32'd95,
    parameter id_8 = 32'd61
) (
    output wand id_0,
    input wire _id_1,
    output uwire id_2,
    output tri1 id_3,
    output wor id_4,
    output wire id_5,
    input tri0 id_6,
    input tri0 id_7,
    inout wor _id_8,
    output supply0 id_9,
    output wand id_10,
    input supply1 module_1,
    input supply1 id_12
);
  wire [id_8 : id_1] id_14;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_10,
      id_6,
      id_6,
      id_7,
      id_12,
      id_5,
      id_12,
      id_12,
      id_12,
      id_7,
      id_6,
      id_7,
      id_7,
      id_6,
      id_12,
      id_6,
      id_7,
      id_12,
      id_12,
      id_9,
      id_9,
      id_7,
      id_6,
      id_6,
      id_12,
      id_9,
      id_6,
      id_12,
      id_6,
      id_7
  );
  assign modCall_1.id_17 = 0;
endmodule
