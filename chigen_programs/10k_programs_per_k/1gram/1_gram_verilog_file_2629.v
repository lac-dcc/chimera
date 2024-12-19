// Seed: 3666986464
module module_0;
  assign id_1 = 1'b0;
  assign module_1.id_1 = 0;
  final begin : LABEL_0
    begin : LABEL_0
      #1 begin : LABEL_0
      end
    end
  end
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  always_latch id_1 = new[1 === id_0] (1);
  assign id_1 = id_0;
  tri1 id_3 = 1 ? {1} : 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
