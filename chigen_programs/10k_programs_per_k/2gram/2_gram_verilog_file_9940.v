// Seed: 4062034316
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_13 = -1;
endmodule
module module_1 #(
    parameter id_17 = 32'd38,
    parameter id_4  = 32'd28
) (
    input tri id_0
    , id_26,
    inout supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri _id_4,
    output supply1 id_5,
    output tri0 id_6,
    input tri0 id_7,
    input supply0 id_8,
    output supply0 id_9,
    output supply1 id_10,
    output uwire id_11,
    input supply1 id_12,
    output wor id_13,
    input tri1 id_14,
    input tri1 id_15,
    output supply0 id_16,
    output supply1 _id_17,
    input wor id_18,
    input wire id_19,
    input tri0 id_20,
    output tri1 id_21,
    output supply1 id_22,
    input tri id_23,
    input supply0 id_24
);
  assign id_11 = 1;
  and primCall (
      id_5,
      id_19,
      id_8,
      id_14,
      id_7,
      id_28,
      id_18,
      id_15,
      id_26,
      id_0,
      id_1,
      id_3,
      id_27,
      id_23,
      id_24,
      id_2,
      id_20,
      id_12
  );
  logic [id_4 : id_17] id_27;
  id_28 :
  assert property (@(posedge ~id_14 or "") id_27)
  else;
  module_0 modCall_1 (
      id_26,
      id_27,
      id_27,
      id_26,
      id_27,
      id_26,
      id_26,
      id_26,
      id_27,
      id_26,
      id_26,
      id_26
  );
endmodule
