// Seed: 1866957000
module module_0 (
    input wand id_0,
    output wand id_1,
    output supply0 id_2,
    output tri0 id_3,
    output tri0 id_4,
    output wand id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    output wor id_9,
    input tri0 id_10
);
  assign id_2 = id_10;
  wire id_12;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    output logic id_0,
    output tri1  id_1,
    input  wire  id_2,
    input  tri0  id_3,
    input  uwire id_4
);
  reg id_6;
  tri id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_2,
      id_1,
      id_3
  );
  assign id_6 = 1;
  genvar id_8;
  always @(1 or {id_4,
    1
  })
  begin : LABEL_0
    id_6 <= 1;
    $display(id_8);
    id_8 = 1 & id_6;
    id_7 = id_7;
    id_0 <= {1'b0, id_2 & 1, 1, id_2 !=? 1'b0, id_7++, 1};
    id_8 <= id_6;
  end
endmodule
