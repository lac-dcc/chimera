// Seed: 126277440
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  id_3(
      1'b0, 1
  );
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1) begin : LABEL_0
    fork
      #1;
    join
  end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2
  );
endmodule
