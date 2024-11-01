// Seed: 3115842686
module module_0 (
    input wor id_0,
    output uwire id_1,
    output wor id_2,
    input tri id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    output wand id_7
);
  wire  id_9;
  uwire id_10 = {1{1, 1}};
  wire  id_11;
endmodule
module module_1 (
    input uwire id_0,
    output uwire id_1,
    input supply0 id_2,
    output logic id_3,
    input tri id_4,
    output tri id_5,
    input supply1 id_6,
    output uwire id_7
);
  wor id_9 = 1;
  module_0(
      id_0, id_1, id_1, id_0, id_4, id_4, id_6, id_1
  );
  assign id_1 = id_4;
  id_10 :
  assert property (@(posedge 1) 1'b0) id_3 <= 1;
  wire id_11, id_12;
  wire id_13;
  wire id_14;
endmodule
