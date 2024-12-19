// Seed: 2951843496
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_12(
      .id_0(id_3), .id_1(1)
  );
  wire id_13;
  wire id_14;
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
  inout wire id_2;
  output wire id_1;
  always @(*) begin : LABEL_0
    if (1) $display(1, 1, id_5, 1);
  end
  reg id_6;
  assign id_3 = 1 ? 1'b0 : id_2;
  assign id_2 = 1'b0 + 1;
  assign id_1 = 1;
  reg id_7;
  final $display;
  wire id_8;
  reg  id_9;
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_2,
      id_8,
      id_10,
      id_11,
      id_8,
      id_3,
      id_11,
      id_11
  );
  id_12(
      .id_0(id_10), .id_1(1), .id_2(!id_2)
  );
  final begin : LABEL_0
    id_1 <= 1 - 1'b0;
    if (id_4) begin : LABEL_0
      if (1'h0) id_9 <= id_4;
    end else begin : LABEL_0$display
      ;
      id_6 <= 1;
    end
  end
endmodule
