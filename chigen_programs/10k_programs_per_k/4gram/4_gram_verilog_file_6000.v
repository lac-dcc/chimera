// Seed: 1848041697
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
  input wire id_1;
  always disable id_6;
  genvar id_7;
  wire id_8 = id_8;
  wire id_9;
  wire id_10;
  id_11(
      1, 1
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
    id_21
);
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(id_18 or posedge 1) begin : LABEL_0
    wait (id_5);
    if (id_21) begin : LABEL_0
      repeat (1'b0) begin : LABEL_0
        id_5 <= id_14;
      end
    end else id_18 <= #1 id_8;
  end
  module_0 modCall_1 (
      id_21,
      id_16,
      id_7,
      id_2,
      id_3
  );
  wire id_22;
  wire id_23;
endmodule
