// Seed: 320116113
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    inout uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    output uwire id_8,
    output wor id_9
);
  assign id_4 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    output tri1 id_2,
    output supply0 id_3,
    output uwire id_4,
    input wand id_5,
    input tri1 id_6
);
  tri1 id_8;
  module_0(
      id_8, id_5, id_5, id_0, id_8, id_6, id_5, id_6, id_3, id_3
  );
  assign id_1 = 1'b0;
  always @(posedge id_8, posedge id_5) begin
    id_1 <= 1;
  end
endmodule
