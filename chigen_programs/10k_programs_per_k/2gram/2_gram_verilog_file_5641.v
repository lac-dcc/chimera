// Seed: 1705008695
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output tri id_3,
    input wand id_4,
    input supply0 id_5,
    output wand id_6,
    input wor id_7,
    input wire id_8,
    inout wire id_9
);
  supply1 id_11;
  assign id_6 = id_4;
  wire id_12;
  assign id_11 = 1;
  wire id_13;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    output uwire id_2
);
  tri id_4;
  xnor primCall (id_0, id_4, id_1);
  assign id_2 = id_4;
  always begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_4 = id_1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
