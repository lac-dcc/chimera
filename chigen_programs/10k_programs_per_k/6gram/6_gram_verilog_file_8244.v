// Seed: 4010984001
module module_0 (
    output wor   id_0,
    input  wire  id_1,
    output logic id_2
);
  always begin : LABEL_0
    if (1) begin : LABEL_1
      fork
        wait (id_1);
        #1;
        id_4();
      join_none
      if (-1) begin : LABEL_2
        id_4 = id_1;
        assign id_4 = (-1 ? id_1 : 1);
        id_2 = #id_5 -1;
      end
    end
  end
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    input  tri0  id_2,
    output tri0  id_3
);
  always @(-1) begin : LABEL_0
    if ({1, 1, 1}) id_0 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
