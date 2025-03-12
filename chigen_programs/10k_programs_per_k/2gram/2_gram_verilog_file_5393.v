// Seed: 869423846
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    inout supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wor id_5
);
  assign id_1 = id_2;
  always begin : LABEL_0
    $unsigned(98);
    ;
  end
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    inout  tri1  id_0,
    output logic id_1,
    output tri1  id_2,
    output uwire id_3,
    input  tri0  id_4,
    input  uwire id_5
);
  wire [-1 : 1] id_7;
  assign id_0 = -1;
  always id_1 <= id_5;
  wire id_8;
  ;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3
  );
  logic id_9;
  xnor primCall (id_1, id_5, id_8, id_0);
  assign id_1 = 1;
endmodule
