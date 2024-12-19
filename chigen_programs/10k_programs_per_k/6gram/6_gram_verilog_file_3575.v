// Seed: 147252643
module module_0 (
    input  uwire id_0,
    input  tri0  id_1,
    output wor   id_2,
    output uwire id_3
);
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  tri  id_9;
  always @(*) begin : LABEL_0
    id_7 = 1;
    for (id_7 = {id_9{1'b0}}; 1; id_5 = id_8) @(posedge id_0);
  end
endmodule
module module_1 (
    output tri1 id_0,
    input wand id_1,
    input uwire id_2,
    input wor id_3,
    input uwire id_4,
    input supply1 id_5,
    output tri id_6,
    output tri1 id_7
);
  supply1 id_9;
  wand id_10 = id_5;
  assign id_9 = 1;
  wor id_11 = id_9;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_6,
      id_6
  );
  supply0 id_12;
  initial begin : LABEL_0
    id_12 = id_4;
  end
endmodule
