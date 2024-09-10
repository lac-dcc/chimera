// Seed: 927039693
module module_0 #(
    parameter id_10 = 32'd87,
    parameter id_12 = 32'd8,
    parameter id_24 = 32'd76,
    parameter id_5  = 32'd78,
    parameter id_6  = 32'd88,
    parameter id_7  = 32'd84,
    parameter id_9  = 32'd3
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    _id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    _id_12,
    id_13
);
  output id_13;
  input _id_12;
  output id_11;
  input _id_10;
  input _id_9;
  output id_8;
  output _id_7;
  input _id_6;
  input _id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  assign id_9 = 1;
  always @(*)
    if (1) id_1 <= 1 ? id_12 : id_4;
    else begin
      id_3 = id_3;
    end
  type_28 id_14;
  type_29 id_15;
  reg id_16;
  assign id_3[id_10(1)] = 1;
  type_31(
      1'b0, 1, id_6
  );
  reg id_17;
  type_33(
      1, id_9, 1
  );
  assign id_13 = id_3;
  reg id_18 = id_17;
  always @(*) begin
    id_13 <= id_18;
    id_18[id_6] <= id_13;
  end
  logic id_19 (
      .id_0(1),
      .id_1(1),
      .id_2(id_14[id_5-1]),
      .id_3(id_4),
      .id_4(id_6),
      .id_5(1)
  );
  reg id_20;
  always @(posedge {1'd0{id_11}}) begin
    if (id_7 <= id_19) id_1 = 1'd0;
    id_16 <= id_3;
    if (1'b0) begin
      if (id_2) begin
        id_16 = 1;
      end
      if (1) begin
        id_5 <= 1;
      end else id_10 <= #1 1;
    end
    id_7  = id_14[id_9[1'b0 : 1]];
    id_20 = 1;
    logic id_21;
    SystemTFIdentifier(id_13[1'h0 : (id_12)], 1 - id_10);
    id_10 = 1 - 1;
    id_20 <= 1;
    if (id_11) begin
      SystemTFIdentifier(1'h0);
      #1;
      id_12 <= 1;
      id_15 <= id_10;
      if ("") id_9 <= id_4;
    end
    SystemTFIdentifier;
  end
  type_37(
      id_15, id_14, 1
  );
  logic id_22, id_23, _id_24, id_25;
  assign id_15[id_24[id_7]] = id_12;
  logic id_26;
  initial begin
    id_5 <= id_18;
    id_5 <= 1;
  end
  logic id_27;
  initial begin
    id_10 = 1 && id_22;
    id_4 <= 1;
    case (id_16)
      default: id_19 = id_12;
    endcase
  end
endmodule
module module_1 (
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input id_18;
  output id_17;
  output id_16;
  output id_15;
  input id_14;
  input id_13;
  output id_12;
  output id_11;
  output id_10;
  output id_9;
  input id_8;
  output id_7;
  output id_6;
  output id_5;
  output id_4;
  input id_3;
  output id_2;
  input id_1;
  assign id_15 = 1 - 1'b0;
  logic id_19;
  always @(1) begin
    id_16 = id_6 - 1 && id_8 == 1 ? 1'd0 : id_19;
    id_3  = id_17;
    id_5 <= 1'b0;
    id_15 = 1;
  end
endmodule
