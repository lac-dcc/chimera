// Seed: 234273933
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    output tri0 id_2,
    output uwire id_3,
    input tri0 id_4,
    input wor id_5,
    output wand id_6,
    output tri1 id_7,
    input supply0 id_8,
    input wire id_9,
    output wand id_10,
    input supply0 id_11,
    input supply1 id_12
);
  uwire id_14, id_15 = id_12 ? 1 : id_11;
  id_16 :
  assert property (@(posedge 1'b0) id_11)
  else $display(1'b0);
  wire id_17;
  wand id_18 = 1;
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    input tri id_0,
    output supply0 id_1
);
  always @(id_0) id_1 = id_0;
  module_0(
      id_1, id_0, id_1, id_1, id_0, id_0, id_1, id_1, id_0, id_0, id_1, id_0, id_0
  );
endmodule
