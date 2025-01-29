// Seed: 643059581
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  assign module_2.type_6 = 0;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_7
  );
endmodule
module module_2 (
    input tri1 id_0,
    id_16,
    id_17,
    input wor id_1,
    output supply1 id_2,
    id_18,
    output tri1 id_3,
    output supply1 id_4,
    output supply1 id_5,
    input tri1 id_6,
    input wand id_7,
    input tri id_8,
    output wand id_9,
    output wand id_10,
    input uwire id_11,
    input wand id_12,
    input supply0 id_13,
    input wor id_14
);
  id_19(
      .id_0(-1'b0), .id_1(id_14)
  );
  wire id_20;
  id_21 :
  assert property (@(-1'b0) 1) $display(id_1, -1'h0);
  module_0 modCall_1 (
      id_21,
      id_16
  );
endmodule
