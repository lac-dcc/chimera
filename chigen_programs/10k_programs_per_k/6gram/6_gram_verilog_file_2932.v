// Seed: 2179906730
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input wand id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply1 id_7,
    output supply1 id_8,
    output wand id_9,
    input wire id_10
    , id_13,
    input wand id_11
);
  assign id_7 = 1;
endmodule
module module_1 (
    input  tri1  id_0,
    output wand  id_1,
    output uwire id_2,
    input  tri1  id_3,
    input  wor   id_4,
    input  wor   id_5,
    input  tri   id_6,
    input  tri1  id_7
);
  always @(posedge id_5 or posedge id_6) begin
    if ({id_7{id_3}}) begin
      if (id_3 == id_7) begin
        id_2 = id_5;
      end else #1;
    end else disable id_9;
  end
  module_0(
      id_7, id_5, id_5, id_0, id_1, id_4, id_5, id_2, id_2, id_1, id_0, id_7
  );
endmodule
