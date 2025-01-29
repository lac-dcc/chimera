// Seed: 3020034818
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  input wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  generate
    assign id_1 = 1'b0;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4 = id_3;
  assign id_1 = id_4;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_2,
      id_4,
      id_3,
      id_2,
      id_2,
      id_2,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_4,
      id_4,
      id_3
  );
  assign id_1 = !id_2;
  initial @(posedge $display(1) or posedge $display(-1, 1)) $display(id_2);
endmodule
