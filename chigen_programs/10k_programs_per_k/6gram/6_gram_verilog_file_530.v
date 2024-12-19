// Seed: 3140289722
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_2 = #id_4 1;
    id_1 <= 1'b0;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1) id_1 <= #1 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2;
  wire id_2;
  always @(negedge 1 or posedge id_1 * 1) begin : LABEL_0
    id_1 <= 1;
  end
endmodule
module module_3 (
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
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_17 = 1'b0;
  module_2 modCall_1 ();
endmodule
