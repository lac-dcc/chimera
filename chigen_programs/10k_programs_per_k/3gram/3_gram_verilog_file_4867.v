// Seed: 3704682328
module module_0 (
    output supply1 id_0
    , id_5,
    input tri id_1,
    output tri id_2,
    output logic id_3
);
  always @(1)
    if (id_5) begin : LABEL_0
      id_5 <= 1;
      id_3 <= {1 - id_1{1}};
    end
  assign id_2 = id_1;
  assign module_1.type_5 = 0;
  assign id_3 = 1;
endmodule
macromodule module_1 (
    output logic id_0,
    input  wire  id_1,
    input  wire  id_2,
    output wor   id_3
);
  always id_0 <= 1;
  not primCall (id_3, id_1);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_0
  );
endmodule
