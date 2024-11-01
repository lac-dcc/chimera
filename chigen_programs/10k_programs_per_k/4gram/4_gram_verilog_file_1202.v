// Seed: 4138621219
module module_0 (
    input uwire id_0,
    input tri id_1,
    output wor id_2,
    input supply0 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input tri1 id_7
);
endmodule
module module_1 (
    output uwire id_0,
    output supply1 id_1,
    input supply0 id_2,
    output uwire id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input logic id_8,
    output logic id_9,
    input supply1 id_10
);
  always @(id_10) begin
    if (1 - id_10) begin
      if (id_6) id_4 = 1;
    end else id_9 <= id_8;
  end
  assign id_0 = 1'b0;
  module_0(
      id_2, id_7, id_1, id_7, id_4, id_2, id_10, id_6
  );
endmodule
