// Seed: 238101332
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_28 = 0;
  assign id_8 = id_3;
  always @(posedge id_6) begin : LABEL_0
    $unsigned(96);
    ;
  end
endmodule
module module_1 #(
    parameter id_23 = 32'd51,
    parameter id_25 = 32'd39,
    parameter id_28 = 32'd64
) (
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
    id_22,
    _id_23,
    id_24,
    _id_25,
    id_26,
    id_27
);
  input wire id_27;
  inout wire id_26;
  input wire _id_25;
  output wire id_24;
  inout wire _id_23;
  output logic [7:0] id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  inout tri1 id_17;
  output wire id_16;
  inout logic [7:0] id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout supply0 id_5;
  output wire id_4;
  output wire id_3;
  output supply0 id_2;
  inout wire id_1;
  logic [1 : id_25] _id_28;
  assign id_22[-1 : (!-1)] = -1;
  assign id_5 = -1 == id_28;
  assign id_2 = 1 != id_15[~1];
  module_0 modCall_1 (
      id_21,
      id_9,
      id_19,
      id_9,
      id_1,
      id_19,
      id_1,
      id_1,
      id_4,
      id_26,
      id_13
  );
  wire id_29;
  ;
  assign id_17 = {-1, id_25};
  wire [-1 : id_23  ^  id_28] id_30 = id_26;
endmodule
