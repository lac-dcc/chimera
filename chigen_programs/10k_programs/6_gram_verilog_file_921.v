// Seed: 1708463699
module module_0 (
    output uwire   id_0,
    input  supply1 id_1,
    output supply0 id_2
);
  assign id_0 = 1;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri0  id_1,
    output tri0  id_2,
    output logic id_3,
    output wand  id_4
);
  initial begin
    id_3 <= ~(id_1);
    id_4 = 1'b0;
  end
  module_0(
      id_4, id_0, id_4
  );
endmodule
module module_2 (
    output uwire id_0,
    input tri1 id_1,
    input tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    inout uwire id_5,
    input wand id_6,
    output tri1 id_7,
    input supply1 id_8,
    input supply0 id_9
);
  assign id_5 = id_8 ? 1 : 1;
  module_0(
      id_7, id_6, id_5
  );
endmodule
