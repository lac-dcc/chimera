// Seed: 423772182
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input uwire id_2,
    input wand id_3
);
  assign module_1.id_4 = 0;
  assign id_1 = 1;
  wand id_5;
  always begin : LABEL_0
    id_5 = 1'd0;
  end
endmodule
module module_1 (
    input  logic id_0,
    input  tri0  id_1,
    output wire  id_2,
    output wire  id_3,
    output tri0  id_4,
    output logic id_5,
    output tri1  id_6,
    input  wor   id_7
);
  always begin : LABEL_0
    id_5 <= id_0;
  end
  assign id_5 = (id_0);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_1,
      id_1
  );
endmodule
