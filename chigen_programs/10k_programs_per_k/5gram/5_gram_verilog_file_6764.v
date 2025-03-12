// Seed: 1897212400
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_2
  );
  logic id_6;
  id_7 :
  assert property (@(posedge id_6) id_2)
  else $unsigned(25);
  ;
endmodule
module module_2 (
    output logic id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  tri   id_3
);
  always @(id_1) id_0 <= 1;
  assign module_3.id_4 = 0;
endmodule
module module_3 #(
    parameter id_7 = 32'd5
) (
    input tri0 id_0,
    input wire id_1,
    output supply0 id_2,
    output tri id_3,
    input tri1 id_4,
    input uwire id_5,
    output logic id_6,
    input wor _id_7,
    output wand id_8,
    output tri0 id_9
);
  wire [id_7 : id_7] id_11;
  final begin : LABEL_0
    id_6 = #id_12 1 + 1;
  end
  module_2 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1
  );
endmodule
