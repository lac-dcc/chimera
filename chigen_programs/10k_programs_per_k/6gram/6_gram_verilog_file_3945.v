// Seed: 3742227617
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
    id_12
);
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_13;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    output logic id_2,
    output wand id_3,
    input wor id_4,
    output tri0 id_5,
    output supply1 id_6
);
  id_8(
      .id_0(1), .id_1(1)
  );
  wire id_9;
  assign id_3 = id_0;
  wire id_10;
  supply0 id_11;
  assign id_11 = 1;
  tri id_12;
  always @(negedge id_9 or(id_4 - 'b0)) begin : LABEL_0
    id_2 <= 1;
  end
  id_13(
      .id_0(id_3), .id_1(id_1), .id_2(id_10), .id_3(1 & 'd0), .id_4(1)
  );
  wire id_14;
  wire id_15;
  assign id_12 = 1'b0;
  module_0 modCall_1 (
      id_14,
      id_11,
      id_11,
      id_11,
      id_9,
      id_15,
      id_15,
      id_14,
      id_11,
      id_12,
      id_9,
      id_10
  );
  wire id_16;
  assign id_6 = 1'b0 !== 1;
  genvar id_17;
  assign id_2 = 1 ? 1 : 1;
  initial $display(1);
endmodule
