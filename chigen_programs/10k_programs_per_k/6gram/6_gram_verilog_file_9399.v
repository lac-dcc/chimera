// Seed: 2938972701
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  reg  id_8 = 1'd0 ? 1'b0 * 1 - id_6 : 1 ? |id_3 == 1 : id_6;
  wire id_9;
  always
  fork : SymbolIdentifier
    id_10();
    #1 id_7 = 1;
    begin : LABEL_0
      @(posedge 1) begin : LABEL_0
        id_6 <= 1 == ~(1);
      end
    end
  join
  always @(posedge id_3 or 1) begin : LABEL_0
    id_4 <= 1;
  end
  tri0 id_11;
  tri  id_12 = 1;
  wire id_13;
  wire id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  assign id_11 = 1'b0;
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
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_18,
      id_17,
      id_2,
      id_17,
      id_18
  );
  assign modCall_1.id_11 = 0;
  wire id_19;
  initial begin : LABEL_0
    id_10 <= #id_17 id_17;
    id_5  <= id_16 > 1'h0;
  end
  assign id_16 = 1;
endmodule
