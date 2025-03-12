// Seed: 3120964677
module module_0 (
    input tri  id_0,
    input tri1 id_1
);
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    output uwire id_2,
    output logic id_3,
    output tri0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output uwire id_10,
    input supply1 id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_5
  );
  initial begin : LABEL_0
    id_3 <= id_11 !=? 1;
  end
  initial assert (id_5 == -1);
endmodule
