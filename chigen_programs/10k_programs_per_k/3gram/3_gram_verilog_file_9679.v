// Seed: 859361841
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input uwire id_2,
    input wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    input wand id_6
);
  wire id_8;
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    input wand id_2,
    output uwire id_3,
    output uwire id_4
);
  logic id_6 = id_2, id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_0 = 32'd9
) (
    input supply0 _id_0,
    output tri id_1,
    output uwire id_2,
    input uwire id_3,
    output wire id_4,
    input tri id_5,
    input tri1 id_6,
    input uwire id_7
);
  wire [-1 'b0 : 1] id_9;
  xnor primCall (id_1, id_3, id_9, id_10);
  logic id_10;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_3,
      id_4,
      id_3,
      id_6
  );
  assign modCall_1.id_2 = 0;
  wire [id_0 : 1] id_11;
endmodule
