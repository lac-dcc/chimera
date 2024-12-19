// Seed: 1132243898
module module_0 (
    input  wand  id_0,
    output wor   id_1,
    input  wand  id_2,
    input  uwire id_3,
    input  tri0  id_4
);
  always @(negedge 1) begin : LABEL_0
    id_1 = id_2;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input wand id_2,
    input wand id_3,
    input supply0 id_4,
    input supply1 id_5,
    output logic id_6
);
  integer id_8 = 1;
  wire id_9;
  always id_6 = #(id_8  : (""): id_2 * id_8) 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_5
  );
  assign modCall_1.id_3 = 0;
  id_10(
      .id_0(1), .id_1(1'b0), .id_2(1)
  );
endmodule
