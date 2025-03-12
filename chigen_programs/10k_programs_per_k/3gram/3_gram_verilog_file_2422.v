// Seed: 31539695
module module_0 #(
    parameter id_5 = 32'd27
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_2 = id_3;
  wire _id_5;
  assign id_1 = id_5;
  wire id_6;
  assign id_2[!id_5] = id_2;
endmodule
module module_1 #(
    parameter id_15 = 32'd82,
    parameter id_9  = 32'd45
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout logic [7:0] id_16;
  input wire _id_15;
  input wire id_14;
  inout logic [7:0] id_13;
  output wire id_12;
  inout tri0 id_11;
  output wire id_10;
  input wire _id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  module_0 modCall_1 (
      id_5,
      id_16,
      id_19,
      id_4
  );
  inout wire id_1;
  assign id_2 = id_8;
  logic [-1 : 1] id_20 = id_8;
  assign {id_8, -1, id_18} = id_13;
  always #1
    for (id_11 = id_17; 1; id_2[id_9] = -1'b0) begin : LABEL_0
      id_20 <= id_9;
    end
  assign id_16[-1 : id_15] = -1;
  assign id_11 = 1 && 1;
  assign id_2 = id_13[-1];
  wire id_21;
endmodule
