// Seed: 3658401927
module module_0 (
    id_1
);
  output wire id_1;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd92,
    parameter id_2  = 32'd16
) (
    id_1[1'b0 :-1],
    _id_2,
    id_3,
    id_4,
    id_5[-1 : id_2&1/1],
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14
);
  inout wire id_14;
  inout wire _id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output logic [7:0] id_5;
  inout tri id_4;
  output wire id_3;
  input wire _id_2;
  input logic [7:0] id_1;
  module_0 modCall_1 (id_8);
  assign id_4 = 1;
  wire id_15;
  bit id_16, id_17, id_18;
  always begin : LABEL_0
    begin : LABEL_1
      $signed(55);
      ;
      id_17 <= 1;
      SystemTFIdentifier;
    end
  end
  logic id_19[1 'h0 : id_13];
  id_20 :
  assert property (@(*) id_18) begin : LABEL_2
    assign id_19 = -1;
  end
  logic id_21;
  ;
endmodule
