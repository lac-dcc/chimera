// Seed: 2126851130
module module_0 (
    output wand id_0,
    output supply0 id_1
);
endmodule
module module_1 #(
    parameter id_3 = 32'd67,
    parameter id_6 = 32'd47
) (
    output tri id_0,
    input wand id_1,
    input uwire id_2,
    input supply1 _id_3,
    output uwire id_4,
    output wand id_5,
    input tri1 _id_6
);
  struct packed {
    logic [-1 : 1 'b0] id_8;
    logic id_9;
  } id_10;
  ;
  logic [id_6 : id_3] id_11;
  ;
  nor primCall (id_4, id_8, id_2);
  module_0 modCall_1 (
      id_0,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
