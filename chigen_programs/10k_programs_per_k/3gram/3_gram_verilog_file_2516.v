// Seed: 1437263617
module module_0 (
    output tri0 id_0
    , id_5,
    output wire id_1,
    output wire id_2,
    input supply0 id_3
);
  wire id_6 = id_6;
  wire id_7;
endmodule
module module_1 (
    output wand id_0,
    input tri1 id_1,
    input wor id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input wand id_6
);
  module_0(
      id_3, id_0, id_0, id_2
  );
endmodule
module module_2 (
    input supply1 id_0,
    output uwire id_1,
    output logic id_2,
    output wor id_3,
    output tri id_4,
    output tri0 id_5,
    input uwire id_6,
    output wor id_7,
    input tri1 id_8,
    output wire id_9,
    input supply1 id_10,
    output wor id_11,
    input wor id_12
    , id_14
);
  wire id_15, id_16;
  module_0(
      id_9, id_5, id_5, id_10
  );
  xor (id_5, id_10, id_8, id_0, id_14, id_12, id_16, id_6, id_15);
  always @(1'h0 or posedge id_14)
    if (~id_14) begin
      id_2 <= 1;
    end
endmodule
