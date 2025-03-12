// Seed: 3651207906
module module_0 (
    access,
    id_2,
    id_3,
    id_4,
    id_5,
    module_0,
    id_7,
    id_8,
    id_9,
    id_10,
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
    id_22
);
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_23 :
  assert property (@(posedge id_13) -1)
  else $signed(4);
  ;
  wire id_24;
endmodule
module module_0 #(
    parameter id_29 = 32'd38
) (
    output uwire id_0,
    input wor id_1,
    input supply0 id_2,
    input uwire id_3,
    output wor id_4,
    output tri0 id_5,
    output tri1 id_6,
    input wor id_7,
    input uwire id_8,
    output tri0 id_9,
    input wand id_10
    , _id_29,
    output wor id_11,
    output supply1 id_12,
    input tri0 id_13,
    input tri0 module_1
    , id_30,
    output tri0 id_15,
    output uwire id_16,
    input tri1 id_17,
    output supply0 id_18,
    output supply0 id_19,
    input wor id_20,
    output tri1 id_21,
    output wor id_22,
    output supply1 id_23,
    input wor id_24,
    input tri1 id_25,
    output tri1 id_26,
    output tri id_27
);
  logic [id_29 : 1] id_31;
  ;
  or primCall (
      id_22, id_17, id_10, id_13, id_7, id_24, id_3, id_1, id_30, id_8, id_31, id_25, id_2, id_20
  );
  module_0 modCall_1 (
      id_30,
      id_31,
      id_30,
      id_31,
      id_31,
      id_30,
      id_31,
      id_31,
      id_31,
      id_31,
      id_31,
      id_30,
      id_31,
      id_30,
      id_31,
      id_30,
      id_31,
      id_31,
      id_30,
      id_31,
      id_31,
      id_30
  );
endmodule
