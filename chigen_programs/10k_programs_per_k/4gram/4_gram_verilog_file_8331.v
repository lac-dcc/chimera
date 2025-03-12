// Seed: 2851681653
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_comb @(posedge id_7) begin : LABEL_0
    $unsigned(81);
    ;
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd27
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  input wire id_9;
  output logic [7:0] id_8;
  inout wire id_7;
  input wire _id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_10,
      id_7,
      id_7,
      id_5,
      id_5,
      id_5,
      id_3,
      id_1,
      id_7,
      id_4,
      id_3
  );
  output wire id_1;
  assign id_8[1+:id_6] = id_11[-1];
  xnor primCall (id_3, id_7, id_11, id_2);
endmodule
