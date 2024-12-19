// Seed: 947626565
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  assign module_1.id_3 = 0;
  wire id_7;
  wire id_8;
  tri0 id_9 = 1'h0;
  assign id_7 = id_5;
  assign id_1 = id_6;
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always begin : LABEL_0
    id_12 <= (1);
    if (1) begin : LABEL_0
      id_5 = 1'b0;
    end
    id_12 = ~id_5;
    id_9  = id_1;
  end
  tri0 id_14 = 1, id_15 = id_3, id_16;
  module_0 modCall_1 (
      id_16,
      id_5,
      id_15,
      id_5,
      id_10
  );
  always id_11 <= id_8;
  id_17(
      .id_0(id_13), .id_1(id_9)
  );
  wire id_18, id_19;
  assign id_9 = 1;
  wire id_20;
  always @(*) $display(id_3, id_13, id_16);
endmodule
