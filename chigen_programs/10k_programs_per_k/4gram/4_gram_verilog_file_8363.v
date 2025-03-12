// Seed: 3756432070
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout reg id_2;
  output wire id_1;
  always @(posedge id_2) begin : LABEL_0
    id_2 <= $realtime;
  end
endmodule
module module_1 #(
    parameter id_8 = 32'd30
) (
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
  inout supply0 id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire _id_8;
  wire id_9, id_10;
  reg [id_8 : id_8] id_11;
  assign id_5 = 1;
  wire id_12;
  ;
  wire id_13;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_9,
      id_10
  );
  wire id_14;
  always_comb @(posedge id_9) id_11 = id_10;
endmodule
