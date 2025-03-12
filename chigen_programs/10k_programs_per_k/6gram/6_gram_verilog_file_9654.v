// Seed: 1670352704
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
    id_17
);
  output wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_18;
  ;
  assign id_14 = id_10;
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
    id_14
);
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input logic [7:0] id_10;
  input wire id_9;
  output tri0 id_8;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_6,
      id_7,
      id_9,
      id_7,
      id_6,
      id_9,
      id_4,
      id_2,
      id_7,
      id_7,
      id_4,
      id_7,
      id_13,
      id_4,
      id_8
  );
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout uwire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = -1 ? -1'b0 - -1 : id_11 * id_2 + id_7 ? (id_6 && -1) : 1;
  always @((1 - id_7) or -1 or posedge 1) begin : LABEL_0
    id_15;
  end
  assign id_4 = -1 && id_10 ? 1 : id_6 ? id_10[-1'b0] : id_4 ? id_4 : id_11 ? ~id_9 : id_2;
endmodule
