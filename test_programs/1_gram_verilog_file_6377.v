// Seed: 1597833857
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    output supply0 id_2,
    output tri id_3,
    output tri0 id_4,
    input wand id_5,
    input wor id_6,
    output tri id_7,
    output tri0 id_8
);
  assign id_2 = ((id_5));
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input logic id_0,
    input tri id_1,
    input uwire id_2,
    input wor id_3,
    input supply1 id_4,
    output tri id_5,
    output logic id_6,
    output tri0 id_7,
    input wand id_8
);
  id_10 :
  assert property (@(posedge id_2) 1 <= id_10) id_6 <= id_0;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_7,
      id_5,
      id_5,
      id_2,
      id_1,
      id_10,
      id_10
  );
endmodule
