// Seed: 3039332512
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    output tri0 id_3,
    output tri0 id_4,
    input wand id_5
);
  assign id_4 = 1;
endmodule
module module_1 (
    output wire  id_0,
    output uwire id_1,
    input  wand  id_2,
    inout  tri   id_3,
    output logic id_4,
    output tri0  id_5,
    input  wand  id_6,
    input  wor   id_7,
    output uwire id_8,
    input  tri0  id_9,
    input  tri   id_10,
    input  wor   id_11
);
  always begin : LABEL_0
    disable id_13;
    $display(1, id_1++, 1'b0, "");
  end
  assign id_3 = id_2 - id_6 !== 1;
  reg id_14;
  always force id_0.id_14 = id_14;
  always
    if (id_7) id_4 <= 1;
    else assert (id_6);
  wire id_15;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_11,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.type_2 = 0;
endmodule
