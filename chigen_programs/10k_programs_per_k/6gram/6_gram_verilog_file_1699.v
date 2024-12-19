// Seed: 3094381977
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
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4 = 1;
  assign id_3 = $display(id_2);
  nand primCall (id_2, id_4, id_1);
  always @(posedge 1 or posedge !id_1) begin : LABEL_0
    id_3 = id_2;
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
