// Seed: 1130470487
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
    id_16
);
  input wire id_16;
  input wire id_15;
  assign module_1.id_0 = 0;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_17;
endmodule
module module_0 #(
    parameter id_2 = 32'd10
) (
    output logic id_0
    , id_5,
    input tri id_1,
    input supply0 _id_2,
    input tri0 module_1
);
  parameter id_6 = 1;
  xor primCall (id_0, id_5, id_1, id_6);
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  always @(*) begin : LABEL_0
    `define pp_7 0
    id_0  <= -1;
    `pp_7 <= id_5;
  end
  assign id_5[id_2] = id_2 & (id_1 == 1);
endmodule
