// Seed: 1159411080
module module_0;
  genvar id_1;
  always @(negedge 1) begin : LABEL_0
    begin : LABEL_0
      id_1 <= 1;
    end
  end
  logic [7:0] id_2;
  wire id_3;
  wire id_4, id_5;
  wire id_6;
  assign module_3.type_1 = 0;
  assign id_2[1] = 1;
endmodule
module module_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 ();
endmodule
module module_3 (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wand id_4
    , id_6
);
  wire id_7;
  module_0 modCall_1 ();
endmodule
