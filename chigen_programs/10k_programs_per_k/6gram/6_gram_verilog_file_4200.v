// Seed: 1673174867
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output wand id_2,
    input wor id_3,
    output tri0 id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    output tri id_9
);
endmodule
module module_1 (
    input  wor  id_0,
    output tri0 id_1,
    input  wire id_2,
    input  wire id_3,
    output wire id_4
);
  assign id_4 = 1;
  xor (id_4, id_2, id_0, id_3);
  module_0(
      id_3, id_4, id_4, id_3, id_4, id_3, id_1, id_0, id_1, id_4
  );
  always @(posedge 1) begin
    wait (id_0);
  end
endmodule
