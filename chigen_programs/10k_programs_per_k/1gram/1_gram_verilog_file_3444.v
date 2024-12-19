// Seed: 3262722222
module module_0 (
    input tri1 id_0,
    input wor id_1,
    output tri0 id_2,
    input supply1 id_3,
    input uwire id_4,
    output wor id_5
    , id_7
);
endmodule
module module_1 (
    input logic id_0,
    output tri1 id_1,
    input logic id_2,
    input supply0 id_3,
    input uwire id_4
);
  logic id_6;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_1,
      id_3,
      id_4,
      id_1
  );
  assign modCall_1.type_1 = 0;
  assign id_6 = id_2;
  initial id_6 <= id_0;
  wire id_7;
  wire id_8;
endmodule
module module_2 (
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31
);
  output wire id_31;
  output wire id_30;
  output wire id_29;
  output wire id_28;
  input wire id_27;
  inout wire id_26;
  output wire id_25;
  input wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_32;
  assign id_18 = 1;
  wire id_33;
  always id_26 <= id_3;
  assign id_22 = id_24;
  always_comb begin : LABEL_0
    id_33 = id_27;
    if (1) $display(id_9);
  end
  wire id_34;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7(1),
        .id_8(~"" + 1'd0),
        .id_9(id_10["" : ~1])
    ),
    id_11,
    id_12,
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
    id_24
);
  input wire id_20;
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_13[('b0)][1] = !id_22;
  module_2 modCall_1 (
      id_22,
      id_24,
      id_15,
      id_6,
      id_3,
      id_1,
      id_1,
      id_22,
      id_2,
      id_22,
      id_22,
      id_23,
      id_2,
      id_24,
      id_6,
      id_1,
      id_19,
      id_2,
      id_2,
      id_11,
      id_3,
      id_19,
      id_11,
      id_11,
      id_4,
      id_15,
      id_18,
      id_1,
      id_22,
      id_22,
      id_11
  );
  always_comb id_15 <= {id_12};
  reg id_25, id_26, id_27, id_28, id_29 = id_15;
  tri0 id_30;
  always_comb begin : LABEL_0
    begin : LABEL_0
      assign id_19 = 1;
      begin : LABEL_0
        id_28 <= id_17;
      end
      id_17 = 1;
    end
    begin : LABEL_0
      id_30 = 1;
      begin : LABEL_0
        {id_21, id_12} <= 1'b0;
      end
    end
  end
  wire id_31, id_32;
endmodule : SymbolIdentifier
