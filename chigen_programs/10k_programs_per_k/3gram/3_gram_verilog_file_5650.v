// Seed: 1806332139
module module_0 (
    output uwire id_0,
    input wand id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    input tri id_6,
    input supply0 id_7,
    input tri0 id_8
    , id_13,
    input supply0 id_9,
    input wor id_10,
    input tri0 id_11
);
  assign id_2 = id_10;
  wire id_14;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri   id_1,
    output wand  id_2,
    output logic id_3,
    input  logic id_4,
    input  tri0  id_5,
    input  wand  id_6
);
  generate
    wand id_8;
  endgenerate
  assign id_8 = 1;
  always @(posedge id_1);
  always @(negedge 1) begin
    id_3 <= id_6 - 1;
  end
  assign id_3 = id_4;
  module_0(
      id_2, id_5, id_2, id_0, id_6, id_6, id_5, id_6, id_6, id_0, id_0, id_5
  );
  always #1 assign id_8 = 1;
  buf (id_2, id_1);
endmodule
