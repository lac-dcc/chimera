// Seed: 2897390951
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always_comb id_5 = id_6 == !1 & 1;
  id_7(
      id_2, id_2, id_6, 1, id_4, 1, id_6, 1'b0
  );
  always begin : LABEL_0
    @(id_5) begin : LABEL_0
      id_7 += 1'h0;
    end
    id_5 = 1;
    if (1'b0) id_2 <= 1;
    else id_3 <= 1'h0;
  end
  assign module_1.id_14 = 0;
  wire id_8, id_9;
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
    id_12
);
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0;
  always @(1)
    if (1'd0)
      @(id_1 * id_4 or posedge id_1 == 1) begin : LABEL_0
        if (1) begin : LABEL_0
          if ({id_4 ? 1 : (1), id_5, 1} - 1 < (1)) id_2 = id_9;
          else id_4 <= id_5 ? 1 : 'b0 - id_4;
          @(posedge 1) if (1) id_12 <= id_4;
          id_3 = (1);
        end
      end
  reg id_13, id_14, id_15, id_16;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_14,
      id_13,
      id_1,
      id_4
  );
  assign #1 id_13 = id_4;
  wire id_18;
endmodule
