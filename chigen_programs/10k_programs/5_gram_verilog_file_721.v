// Seed: 1703603687
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input supply0 id_2,
    input wire id_3,
    input wire id_4,
    input wire id_5,
    input supply1 id_6,
    input tri id_7
);
  wire id_9;
  id_10(
      1, 1, 1'd0, 1
  );
  wire id_11;
endmodule
module module_1 (
    output tri0 id_0,
    output tri id_1,
    output tri id_2,
    output supply1 id_3,
    input tri id_4,
    input wire id_5,
    input uwire id_6,
    input wor id_7
);
  tri id_9;
  module_0(
      id_4, id_1, id_4, id_7, id_5, id_5, id_6, id_6
  ); id_10 :
  assert property (@(posedge id_10) id_6)
  else $display(id_9, 1 & (1), id_9 != id_4);
endmodule
