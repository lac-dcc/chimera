// Seed: 1027906558
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input tri1 id_2,
    output tri1 id_3,
    input tri id_4,
    output uwire id_5
);
  wire id_7, id_8;
endmodule
module module_1 #(
    parameter id_2 = 32'd40
) (
    output uwire id_0,
    output tri   id_1,
    input  wand  _id_2,
    input  wire  id_3 [id_2 : -1],
    output uwire id_4
);
  assign id_1 = id_2;
  always_latch #(id_3) @(posedge id_3 or id_2 or 1);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
