// Seed: 415678301
module module_0 (
    input  uwire id_0,
    output tri   id_1,
    input  uwire id_2
);
  tri1 id_4;
  ;
  assign id_4 = id_0 - $signed(92);
  ;
  wire id_5;
  assign id_1 = id_4 - 'h0 & -1;
  logic id_6;
  ;
  parameter id_7 = -1;
  assign module_1.id_1 = 0;
  logic [1 : -1] id_8 = id_2;
endmodule
module module_1 #(
    parameter id_4 = 32'd39
) (
    input tri1 id_0,
    input tri0 id_1,
    output wire id_2,
    output tri1 id_3,
    input tri0 _id_4,
    output supply0 id_5,
    input tri1 id_6,
    output tri0 id_7
);
  wire [1 'b0 : id_4] id_9;
  xnor primCall (id_5, id_0, id_1, id_9);
  module_0 modCall_1 (
      id_1,
      id_7,
      id_6
  );
endmodule
