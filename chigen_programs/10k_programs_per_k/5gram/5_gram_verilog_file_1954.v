// Seed: 231337813
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_11 = 32'd79
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
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output logic [7:0] id_14;
  input logic [7:0] id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_16,
      id_12,
      id_15,
      id_17
  );
  input wire _id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  assign id_14[id_11] = id_3[-1'd0==""];
  wire id_18;
  xor primCall (id_10, id_2, id_17, id_1, id_15, id_8, id_13, id_12, id_16, id_9);
  always @(-1, posedge (id_1 ^ 1)) begin : LABEL_0
    wait ((1) > id_13[1]);
  end
endmodule
