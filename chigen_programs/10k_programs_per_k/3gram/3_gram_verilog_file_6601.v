// Seed: 1558996798
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wand id_2,
    output supply1 id_3
);
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input wor id_2,
    input tri id_3
);
  always @(id_2 or posedge 1) begin
    id_0 = 1'b0 == id_3 ? 1 : 1;
  end
  module_0(
      id_2, id_2, id_3, id_0
  );
endmodule
module module_2 (
    input wand id_0,
    input wire id_1,
    output supply0 id_2
);
  wire id_4;
  module_0(
      id_1, id_0, id_0, id_2
  );
endmodule
