// Seed: 2445956299
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
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
  output wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(negedge id_15 or posedge id_7) begin : LABEL_0
    id_3 = 1;
    id_12 <= 1;
    fork
      for (id_5 = ""; 1; id_10 = id_17) $display($display);
    join_any
  end
  wire id_19;
  module_0 modCall_1 (
      id_1,
      id_19,
      id_13,
      id_5,
      id_10
  );
  assign id_1 = id_16#(
      .id_5(id_5 | 1'b0),
      .id_8(1'b0)
  );
  wire id_20;
  uwire id_21 = 1'b0, id_22, id_23;
endmodule
