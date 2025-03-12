// Seed: 2163618171
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input wand id_2,
    output supply1 id_3,
    output tri0 id_4
);
  wire  id_6 = id_6;
  wire  id_7 = id_0;
  logic id_8;
  assign id_4 = -1;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    inout logic id_4,
    input uwire id_5,
    output tri0 id_6
);
  wire id_8;
  always #(id_1 == id_5 >= id_3) begin : LABEL_0
    if (1) id_4 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_0,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
