// Seed: 1144142494
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wor id_4
);
  assign module_2.id_4 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    output wand id_3
);
  parameter id_5 = -1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd68
) (
    input  tri   id_0,
    output logic id_1
);
  assign id_1 = 1'b0;
  always begin : LABEL_0
    id_1 <= id_0;
    assert (id_0);
  end
  wire [$realtime : 1] id_3;
  wire [-1 : 1] _id_4;
  logic [7:0] id_5;
  assign id_5[id_4] = -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
endmodule
