// Seed: 199014139
program module_0 (
    input tri0 id_0,
    input wire id_1
    , id_10,
    output wire id_2,
    output wire id_3,
    output wire id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input wand id_8
);
  id_11(
      .id_0(1), .id_1(1), .id_2(id_4), .id_3(id_8)
  );
endprogram
module module_1 (
    input wire id_0,
    output tri0 id_1,
    input uwire id_2,
    output uwire id_3,
    output logic id_4,
    output supply0 id_5,
    input tri1 id_6,
    output uwire id_7,
    output wand id_8,
    input logic id_9,
    input supply1 id_10,
    input tri0 id_11,
    output uwire id_12
);
  id_14(
      .id_0(1), .id_1(id_6), .id_2(1), .id_3(1'b0), .id_4(1)
  );
  always @(posedge 1 or posedge 1) begin
    id_4 <= id_9;
  end
  xor (id_4, id_11, id_9, id_10, id_6, id_0, id_2, id_14);
  module_0(
      id_6, id_10, id_12, id_7, id_5, id_11, id_6, id_10, id_11
  );
endmodule
