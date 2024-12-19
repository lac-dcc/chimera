// Seed: 497413668
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_7 = 1'b0;
  assign module_1.id_5 = 0;
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
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_14(
      id_11, id_12
  );
  or primCall (id_4, id_8, id_15, id_12, id_2, id_7, id_3, id_14, id_6, id_10, id_9);
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_6,
      id_9,
      id_4,
      id_2,
      id_8
  );
  always @(posedge 1 or posedge 1) begin : LABEL_0
    if (1'b0) id_5 <= 1'h0;
  end
  wire id_16;
endmodule
