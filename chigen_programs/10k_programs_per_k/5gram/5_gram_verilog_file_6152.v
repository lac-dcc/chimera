// Seed: 3094974151
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_1), .min()
  );
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
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_10;
  assign id_6 = id_4++;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_9
  );
  assign id_10[1] = id_1;
  wire id_11;
  always @(posedge id_3) begin : LABEL_0
    id_1 <= id_8;
  end
  wire id_12;
  reg
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26;
  id_27(
      .id_0(id_2), .id_1(""), .id_2(1'b0)
  );
  wire id_28;
  generate
    always @(id_26 or posedge 1'b0) begin : LABEL_0
      begin : LABEL_0
        id_20 <= 1 | 1;
        id_22 <= 1 - 1;
      end
    end
  endgenerate
endmodule
