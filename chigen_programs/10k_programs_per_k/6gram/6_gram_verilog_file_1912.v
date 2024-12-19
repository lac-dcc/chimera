// Seed: 1115781554
module module_0 ();
  reg id_2 = id_1;
  always @(posedge 1) id_1 <= id_1;
  always @(posedge 1) begin : LABEL_0
    if (id_2) begin : LABEL_0
      id_2 = #id_3 1'd0;
    end
  end
endmodule
module module_1;
  initial begin : LABEL_0
    if (1'b0 && id_1) begin : LABEL_0
      id_1 <= 1;
    end
    wait (1);
  end
  wire id_2;
  module_0 modCall_1 ();
  assign modCall_1.type_4 = 0;
  always disable id_3;
endmodule
module module_2 (
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
    id_21,
    id_22
);
  inout wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6[1'b0] = id_9 !=? id_11 ? id_21 : 1;
  module_0 modCall_1 ();
endmodule
