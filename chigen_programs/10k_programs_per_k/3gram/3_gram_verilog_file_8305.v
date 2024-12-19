// Seed: 3433666947
module module_0 ();
  initial begin : LABEL_0
    id_1 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2;
  id_2(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_1)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_3 (
    input  tri   id_0,
    output logic id_1,
    output tri1  id_2,
    input  wand  id_3,
    output tri0  id_4
);
  assign id_2 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always @(*) id_1 <= id_3 != id_0;
endmodule
