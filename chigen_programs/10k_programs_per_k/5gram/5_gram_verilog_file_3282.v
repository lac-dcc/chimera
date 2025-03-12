// Seed: 3785038029
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    module_0,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  output wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  assign module_1.id_5 = 0;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd17
) (
    input tri id_0,
    input tri id_1,
    input wand _id_2
    , id_14,
    input supply1 id_3,
    output wand id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    output tri id_8,
    input wor id_9,
    output uwire id_10,
    input uwire id_11,
    output wand id_12
);
  wire id_15;
  logic [id_2 : 1] id_16;
  ;
  nand primCall (id_12, id_16, id_3, id_0, id_1, id_9, id_7, id_5, id_11, id_14, id_6, id_15);
  module_0 modCall_1 (
      id_14,
      id_16,
      id_15,
      id_14,
      id_16,
      id_16,
      id_16,
      id_15,
      id_16,
      id_16,
      id_14,
      id_16,
      id_15,
      id_15,
      id_16,
      id_15,
      id_16,
      id_16,
      id_15,
      id_14,
      id_16,
      id_16,
      id_14,
      id_16
  );
endmodule
