// Seed: 2448102540
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign {id_7} = -1'b0;
  wire id_9, id_10;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  assign id_2 = 1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3
  );
endmodule
module module_2 (
    input  wor   id_0,
    output logic id_1,
    input  wand  id_2,
    input  tri   id_3
);
  always begin : LABEL_0
    id_1 <= -1;
  end
  assign id_1 = 1'd0 - id_0;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_7 = 0;
endmodule
