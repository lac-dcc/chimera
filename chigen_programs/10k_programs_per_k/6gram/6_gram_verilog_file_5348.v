// Seed: 3065789667
module module_0 (
    input wand id_0,
    input wand id_1,
    output tri0 id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    output tri0 id_7
);
  import id_9::id_10;
  always #1 begin : LABEL_0
    id_2  = 1'b0;
    id_2  = {id_1{id_1}};
    id_10 = id_0;
  end
endmodule
module module_1 (
    output wire id_0,
    output tri  id_1,
    input  tri1 id_2,
    output tri1 id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
  wire id_5;
  not primCall (id_1, id_2);
endmodule
