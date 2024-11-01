// Seed: 2604720958
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input uwire id_2,
    input wand id_3,
    input wor id_4,
    input tri1 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input wire id_9,
    output tri1 id_10
);
  assign #id_12 id_0 = id_5;
  wire id_13;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    input wire id_2,
    input supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    input logic id_6,
    input uwire id_7,
    output supply0 id_8,
    input supply0 id_9,
    input supply1 id_10
);
  initial begin
    assert (1);
    id_0 <= {!id_1, id_6};
  end
  module_0(
      id_8, id_7, id_1, id_9, id_7, id_1, id_8, id_9, id_3, id_10, id_8
  );
endmodule
