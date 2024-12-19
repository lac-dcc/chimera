// Seed: 1460828257
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_4 = 0;
  id_4(
      .id_0(1'b0), .id_1(1'h0), .id_2(1), .id_3(1), .id_4(id_3), .id_5(1'h0), .id_6(id_2)
  );
  assign id_1 = 1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5
  );
  uwire id_6 = 1;
  always_ff @(*) begin : LABEL_0
    id_4 <= id_1;
  end
  wire id_7;
endmodule
