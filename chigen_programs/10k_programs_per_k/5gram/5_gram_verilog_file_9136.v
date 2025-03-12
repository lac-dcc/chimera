// Seed: 3184494481
module module_0 (
    id_1,
    id_2,
    id_3
);
  output reg id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge -1) begin : LABEL_0
    #1 begin : LABEL_1
      deassign id_3;
    end
    id_3 = id_2;
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout reg id_18;
  inout logic [7:0] id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_18
  );
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_17[1] or posedge 'h0) begin : LABEL_0
    $unsigned(24);
    ;
  end
  wire id_19;
  wire id_20;
  wire id_21;
  initial begin : LABEL_1
    id_18 = id_10 == (id_18);
  end
endmodule
