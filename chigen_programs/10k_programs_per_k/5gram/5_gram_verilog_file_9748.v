// Seed: 942714611
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
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  output wire id_14;
  output wire id_13;
  assign module_1.id_6 = 0;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  localparam id_16 = 1;
  wire id_17, id_18, id_19;
endmodule
module module_1 #(
    parameter id_6 = 32'd57
) (
    output supply0 id_0,
    output wire id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    output wor id_5,
    output supply0 _id_6,
    input supply1 id_7,
    output supply1 id_8,
    input wire id_9,
    input tri0 id_10,
    output tri0 id_11
);
  logic [id_6 : -1] id_13;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13
  );
  id_14 :
  assert property (@(posedge id_2) 1'b0 == 1 < id_4)
  else $unsigned(86);
  ;
endmodule
