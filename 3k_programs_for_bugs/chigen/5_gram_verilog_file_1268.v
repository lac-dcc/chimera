// Seed: 1551706127
module module_0 #(
    parameter id_15 = 32'd26,
    parameter id_16 = 32'd66
) (
    input supply0 id_0,
    input wor id_1,
    output supply0 id_2,
    output tri1 id_3,
    input wor id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    input wor id_8,
    output wire id_9,
    output tri0 id_10,
    input wand id_11,
    output wor id_12
);
  tri0 id_14;
  assign id_14 = 1;
  assign id_3  = 1'h0;
  defparam id_15.id_16 = &id_5;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    input supply0 id_2
);
  assign id_0 = id_2;
  always @(negedge id_2, posedge id_0++
  > id_1)
  begin
    id_0 = id_2;
  end
  module_0(
      id_2, id_1, id_0, id_0, id_2, id_1, id_2, id_2, id_2, id_0, id_0, id_2, id_0
  );
endmodule
