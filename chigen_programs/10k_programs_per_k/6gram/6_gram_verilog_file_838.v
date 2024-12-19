// Seed: 1730814504
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3[1] = id_3;
  wire id_4;
  assign module_1.id_7 = 0;
  id_5(
      .id_0(id_3), .id_1(1), .id_2(1), .id_3(1'h0), .id_4(1)
  );
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
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge id_1 + 1'b0 + 1 * 1 - 1'h0 ^ id_3 >= 1) begin : LABEL_0
    id_6.id_7;
  end
  generate
    if (1'b0) begin : LABEL_0
      for (id_8 = id_2; id_1 >= 1'b0; id_1 = 1) begin : LABEL_0
        always @(posedge 1'b0 or posedge 1) id_8 <= id_5[1'b0];
      end
      always @(negedge 1) begin : LABEL_0
        wait (1);
        id_1 = id_1;
      end
    end else begin : LABEL_0
      assign id_4 = 1 ? 1 : id_2;
      wire id_9;
    end
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_9,
      id_5
  );
endmodule
