// Seed: 3726191095
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output wire id_2,
    input tri id_3,
    output supply0 id_4,
    input uwire id_5,
    input uwire id_6
);
  wire id_8;
  module_2 modCall_1 (
      id_1,
      id_5,
      id_4
  );
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    input wire id_2,
    input wand id_3,
    output supply0 id_4,
    output wand id_5,
    output tri id_6
);
  wire id_8;
  xnor primCall (id_5, id_1, id_8, id_3, id_2);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_1,
      id_6,
      id_1,
      id_1
  );
endmodule
module module_2 (
    input wire id_0,
    input supply1 id_1,
    output uwire id_2
);
  always @(-1) begin : LABEL_0
    if (1)
      if (1 <= 1) begin : LABEL_1
        assert (-1);
      end
  end
  assign module_0.id_2 = 0;
endmodule
