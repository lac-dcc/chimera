// Seed: 3890954972
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
    id_18
);
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    @(posedge id_12);
    if (1) begin : LABEL_0
      id_4  <= "";
      id_13 <= 1'h0;
    end
    release id_13;
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  initial id_10 <= 1'h0;
  assign id_6  = id_10;
  assign id_10 = id_4;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7,
      id_10,
      id_7,
      id_1,
      id_11,
      id_1,
      id_1,
      id_8,
      id_9,
      id_1,
      id_6,
      id_1,
      id_8,
      id_7,
      id_7,
      id_7
  );
  assign id_10 = id_3;
endmodule
