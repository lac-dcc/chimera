// Seed: 3527777982
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri id_3,
    output uwire id_4,
    input supply0 id_5,
    output supply1 id_6,
    input tri id_7,
    output wand id_8
);
  integer id_10 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd18
) (
    input  tri0 _id_0,
    input  wand id_1,
    output tri  id_2
);
  localparam id_4 = -1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
  localparam id_5 = id_4[id_0 :-1];
  logic id_6;
  logic id_7;
  always @(-1) id_7 = ({1, id_6 * -1 + id_5});
endmodule
