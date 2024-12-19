// Seed: 3072371548
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3,
    output wor id_4,
    output supply1 id_5,
    output tri id_6,
    input supply1 id_7,
    input tri0 id_8
);
  always @(id_3, 1 or 1 or negedge id_3) if (id_3) disable id_10;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1,
    output wire  id_2,
    input  wor   id_3,
    input  tri   id_4,
    input  tri   id_5,
    input  tri   id_6,
    input  wand  id_7,
    input  wire  id_8,
    output tri1  id_9,
    input  tri0  id_10,
    input  wire  id_11,
    input  tri   id_12
);
  assign id_1 = id_6;
  tri0 id_14;
  tri id_15, id_16;
  id_17(
      1, id_10, 1
  );
  module_0 modCall_1 (
      id_2,
      id_11,
      id_3,
      id_5,
      id_1,
      id_9,
      id_9,
      id_12,
      id_8
  );
  uwire id_18 = 1'b0;
  wire  id_19;
  id_20 :
  assert property (@(posedge id_0) 1)
  else $display(1, 1'h0, 1);
  wire id_21;
  wire id_22;
  assign id_14 = 1;
  id_23(
      .id_0(), .id_1(id_16++ * id_7), .id_2(1), .id_3(id_8)
  );
endmodule
