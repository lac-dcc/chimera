// Seed: 4207782828
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
    id_16
);
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_13 = 1;
endmodule
module module_1 (
    module_1,
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
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_13 = id_13;
  module_0 modCall_1 (
      id_5,
      id_13,
      id_5,
      id_5,
      id_10,
      id_5,
      id_5,
      id_3,
      id_13,
      id_1,
      id_1,
      id_10,
      id_5,
      id_7,
      id_13,
      id_5
  );
  initial begin : LABEL_0
    id_4 <= 1 == id_10;
    if (id_2) begin : LABEL_0
      id_4 <= id_5 !== 1'd0;
    end else begin : LABEL_0
      id_8 = id_11 == ~id_3;
    end
    id_11 <= 1'b0 * id_3;
  end
endmodule
