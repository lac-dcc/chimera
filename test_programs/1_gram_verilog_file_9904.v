// Seed: 117982833
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
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_13;
  wire id_14;
  wire id_15;
  assign module_1.id_9 = 0;
  assign id_14 = id_12;
  wire id_16;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    output tri0 id_4,
    input tri id_5,
    input wand id_6,
    input supply0 id_7,
    input wand id_8,
    input wire id_9,
    output supply0 id_10
);
  wire id_12;
  id_13(
      .id_0(id_0)
  ); id_14 :
  assert property (@(posedge id_0) id_0) $display(id_9 | -1'b0, -1 - -1);
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12
  );
endmodule
