// Seed: 3878983430
module module_0 (
    input tri1 id_0
    , id_18,
    input tri id_1,
    input tri1 id_2,
    input tri0 id_3
    , id_19,
    output uwire id_4,
    output wire id_5,
    input wire id_6,
    input tri0 id_7,
    output supply1 id_8,
    input tri0 id_9,
    output supply0 id_10,
    output supply1 id_11,
    output wor id_12,
    output tri1 id_13,
    output tri0 id_14,
    input supply1 id_15,
    input wand id_16
);
  always begin
    if (1 == (id_16)) cover (1'h0);
  end
endmodule
module module_1 (
    input  wor   id_0,
    output logic id_1,
    input  tri   id_2,
    input  wire  id_3,
    output uwire id_4,
    output wand  id_5,
    output tri0  id_6,
    input  logic id_7,
    input  tri1  id_8
);
  always #1 begin
    id_1 <= id_7;
    $display(1 - 1);
    #1 @(negedge id_8 or posedge 1 & id_2 & 1'h0) @(posedge id_8) force id_1 = 1 - 1;
  end
  module_0(
      id_3,
      id_8,
      id_0,
      id_8,
      id_5,
      id_5,
      id_0,
      id_0,
      id_6,
      id_2,
      id_4,
      id_5,
      id_5,
      id_6,
      id_5,
      id_0,
      id_2
  );
endmodule
