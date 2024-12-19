// Seed: 1399149478
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  wire id_8;
  assign id_8 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  if (id_1) begin : LABEL_0
    id_6(
        .id_0(1'b0 == 1), .id_1(id_5), .id_2(id_4[1]), .id_3(1), .id_4(1), .id_5(1)
    );
  end else begin : LABEL_0
    assign id_3 = id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2,
      id_1
  );
endmodule
