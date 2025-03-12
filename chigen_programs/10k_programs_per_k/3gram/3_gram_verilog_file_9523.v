// Seed: 4263271202
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  assign module_1.id_8 = 0;
  output wire id_1;
  integer [1 : 1] id_10;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd33
) (
    output tri0  id_0,
    output logic id_1,
    output wand  _id_2,
    input  tri1  id_3
);
  wire id_5;
  assign id_5 = id_3;
  always @(posedge -1 or posedge id_3) if (1) id_1 = -1 + id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  always @(posedge 1) assume (-1);
  logic [{  -1  {  -1  }  } : id_2] id_6, id_7, id_8;
  id_9 :
  assert property (@(posedge id_3) id_6)
  else begin : LABEL_0
    id_7 <= -1;
  end
endmodule
