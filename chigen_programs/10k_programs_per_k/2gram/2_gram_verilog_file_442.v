// Seed: 1944064754
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
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign module_1.id_3 = 0;
  if (1) begin : LABEL_0
    wire id_21 = id_16;
    wire id_22;
  end else begin : LABEL_0
    assign id_17 = 1;
    for (id_23 = 1; id_14; id_20 = (id_5)) begin : LABEL_0
      wire id_24;
    end
    wire id_25 = {id_1{id_1}};
    id_26(
        id_15, 1'b0 * 1, 1, !1, id_8
    );
    wire id_27;
  end
  initial begin : LABEL_0
    id_5 = id_9;
  end
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
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_4,
      id_3,
      id_1,
      id_3,
      id_3,
      id_4
  );
  assign id_4 = 1 - id_6;
  always begin : LABEL_0
    id_3 = 1;
  end
  id_7(
      .id_0(id_2)
  );
  assign id_1 = 1;
  id_8(
      .id_0(id_6),
      .id_1(id_1),
      .id_2(1 + 1),
      .id_3(id_1 / id_4),
      .id_4(1),
      .id_5(id_2),
      .id_6(1),
      .id_7(id_6),
      .id_8(1),
      .id_9(1)
  );
  assign id_2 = 1;
  wire id_9;
  id_10(
      .id_0
  );
endmodule
