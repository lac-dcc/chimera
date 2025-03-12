// Seed: 3059947900
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  xnor primCall (id_2, id_4, id_6, id_3);
  inout wire id_2;
  output wire id_1;
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_2
  );
endmodule
module module_2 (
    input tri1 id_0,
    input supply0 id_1
);
endmodule
module module_3 (
    inout  tri1  id_0,
    input  uwire id_1,
    output wor   id_2,
    input  wor   id_3,
    output wire  id_4,
    output logic id_5
);
  assign id_2 = {-1, id_0};
  generate
    for (id_7 = id_0; -1; id_5 = 1'b0) begin : LABEL_0
      assign id_5 = (id_1 ? id_1 : -1);
    end
  endgenerate
  module_2 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
