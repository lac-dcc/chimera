// Seed: 2086271713
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6#(
      .product(id_13),
      .id_8(id_14 | -1'd0)
  ) = 1;
endmodule
module module_1 (
    id_1#(
        .id_2(~-1),
        .id_3(-1),
        .id_4(-1)
    ),
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  localparam id_9 = -1;
  logic [7:0] id_10;
  id_11(
      .id_0(1), .id_1(id_10), .id_2(id_7)
  );
  bit id_12;
  assign id_9 = id_6;
  localparam id_13 = id_9;
  assign id_5 = id_1;
  wire id_14;
  assign id_7 = id_10[1];
  module_0 modCall_1 (
      id_8,
      id_13,
      id_13,
      id_13,
      id_5,
      id_8,
      id_14,
      id_14,
      id_13,
      id_3,
      id_13,
      id_3,
      id_9,
      id_14,
      id_13,
      id_13,
      id_8,
      id_3,
      id_14,
      id_3
  );
  always begin : LABEL_0
    @(posedge 1) id_2 = 1'h0;
    if (!-1);
    else begin : LABEL_0
      if (-1'b0) @(posedge id_8) id_12 <= #1 -1;
      else #1 id_7 <= {1, (-1), id_2, 1};
    end
  end
  wand id_15, id_16, id_17;
  wire id_18 = id_3;
  id_19(
      -1, {1{-1'b0}}, id_7, 1
  );
endmodule
