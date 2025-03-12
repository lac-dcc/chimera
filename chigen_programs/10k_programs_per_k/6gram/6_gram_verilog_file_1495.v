// Seed: 3738772945
module module_0 (
    output wor id_0,
    output supply0 id_1,
    output tri0 id_2,
    output tri0 id_3,
    input uwire id_4,
    input supply0 id_5,
    output tri1 id_6
);
  logic id_8;
  ;
  assign id_0 = {1'h0, 1};
  assign id_3 = 1'b0;
  assign module_1.id_2 = 0;
  wire id_9;
  ;
endmodule
module module_1 #(
    parameter id_5 = 32'd81
) (
    output wor  id_0,
    input  wand id_1,
    inout  tri  id_2,
    output tri  id_3,
    input  wor  id_4,
    input  wand _id_5
);
  wire [id_5 : 1] id_7;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3
  );
  logic id_8 = id_1;
endmodule
