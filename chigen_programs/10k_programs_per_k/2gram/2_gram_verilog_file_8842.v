// Seed: 473977916
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_20 :
  assert property (@(posedge id_17) id_5)
  else id_12 += id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd76,
    parameter id_6 = 32'd78
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire _id_6;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_2,
      id_8,
      id_5,
      id_2,
      id_8,
      id_4,
      id_4,
      id_8,
      id_8,
      id_7,
      id_4,
      id_3,
      id_7,
      id_10,
      id_9,
      id_7
  );
  input wire id_5;
  input wire id_4;
  xor primCall (id_7, id_8, id_2, id_3, id_5, id_10);
  input wire id_3;
  inout wire id_2;
  inout wire _id_1;
  logic [id_1 : -1] id_11;
  ;
  logic id_12[1 'b0 : id_6];
  assign id_12 = 1;
endmodule
