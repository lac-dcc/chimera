// Seed: 2354190375
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output wor id_2,
    input tri id_3,
    input tri0 id_4,
    output wor id_5,
    input supply0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    output supply0 id_9
);
  assign id_1 = 1;
endmodule
module module_1 (
    output wand  id_0,
    input  tri1  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    output logic id_4
);
  tri0 id_6 = id_1;
  module_0(
      id_2, id_0, id_0, id_1, id_2, id_0, id_3, id_6, id_6, id_6
  );
  initial begin
    id_4 <= 1;
    for (id_6 = id_2; 1; id_0 = 1) #1;
    wait (1'b0);
  end
  initial
  fork : id_7
  join : id_8
  assign id_4 = 1'b0;
endmodule
