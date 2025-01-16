// Seed: 372854657
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wire id_4,
    input wand id_5,
    input tri id_6,
    input wor id_7,
    input tri1 id_8,
    input wand id_9,
    output wire id_10,
    output tri1 id_11
);
  wire id_13;
  assign module_1.id_9 = 0;
  always begin : LABEL_0
    @(posedge id_2) id_10 = -1;
    if (id_13) $display(1, 1, id_6, id_5, id_3);
  end
  tri1 id_14 = id_1;
  assign id_11 = !id_8;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    input  tri1  id_2,
    output uwire id_3,
    output uwire id_4,
    input  tri0  id_5,
    input  uwire id_6,
    input  tri   id_7,
    output logic id_8,
    input  wand  id_9
);
  assign id_8 = 1;
  assign id_4 = 1'b0;
  wire id_11 = id_1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_7,
      id_1,
      id_11,
      id_6,
      id_0,
      id_11,
      id_11,
      id_11
  );
  always_comb begin : LABEL_0
    if (1) id_8 <= 1;
  end
  assign id_4.id_7 = id_1;
endmodule
