// Seed: 167630186
module module_0 #(
    parameter id_3 = 32'd7,
    parameter id_4 = 32'd74
) ();
  uwire id_1;
  wand  id_2 = id_1;
  defparam id_3.id_4 = 1;
  assign id_1 = id_4;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    output logic id_0
);
  uwire id_2;
  always #1 @(id_2 or posedge id_2);
  always begin : LABEL_0
    id_0 <= 1'b0;
  end
  wire  id_3;
  uwire id_4 = id_4 - id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
endmodule
module module_2 ();
  assign id_1 = 1;
  wire id_3 = id_2;
  wire id_4;
  wire id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
endmodule
