// Seed: 778065052
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    output wor id_2
);
  wire id_4;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input supply0 id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    output logic id_6
);
  supply1 id_8;
  always @(!id_2) begin
    id_6 <= "";
  end
  supply0 id_9;
  module_0(
      id_8, id_9, id_1
  );
  assign id_5 = {id_8{1'h0}};
  supply1 id_10 = id_0 == 1;
  initial begin
    cover ({id_8, id_9});
    deassign id_9;
  end
endmodule
