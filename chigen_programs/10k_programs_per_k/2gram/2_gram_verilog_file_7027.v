// Seed: 49279957
module module_0 (
    output supply1 id_0,
    output supply0 id_1
);
  assign id_0 = id_3;
  always begin : id_4
    id_1 = 1;
  end
  assign id_1 = id_3;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input wand id_3,
    input supply0 id_4,
    output wand id_5,
    output wor id_6,
    output wire id_7
);
  tri1 id_9;
  module_0(
      id_0, id_5
  );
  wire id_10;
  wire id_11;
  wire id_12 = id_10, id_13;
  assign id_7 = 1;
  assign id_9 = id_12;
  id_14 :
  assert property (@(id_9 or ~id_4) 1)
  else;
  wire id_15;
endmodule
