// Seed: 2795374824
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
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input wand id_2,
    input tri id_3,
    output uwire id_4,
    output tri id_5,
    input tri0 id_6
);
  logic id_8;
  logic id_9;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  id_10 :
  assert property (@(posedge id_2) id_8)
  else id_9 = !1'd0;
endmodule
