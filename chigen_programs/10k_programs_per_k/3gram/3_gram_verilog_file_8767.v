// Seed: 1932740809
module module_0 (
    input tri id_0,
    input wor id_1,
    output tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    output tri id_8,
    output wand id_9,
    output supply1 id_10
);
  wand id_12 = id_4;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri0 id_1
);
  module_0(
      id_1, id_1, id_0, id_0, id_1, id_0, id_1, id_1, id_0, id_0, id_0
  );
endmodule
module module_2 (
    input tri1 id_0,
    output logic id_1,
    input tri1 id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    input tri1 id_6,
    output supply1 id_7,
    input supply1 id_8
);
  wire id_10, id_11, id_12, id_13;
  module_0(
      id_0, id_4, id_7, id_7, id_8, id_7, id_6, id_8, id_7, id_7, id_7
  ); id_14 :
  assert property (@(posedge id_14) id_5)
  else begin
    id_1 <= 1;
  end
endmodule
