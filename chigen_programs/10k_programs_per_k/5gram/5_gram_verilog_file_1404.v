// Seed: 3548564068
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input supply1 id_2,
    input wor id_3,
    input supply1 id_4,
    output wand id_5
);
  wire id_7;
  reg  id_8;
  always_comb
    repeat ({
      id_4, 'b0
    })
      #1 begin
        id_8 <= 1;
        id_5 = 1;
      end
  wire id_9;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    input  wor   id_2,
    input  wor   id_3
);
  assign id_1 = 1;
  always @(posedge 1) begin
    wait (id_0 == id_3);
  end
  module_0(
      id_1, id_2, id_3, id_2, id_2, id_1
  );
  assign id_1 = id_2;
endmodule
