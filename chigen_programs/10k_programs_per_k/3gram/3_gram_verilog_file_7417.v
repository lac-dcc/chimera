// Seed: 2374332777
module module_0 (
    output wire id_0,
    output wand id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    input tri0 id_7,
    input tri id_8,
    output supply1 id_9,
    input supply0 id_10,
    input tri0 id_11,
    output supply0 id_12
);
endmodule
module module_1 (
    output supply1 id_0,
    output wire id_1,
    output logic id_2,
    input logic id_3,
    output logic id_4,
    output tri1 id_5,
    output logic id_6,
    input tri1 id_7
);
  always @* begin
    id_4 <= id_3 == id_7;
    id_4 <= id_7 ? 1'h0 : id_3;
    id_6 <= {id_7 - 1'b0{1}};
    id_4 = 1'h0;
  end
  assign id_4 = 1;
  initial begin
    id_2 <= 1'd0 && 1'h0;
  end
  module_0(
      id_1, id_5, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_0, id_7, id_7, id_5
  );
endmodule
