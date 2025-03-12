// Seed: 3500144356
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  logic [1 'b0 : -1] id_10;
  ;
  logic [1 : (  1 'd0 *  1  )] id_11;
  assign id_11   = "";
  assign id_5[1] = id_11;
endmodule
module module_1 #(
    parameter id_1  = 32'd38,
    parameter id_11 = 32'd71
) (
    _id_1,
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
    id_16
);
  inout logic [7:0] id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire _id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  module_0 modCall_1 (
      id_3,
      id_15,
      id_6,
      id_3,
      id_16,
      id_6,
      id_6,
      id_12,
      id_9
  );
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire _id_1;
  always @(negedge id_5) begin : LABEL_0
    if (1)
      if (-1)
        if (1) assign id_3 = id_16;
        else if (1) begin : LABEL_1
          assert (id_6 ^ 1);
        end else id_16[id_1 : id_11] <= 1;
      else $unsigned(44);
    ;
  end
endmodule
