// Seed: 2869499910
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wire id_3,
    input tri1 id_4,
    output wire id_5,
    input wand id_6,
    output tri1 id_7,
    input supply0 id_8,
    input uwire id_9,
    input wire id_10,
    input tri1 id_11,
    output wand id_12,
    input tri id_13
);
  wand id_15;
  wire id_16;
  wire id_17;
  always @(*)
    repeat (id_6)
      if (id_13 & 1)
        if (1'b0 && 1 && 1) begin
          id_15 = 1;
          id_5  = id_4;
        end
endmodule
module module_1 (
    input  supply0 id_0,
    input  uwire   id_1,
    output uwire   id_2
);
  assign id_2 = id_1;
  module_0(
      id_0, id_1, id_1, id_0, id_1, id_2, id_1, id_2, id_1, id_1, id_1, id_0, id_2, id_0
  ); id_4(
      .id_0(~id_1), .id_1(1)
  );
endmodule
