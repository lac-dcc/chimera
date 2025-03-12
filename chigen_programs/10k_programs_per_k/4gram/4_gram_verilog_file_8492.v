// Seed: 3181374840
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output wor id_2,
    output wire id_3,
    input supply0 id_4
);
  assign id_1 = -1;
  assign id_2 = id_0;
  parameter id_6 = 1;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri id_3,
    output tri id_4
);
  always id_0 = #id_6 id_1;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.id_3 = 0;
  assign id_0 = id_6;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_5;
  logic id_6 = id_2;
  logic id_7;
  wire [-1 'b0 : (  -1 'b0 )] id_8;
  id_9 :
  assert property (@(negedge id_7[-1]) id_1)
  else $unsigned(1);
  ;
endmodule
module module_3 #(
    parameter id_3 = 32'd26
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wand id_4;
  module_2 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  parameter id_6 = (-1);
  logic [7:0] id_7 = id_3;
  assign id_4 = id_4 - id_7[id_3 : id_3];
  always disable id_8;
  localparam id_9 = 1;
  wire id_10;
endmodule
