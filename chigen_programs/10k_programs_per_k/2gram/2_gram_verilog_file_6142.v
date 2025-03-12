// Seed: 4084926111
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output tri id_2,
    output tri1 id_3
    , id_6,
    input wor id_4
);
  assign id_2 = id_0 - (id_4);
  assign id_3 = -1;
endmodule
module module_1 (
    output tri id_0
    , id_5, id_6,
    output supply1 id_1,
    input uwire id_2,
    input tri0 id_3
);
  string id_7 = "";
  assign id_0 = id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
  not primCall (id_1, id_5);
endmodule
module module_2 #(
    parameter id_0 = 32'd38,
    parameter id_1 = 32'd25
) (
    input wire _id_0,
    input tri _id_1,
    input supply1 id_2
    , id_5,
    output uwire id_3
);
  logic [-1 : id_0] id_6 = id_5[""+1&-1 : id_1], id_7;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
