// Seed: 2102417632
module module_0;
  logic [7:0] id_1, id_2;
  assign id_1[1'b0] = 1'd0;
  assign id_2[1] = 1;
  wire id_3;
  wire id_4;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    output logic id_2,
    input  wand  id_3,
    input  wor   id_4,
    input  logic id_5,
    output tri0  id_6
);
  initial begin : LABEL_0
    id_2 = 1;
    id_2 <= 1 && 1'd0 && id_0 && id_5 && id_3 && 1;
    id_1 <= 1'b0;
    id_6 = id_4 | id_0;
    #id_8;
    #1;
    id_2 = id_8;
    if (id_5 == 1) if (1) id_2 <= id_5;
  end
  module_0 modCall_1 ();
endmodule
