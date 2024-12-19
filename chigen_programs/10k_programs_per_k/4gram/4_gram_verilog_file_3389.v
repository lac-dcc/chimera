// Seed: 2521567527
module module_0;
  reg id_2 = 1;
  always_latch @(negedge 1, id_2) begin : LABEL_0
    id_2 <= 1;
  end
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    output wire id_2,
    output wor id_3,
    input supply1 id_4,
    output supply1 id_5,
    output supply1 id_6,
    input uwire id_7,
    output logic id_8
);
  wire id_10;
  wire id_11;
  module_0 modCall_1 ();
  assign modCall_1.type_3 = 0;
  always_latch @((id_4) or posedge 1) id_8 <= id_7 - 1;
  assign id_2 = id_1;
endmodule
