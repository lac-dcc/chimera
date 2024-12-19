// Seed: 3239580642
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
    id_12
);
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2  = id_8;
  assign id_10 = id_1;
  assign id_8  = id_8;
  always
    while (1) begin : LABEL_0
      if (1) begin : LABEL_0
        id_10 = id_12;
      end
    end
  assign id_8 = id_12;
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
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_10,
      id_5,
      id_6,
      id_10,
      id_10,
      id_2,
      id_10,
      id_10,
      id_3
  );
  always @(negedge 1'h0) begin : LABEL_0
    id_9 <= 1 !== id_7;
  end
  wire id_11;
endmodule
