// Seed: 1028939933
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wor id_2,
    input wor id_3,
    output wor id_4,
    output supply0 id_5,
    output tri id_6,
    output tri0 id_7,
    output supply1 id_8
);
endmodule
module module_1 (
    inout supply0 id_0,
    input wor id_1,
    input wand id_2,
    output wand id_3,
    output wor id_4,
    input tri id_5,
    output uwire id_6
);
  wire id_8;
  module_0(
      id_2, id_5, id_5, id_0, id_6, id_4, id_6, id_6, id_3
  );
  always @(posedge id_2 or posedge !id_0) begin
    deassign id_4#(.id_8(1 == id_1));
  end
endmodule
