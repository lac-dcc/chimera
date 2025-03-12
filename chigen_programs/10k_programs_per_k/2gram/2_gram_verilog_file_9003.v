// Seed: 3995824885
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
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_10;
  ;
  id_11 :
  assert property (@(-1 or posedge id_7) (-1))
  else begin : LABEL_0
    if (1) begin : LABEL_1
      id_11 <= id_8;
    end
  end
  assign id_6 = id_6;
  parameter id_12 = 1;
  wire id_13;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd4,
    parameter id_3 = 32'd48
) (
    _id_1
);
  input wire _id_1;
  initial $clog2(26);
  ;
  generate
    logic [7:0][id_1 : id_1  +  1] id_2;
    supply1 _id_3 = 1 & id_2[id_3];
  endgenerate
  wire [1 'h0 : id_3] id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
