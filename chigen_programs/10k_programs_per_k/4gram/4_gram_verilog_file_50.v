// Seed: 4015095535
module module_0 (
    output wire id_0,
    input wand id_1,
    input tri id_2,
    input supply1 id_3,
    output wand id_4,
    output tri id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8
);
  wire id_10;
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    output tri1  id_2,
    output logic id_3,
    input  logic id_4,
    input  tri1  id_5,
    output logic id_6,
    input  wor   id_7
);
  always @(id_1) begin : LABEL_0
    if (id_5) id_6 <= id_4;
    else begin : LABEL_0
      id_3 <= 1;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_0,
      id_2,
      id_5,
      id_5,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
