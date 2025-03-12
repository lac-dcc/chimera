// Seed: 1504945249
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
    id_17
);
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  assign module_1.id_5 = 0;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_18 :
  assert property (@(posedge id_12) id_13)
  else @(posedge id_13) fork join
  wire id_19;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    input wor id_2,
    input tri1 id_3,
    output uwire id_4,
    output tri0 id_5,
    output tri id_6,
    output tri id_7,
    output uwire id_8,
    output tri1 id_9,
    input tri id_10,
    output wor id_11,
    input tri1 id_12,
    input uwire id_13
);
  logic [(  1 'b0 ) : 1 'b0] id_15 = id_2;
  xor primCall (id_4, id_0, id_10, id_2, id_1, id_13, id_12, id_3, id_15);
  module_0 modCall_1 (
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15
  );
endmodule
