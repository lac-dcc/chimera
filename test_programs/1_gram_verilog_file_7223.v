// Seed: 3668274131
module module_0;
  parameter id_1 = id_1;
  assign module_2.id_0 = 0;
  assign id_2 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    output uwire id_2,
    input tri id_3,
    input tri id_4,
    output supply1 id_5,
    input wire id_6,
    inout uwire id_7,
    input wor id_8,
    input wor id_9,
    output uwire id_10,
    id_12
);
  xor primCall (id_0, id_1, id_12, id_3, id_4, id_6, id_7, id_8, id_9);
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_4 = 32'd20
) (
    input  logic id_0,
    output logic id_1
);
  always begin : LABEL_0
    @(posedge -1 or id_0 or posedge 1) id_1 <= id_0;
    id_1 <= -1;
  end
  module_0 modCall_1 ();
  wire id_3;
  assign id_1 = -1'b0;
  defparam id_4 = -1;
endmodule
