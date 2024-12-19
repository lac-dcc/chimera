// Seed: 992618011
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  id_8(
      .id_0(), .id_1(id_3), .id_2(id_6 - 1)
  );
  generate
    if (id_2) begin : LABEL_0
      id_9(
          .id_0(1'h0), .id_1(id_1), .id_2(1 == 1), .id_3(), .id_4(id_2), .id_5(id_5), .id_6(id_2)
      );
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge id_1) begin : LABEL_0
    id_2 = 1 < 1;
    id_5 = id_1;
  end
  wire id_6, id_7;
  wire id_8, id_9;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_2,
      id_9,
      id_6,
      id_4
  );
endmodule
