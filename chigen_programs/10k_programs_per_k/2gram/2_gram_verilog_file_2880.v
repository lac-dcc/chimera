// Seed: 2665228824
module module_0 (
    output logic id_0,
    output uwire id_1
);
  always id_0 = #1 id_3 & id_3;
  assign id_3 = 1;
  module_2 modCall_1 ();
  wire id_5;
endmodule
macromodule module_1 (
    input  logic id_0,
    output tri0  id_1,
    input  wor   id_2
);
  logic id_4;
  for (id_5 = 1; 1; id_5 = id_5) begin : LABEL_0
    assign id_4 = id_0;
    wire id_6;
    always begin : LABEL_0
      id_4 <= 1;
    end
  end
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_2 ();
  assign id_1 = id_1;
  integer id_3, id_4;
endmodule
