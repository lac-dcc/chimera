// Seed: 3510053556
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input uwire id_6,
    output wand id_7,
    output logic id_8
    , id_11,
    output uwire id_9
);
  always @(negedge id_11 or 1) begin
    id_8 = #id_12 1;
  end
endmodule
module module_1 (
    output wor   id_0,
    input  wor   id_1,
    output logic id_2
);
  reg id_4;
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_0, id_1, id_0, id_2, id_0
  );
  initial begin
    id_2 <= id_4;
    id_2 = 1;
    #1 id_4 <= id_4;
    fork
      id_5;
      id_6;
    join
  end
endmodule
