// Seed: 4145479084
module module_0;
  assign id_1 = 1;
  generate
    always @(1 or negedge id_1) begin : LABEL_0
      if (id_1) begin : LABEL_0
        id_1 <= id_1;
      end else begin : LABEL_0
        id_1 = 1;
      end
    end
  endgenerate
  wire id_2;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  supply0 id_10, id_11, id_12, id_13;
  id_14(
      .id_0(1'b0),
      .id_1(1'h0),
      .id_2(id_2[1]),
      .id_3(id_3),
      .id_4(1),
      .id_5(1'b0),
      .id_6(id_3[1]),
      .id_7(id_4),
      .id_8(1'b0),
      .id_9(id_10 | 1),
      .id_10(id_10),
      .id_11(1'b0)
  );
  wire id_15;
  module_0 modCall_1 ();
  xnor primCall (
      id_1, id_10, id_11, id_12, id_13, id_14, id_15, id_2, id_3, id_4, id_6, id_8, id_9
  );
endmodule
