// Seed: 2861851946
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input wire id_2
);
endmodule
module module_1 (
    input  wor   id_0,
    input  tri1  id_1,
    input  tri   id_2,
    input  logic id_3,
    output logic id_4
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.type_0 = 0;
  assign id_4 = 1;
  always @(id_2) begin : LABEL_0
    id_4 = #1 id_4++;
    id_4 = id_3;
  end
endmodule
module module_2 (
    input supply1 id_0,
    input wor id_1
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = -id_0;
endmodule
