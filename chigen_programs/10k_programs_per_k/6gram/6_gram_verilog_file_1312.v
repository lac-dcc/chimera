// Seed: 2081958584
module module_0 (
    input uwire id_0,
    input wor id_1,
    input uwire id_2,
    output uwire id_3,
    output tri id_4,
    input supply1 id_5,
    output tri id_6
);
  assign id_3 = id_5 ? id_0 : ~id_0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    output supply0 id_2,
    input wand id_3,
    input uwire id_4,
    output supply0 id_5,
    output wire id_6,
    input wor id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri1 id_10
);
  assign id_0 = id_3 & "" ? id_4 - id_1 : 1;
  uwire id_12;
  module_0(
      id_10, id_4, id_8, id_5, id_6, id_7, id_5
  );
  always @(*) begin
    id_6 = ~id_12;
  end
endmodule
