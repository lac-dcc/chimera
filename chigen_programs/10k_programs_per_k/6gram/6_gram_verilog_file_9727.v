// Seed: 3189692490
module module_0;
  wire id_1;
  wire id_2;
  assign module_2.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  nor primCall (id_1, id_2, id_3);
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 ();
  inout wire id_1;
  wire id_5;
  wire [id_4 : ""] id_6;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  module_0 modCall_1 ();
  input wire id_1;
  integer id_5 = -1;
  always @(posedge -1 or posedge 1'b0 != -1) begin : LABEL_0
    {id_5, -1, id_5} <= -1;
  end
  logic id_6;
  assign id_6 = -1 ? 1 : id_3;
endmodule
