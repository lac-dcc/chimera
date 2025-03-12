// Seed: 2533190220
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = id_2;
endmodule
module module_1 #(
    parameter id_3 = 32'd25
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  input logic [7:0] id_1;
  always begin : LABEL_0
    id_2[-1] = id_1[1] & 1;
  end
  wire id_5;
  id_6 :
  assert property (@(posedge id_1 or posedge !id_4) 1'b0)
  else;
  wire [id_3 : -1 'b0] id_7;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_5
  );
endmodule
