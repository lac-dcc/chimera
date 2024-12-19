// Seed: 786546420
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_4(
      .id_0(id_5), .id_1(id_2)
  );
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_6,
      id_6,
      id_1,
      id_2,
      id_1
  );
  always @(posedge id_6) begin : LABEL_0
    id_3 = id_1;
  end
endmodule
