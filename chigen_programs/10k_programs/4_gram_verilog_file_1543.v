// Seed: 3882789753
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input supply0 id_2
);
  wire id_4;
  assign id_4 = 1;
  wire id_5;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1
);
  wire id_3;
  module_0(
      id_1, id_0, id_1
  ); id_4 :
  assert property (@(posedge id_1) 1)
  else $display(id_4 | id_1);
  wire id_5;
  buf (id_0, id_3);
endmodule
module module_2 (
    output tri id_0,
    input supply0 id_1,
    output tri0 id_2,
    output tri id_3
);
  generate
    id_5(
        .id_0(1), .id_1(id_2), .id_2({id_3, 1 + 1'b0}), .id_3(id_0), .id_4(id_1), .product(id_3)
    );
  endgenerate
  module_0(
      id_1, id_3, id_1
  );
endmodule
