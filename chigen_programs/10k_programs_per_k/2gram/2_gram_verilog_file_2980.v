// Seed: 199095262
module module_0 (
    id_1,
    id_2,
    id_3
);
  output uwire id_3;
  output wire id_2;
  output wire id_1;
  wire [1 : -1 'b0] id_4;
  if (1'b0) begin : LABEL_0
    assign id_3 = id_4 * id_4;
  end
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
