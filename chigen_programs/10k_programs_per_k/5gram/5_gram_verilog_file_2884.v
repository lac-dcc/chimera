// Seed: 495631611
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
    id_10
);
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  tri1 id_12, id_13, id_14;
  wire id_15;
  id_16(
      1'b0, id_7 == id_12
  );
  wire id_17;
  tri0 id_18 = 'h0;
  wire id_19;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_18 = 0;
  wire id_5;
  always @(posedge 1) begin : LABEL_0
    id_1 = #id_6 1 == id_1;
  end
endmodule
