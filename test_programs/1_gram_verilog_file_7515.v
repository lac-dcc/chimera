// Seed: 1314707294
module module_0;
  parameter id_1 = -1;
  assign id_2 = id_1;
  always id_1 = id_1 * 1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = -1;
  nand primCall (id_1, id_3, id_5, id_6);
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  always begin : LABEL_0
    id_1 = -1'b0;
    begin : LABEL_0
      id_1 <= id_3 | id_3;
      begin : LABEL_0
        id_1 <= -1;
        id_2 <= id_6;
      end
    end
  end
endmodule
