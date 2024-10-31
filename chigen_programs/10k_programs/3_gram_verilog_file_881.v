// Seed: 3298091801
module module_0 (
    output wor id_0,
    output wor id_1
);
  assign id_0 = id_3 !== 1'b0;
  integer id_4 = 1 == 1;
endmodule
module module_1 (
    output wand id_0
);
  module_0(
      id_0, id_0
  );
  assign id_0 = 1;
  wire id_3, id_4;
endmodule
module module_2 (
    output tri   id_0
    , id_4,
    input  logic id_1,
    output logic id_2
);
  always @(negedge id_1 or posedge 1)
    if (id_1) id_2 <= id_1;
    else
      fork
        assign id_4 = 1;
        id_0 = id_4;
      join
  module_0(
      id_4, id_0
  );
endmodule
