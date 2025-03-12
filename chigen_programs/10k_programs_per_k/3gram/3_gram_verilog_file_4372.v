// Seed: 853535244
module module_0 #(
    parameter id_4 = 32'd23
) (
    output tri   id_0,
    output uwire id_1
);
  logic id_3 = id_3;
  wire [1 : 1] _id_4;
  wire id_5;
  assign id_0 = id_3;
  wire [(  id_4  &  -1  &  1 'd0 ) : 1] id_6;
  assign id_6 = id_5;
  assign id_6 = (id_3);
  assign module_1.id_4 = 0;
  assign id_1 = -1;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    output tri1 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wire id_5
);
  assign id_2 = 1;
  nor primCall (id_0, id_5, id_4, id_3);
  module_0 modCall_1 (
      id_2,
      id_0
  );
endmodule
