// Seed: 849840410
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_3
  );
  inout wire id_2;
  inout wire id_1;
  wire [(  -1 'b0 ) : 1] id_5;
endmodule
module module_2 (
    input tri id_0,
    output tri id_1,
    input supply1 id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    output uwire id_6,
    output supply0 id_7,
    output tri1 id_8,
    output tri0 id_9,
    input supply1 id_10
);
  logic id_12;
  id_13 :
  assert property (@(-1) id_5)
  else;
endmodule
module module_3 #(
    parameter id_12 = 32'd82
) (
    input tri0 id_0,
    input supply0 id_1,
    output logic id_2,
    input tri1 id_3,
    input tri id_4,
    output wire id_5,
    input uwire id_6
);
  assign id_5 = 1;
  module_2 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_0,
      id_3,
      id_0,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3
  );
  assign modCall_1.id_6 = 0;
  assign id_2 = 1;
  assign id_2 = 1;
  initial begin : LABEL_0
    id_2 <= -1;
  end
  logic [7:0] id_8, id_9, id_10, id_11, _id_12, id_13, id_14, id_15;
  assign id_15 = id_12;
endmodule
