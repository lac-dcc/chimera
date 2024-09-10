// Seed: 1473619530
`default_nettype id_1
module module_0 #(
    parameter id_17 = 32'd18,
    parameter id_20 = 32'd45
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output id_8;
  output id_7;
  input id_6;
  output id_5;
  output id_4;
  output id_3;
  input id_2;
  output id_1;
  assign id_7 = 1;
  reg id_9 = 1, id_10;
  assign id_1 = 1'b0;
  always @(~id_6 or ~id_1) begin
    if (1) begin
      id_10 <= id_1;
    end
  end
  assign id_9 = 1'b0;
  generate
    if (id_3) begin : id_11
      if (id_1[1]) begin
        always @(id_8 or posedge id_6)
          if (id_9) id_1 <= !1;
          else id_3 <= 1;
      end
      type_0 id_12 (.id_0(id_9));
      defparam id_13.id_14 = 1;
      assign id_4 = 1'd0 !== id_9;
      logic id_15;
    end else begin : id_16
      type_1 _id_17 (
          .id_0({id_4, 1, 1, id_8}),
          .id_1(id_9)
      );
      defparam id_18.id_19 = id_10[1];
      always @(posedge 1 or posedge 1) begin : _id_20
        SystemTFIdentifier(1, 1, 1'h0, 1, 1, (1'b0 & 1 & 1));
        if (id_1) begin
          id_17 = id_1[1 : id_20[id_17]];
        end else begin
          id_2 <= id_10;
          SystemTFIdentifier(1);
          id_5 <= 1'b0;
        end
      end
    end
  endgenerate
  type_23(
      1'b0, {"", 1, id_1, id_4, 1, 1}, !id_7
  );
endmodule
module module_1 #(
    parameter id_2 = 32'd36
) (
    output id_1,
    input _id_2,
    input id_3,
    output id_4,
    output id_5,
    output logic id_6,
    input id_7,
    input id_8,
    output id_9
);
  logic id_10 = id_9 - id_10 ^ id_7;
  initial begin
    while (1) SystemTFIdentifier(id_10);
  end
  assign id_6 = 1 + 1;
  assign id_6 = 1'b0;
  logic id_11 = 1, id_12;
  logic id_13;
  logic id_14;
  logic id_15;
  logic id_16;
  logic id_17;
  assign id_6[1] = 1;
  assign id_15 = 1;
  assign id_15[id_2] = id_5;
  logic id_18 = id_5;
  logic id_19;
  assign id_5 = 1'b0;
endmodule
