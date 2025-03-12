// Seed: 3234257327
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wire id_3,
    input tri0 id_4,
    input wire id_5,
    input tri  id_6
);
endmodule
module module_1 (
    input supply1 id_0,
    input wire id_1,
    input tri1 id_2,
    output supply1 id_3
);
  localparam id_5 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_0 #(
    parameter id_29 = 32'd27
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
    id_23,
    id_24,
    id_25,
    module_2,
    id_27,
    id_28
);
  output wire id_28;
  inout wire id_27;
  inout wire id_26;
  inout wire id_25;
  input wire id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire _id_29;
  wire [1 : id_29] id_30;
  assign id_19 = ~id_27;
  assign id_28 = ~id_30;
endmodule
module module_3 #(
    parameter id_14 = 32'd63
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
    _id_14,
    id_15,
    id_16
);
  inout wire id_16;
  output wire id_15;
  inout wire _id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  output wire id_7;
  output logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  module_2 modCall_1 (
      id_1,
      id_12,
      id_4,
      id_12,
      id_4,
      id_1,
      id_7,
      id_4,
      id_10,
      id_13,
      id_10,
      id_13,
      id_3,
      id_13,
      id_10,
      id_10,
      id_4,
      id_3,
      id_4,
      id_5,
      id_11,
      id_10,
      id_1,
      id_13,
      id_3,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.id_29 = 0;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  generate
    for (id_17 = -1; 1; id_6[id_14 : (1)] = 1) begin : LABEL_0
      assign id_9[id_14] = 1 - id_17++;
      logic id_18;
    end
  endgenerate
endmodule
