// Seed: 2364925743
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  tri0 id_7 = 1;
  wire id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  always @(1'd0 or negedge id_7) begin : LABEL_0
    id_8 = id_2;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5, id_6;
  assign id_5 = id_2;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_2,
      id_3,
      id_4
  );
  assign id_2 = (~1'b0);
  id_7(
      .id_0(1), .id_1(id_2), .id_2(id_5), .id_3(1'b0), .id_4(id_4 - 1), .id_5(id_4)
  );
endmodule
