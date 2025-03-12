// Seed: 4159231790
module module_0 (
    output wor   id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output uwire id_3,
    output uwire id_4
);
  always @(id_1) begin : LABEL_0
    $signed(44);
    ;
  end
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri id_3,
    output wand id_4,
    output logic id_5
);
  assign id_0 = id_2;
  initial begin : LABEL_0
    id_0 <= id_3;
    id_5 = 1;
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
  wire ["" : ""] id_7;
  wire id_8;
  timeprecision 1ps;
endmodule
