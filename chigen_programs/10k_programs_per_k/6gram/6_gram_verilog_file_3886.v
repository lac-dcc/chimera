// Seed: 1325207264
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input logic [7:0] id_2;
  module_2 modCall_1 ();
  inout wire id_1;
  generate
    for (id_4 = id_2[(-1) : 1]; ~id_3; id_4 = -1) begin : LABEL_0
      assign id_4 = 1;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_1 = 32'd41
) (
    _id_1,
    id_2
);
  inout logic [7:0] id_2;
  inout wire _id_1;
  assign id_2[id_1*id_1] = -1;
  wire id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3
  );
endmodule
module module_2 ();
  integer id_1;
  ;
  assign module_0.id_4 = 0;
endmodule
