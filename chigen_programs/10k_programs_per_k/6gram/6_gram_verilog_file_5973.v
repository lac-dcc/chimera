// Seed: 3741464655
module module_0 (
    output uwire id_0,
    output supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output supply0 id_6,
    input supply1 id_7,
    input supply0 id_8
);
  logic [7:0] id_10;
  assign id_10[1 : 1'b0] = 1;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output logic id_8,
    output wand id_9
);
  always @(posedge id_2 or posedge id_1) begin
    id_8 <= 1 + id_2;
  end
  nand (id_8, id_0, id_6, id_5, id_4);
  module_0(
      id_7, id_3, id_5, id_9, id_5, id_6, id_7, id_1, id_2
  );
endmodule
