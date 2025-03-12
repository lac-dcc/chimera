// Seed: 4044344851
module module_0;
  wire id_1;
endmodule
module module_1 #(
    parameter id_6 = 32'd13
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output logic [7:0] id_2;
  inout logic [7:0] id_1;
  bit id_4 = id_1;
  module_0 modCall_1 ();
  wire id_5;
  assign id_2[1] = 1;
  wire _id_6;
  always @(posedge -1) begin : LABEL_0
    id_4 = id_1[id_6];
  end
  assign id_1[1] = id_5;
  parameter id_7 = 1'b0;
  not primCall (id_1, id_4);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_4 = -1'd0;
  id_5 :
  assert property (@(posedge "") id_5)
  else $unsigned(18);
  ;
  module_0 modCall_1 ();
endmodule
