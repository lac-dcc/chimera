// Seed: 578615749
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    output wire id_3,
    input wor id_4,
    output wand id_5,
    output wire id_6,
    output supply1 id_7,
    input wor id_8,
    output tri id_9,
    input tri0 id_10,
    output tri id_11,
    output wand id_12,
    input tri id_13,
    input tri0 id_14,
    input tri1 id_15
);
  assign id_9 = id_4;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  uwire id_4,
    inout  uwire id_5,
    output uwire id_6,
    input  tri   id_7
);
  wand id_9;
  wire id_10, id_11, id_12;
  reg id_13;
  id_14 :
  assert property (@(1) 1)
  else begin
    id_13 = 1;
    if (id_14) assume (id_4);
    id_13 <= 1;
  end
  assign id_9 = id_2;
  wire id_15;
  initial begin
    if (id_15) disable id_16;
  end
  wor id_17 = id_4;
  assign id_9 = id_17;
  module_0(
      id_5,
      id_4,
      id_17,
      id_0,
      id_1,
      id_17,
      id_17,
      id_9,
      id_4,
      id_17,
      id_2,
      id_5,
      id_5,
      id_4,
      id_1,
      id_1
  );
endmodule
