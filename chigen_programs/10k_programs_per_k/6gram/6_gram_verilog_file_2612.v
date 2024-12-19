// Seed: 1771394743
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  assign id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1 or posedge 1 + id_5) begin : LABEL_0
    id_5 <= 1;
    id_4 <= id_4;
  end
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_3
  );
endmodule
