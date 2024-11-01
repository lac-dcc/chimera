// Seed: 1222281924
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input tri id_2,
    input wor id_3,
    output supply1 id_4,
    input tri1 id_5,
    input tri1 id_6,
    output uwire id_7
);
  wire id_9;
  id_10(
      .id_0(id_2)
  );
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    output tri1 id_2,
    output tri1 id_3
);
  assign id_0 = 1;
  module_0(
      id_2, id_1, id_1, id_1, id_2, id_1, id_1, id_3
  );
endmodule
module module_2 (
    output tri0 id_0,
    input  wor  id_1
);
  assign id_0 = 1;
  wand id_3 = 1;
  id_4 :
  assert property (@(posedge 1'b0) 1 == id_1)
  else $display(id_1, 1);
  module_0(
      id_0, id_1, id_1, id_1, id_0, id_1, id_1, id_0
  );
endmodule
