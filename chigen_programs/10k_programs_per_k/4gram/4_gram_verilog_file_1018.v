// Seed: 2075154925
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input supply1 id_2
);
  assign id_0 = id_2;
  assign module_1.id_0 = 0;
  parameter id_4 = -1;
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1,
    output wire  id_2,
    output logic id_3,
    input  uwire id_4,
    input  wand  id_5,
    output logic id_6
);
  always
  fork
    if (1) id_1 <= -1'h0 + id_5;
    else if (1 & 1'b0) begin : LABEL_0
      if ((1) * 1) begin : LABEL_1
        id_6 = 1'h0;
        id_3 = id_0;
        $unsigned(82);
        ;
      end
    end
  join
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5
  );
endmodule
