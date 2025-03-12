// Seed: 6386900
module module_0 #(
    parameter id_4 = 32'd39
) (
    input wor id_0
);
  wire id_2;
  localparam id_3 = 1 + 1;
  parameter id_4 = 1;
  parameter id_5[id_4 : 1 'b0] = id_4 | id_3 + 1;
  wire id_6;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input wire id_2,
    input uwire id_3,
    output supply1 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    output logic id_8
);
  nand primCall (id_0, id_3, id_2);
  wire id_10;
  module_0 modCall_1 (id_6);
  assign modCall_1.id_0 = 0;
  initial begin : LABEL_0
    @(posedge 1'b0) id_8 <= 1;
    id_0 = id_6;
  end
endmodule
