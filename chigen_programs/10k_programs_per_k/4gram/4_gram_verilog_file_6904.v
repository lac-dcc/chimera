// Seed: 228694517
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output wand id_2,
    input tri1 id_3,
    output supply0 id_4
);
  always_latch @(id_1) begin
    id_2 = 1;
  end
  wire id_6;
  wire id_7;
  assign id_4 = id_1 - 1;
  logic [7:0] id_8;
  wire id_9;
  assign id_8[1] = id_0;
  supply1 id_10 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    output wor id_2,
    output wand id_3,
    output uwire id_4,
    input tri0 id_5,
    inout supply1 id_6,
    input wand id_7
);
  assign {id_5, id_0} = id_5 == id_7;
  module_0(
      id_7, id_5, id_4, id_0, id_6
  );
endmodule
