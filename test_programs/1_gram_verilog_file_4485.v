// Seed: 3696546561
module module_0;
  assign id_1 = 1;
  uwire id_2 = -1;
  module_2 modCall_1 (
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_4 = 0;
  assign id_1 = 1;
  assign id_1 = -1;
  tri id_3 = -1'b0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    output tri1 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri id_5,
    output supply0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    output wire id_10
);
  nor primCall (id_10, id_4, id_5, id_7, id_8, id_9);
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always_comb
  fork
    begin : LABEL_0
      id_3 = !id_4;
    end
  join
endmodule
