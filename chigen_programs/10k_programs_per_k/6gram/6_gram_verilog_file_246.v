// Seed: 3986671940
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5[1'b0] = 1;
endmodule
module module_1 #(
    parameter id_16 = 32'd4,
    parameter id_6  = 32'd71
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
    id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18
);
  input wire id_18;
  input wire id_17;
  inout wire _id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_18,
      id_11,
      id_2,
      id_10,
      id_15
  );
  inout tri0 id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  assign id_11 = id_13 ? id_17 : 1;
  wire id_19;
  always @(posedge id_12) begin : LABEL_0
    $unsigned(76);
    ;
  end
  assign id_5 = id_2[id_6 :-1'b0-id_16];
endmodule
