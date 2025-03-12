// Seed: 3136797360
module module_0 #(
    parameter id_1 = 32'd22
) ();
  wire _id_1;
  ;
  supply1 id_2;
  logic [id_1 : id_1] id_3;
  assign id_2 = 1;
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 ();
  wire id_6;
endmodule
module module_3 #(
    parameter id_1 = 32'd0
) ();
  parameter id_1 = 1'd0;
  module_0 modCall_1 ();
  reg [id_1 : -1 'b0] id_2;
  wire id_3;
  id_4 :
  assert property (@(posedge id_2) -1)
  else begin : LABEL_0
    id_2 <= id_3;
  end
endmodule
