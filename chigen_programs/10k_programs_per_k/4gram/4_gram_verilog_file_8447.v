// Seed: 3604171580
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
    id_20
);
  input wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_21;
  id_22 :
  assert property (@(posedge id_18) 1)
  else $display(id_17 - id_17, 1);
  id_23(
      .id_0(id_10++), .id_1(1)
  );
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
    id_12
);
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_8,
      id_4,
      id_12,
      id_13,
      id_7,
      id_13,
      id_12,
      id_8,
      id_10,
      id_1,
      id_6,
      id_8,
      id_8,
      id_13,
      id_10,
      id_8,
      id_7,
      id_4
  );
  always_ff @(posedge 1) begin : LABEL_0
    id_10 = 1 - 1;
  end
  assign id_3 = id_8;
  or primCall (id_2, id_4, id_7, id_12, id_8, id_1, id_11, id_6, id_13, id_5, id_10);
  assign id_2 = 1;
endmodule
