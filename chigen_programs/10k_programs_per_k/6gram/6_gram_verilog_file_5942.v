// Seed: 319377331
module module_0 (
    input uwire id_0
    , id_5,
    input uwire id_1,
    input wire  id_2,
    input wor   id_3
);
  generate
    for (id_6 = id_6; 1; id_6 = -1) begin : LABEL_0
      wire id_7;
      ;
    end
  endgenerate
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1,
    input  wand  id_2,
    output logic id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
  assign id_0 = 1;
  always @(id_1 or -1'd0) begin : LABEL_0
    id_3 <= id_1;
  end
endmodule
