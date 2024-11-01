// Seed: 1764885723
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = 1;
  wire id_3 = id_3;
endmodule
module module_1;
  wire id_1;
  module_0(
      id_1, id_1
  );
endmodule
module module_2 (
    output tri1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    output supply0 id_3,
    output wand id_4,
    output tri id_5
    , id_16#(
        .id_17(1)
    ),
    input tri1 id_6,
    output logic id_7,
    output wire id_8,
    output uwire id_9,
    input wor id_10,
    input logic id_11,
    input wire id_12,
    output wand id_13,
    input uwire id_14
);
  wire id_18;
  module_0(
      id_16, id_17
  );
  assign id_8 = id_18 == id_17;
  assign id_2 = 1 & 1;
  assign id_8 = id_10;
  always_comb @(posedge id_11 or 1 * id_16) begin
    if (id_12)
      fork
        id_5 = id_10;
        id_7 <= id_11;
      join
    else id_9 = 1;
    #1;
  end
endmodule
