// Seed: 105818221
module module_0;
  assign module_2.id_10 = 0;
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    input uwire id_2,
    input tri0 id_3,
    output tri0 id_4,
    input supply1 id_5,
    input wor id_6,
    output supply1 id_7,
    output wor id_8,
    output wire id_9
);
  wire id_11;
  genvar id_12;
  assign id_0 = -1;
  and primCall (id_0, id_1, id_11, id_12, id_13, id_2, id_3, id_5, id_6);
  assign id_4 = 1;
  wire id_13;
  always $display;
  module_0 modCall_1 ();
endmodule
macromodule module_2 (
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_12;
  assign id_6 = id_9 + id_11;
  wire id_13;
  id_14(
      .id_0()
  );
  wire id_15;
  id_16 :
  assert property (@(negedge -1) -1) @(1) $display;
  module_0 modCall_1 ();
  assign id_10 = -1 ? id_5 : -1'b0;
endmodule
