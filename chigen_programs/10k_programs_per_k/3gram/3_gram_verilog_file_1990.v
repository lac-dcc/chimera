// Seed: 2247412450
module module_0 (
    output wor  id_0,
    output wand id_1
);
  timeunit 1ps;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4,
    output tri id_5,
    input wand id_6
);
  assign id_5 = 1;
  module_0(
      id_5, id_5
  );
  assign id_5 = id_3;
  assign id_5 = id_6;
endmodule
module module_2 (
    output supply1 id_0,
    input supply1 id_1,
    output wor id_2,
    input wor id_3,
    input tri id_4,
    input uwire id_5
);
  supply0 id_7;
  always @(id_7 * id_4 or posedge 1 + id_1) begin
    id_2 = id_4;
  end
  module_0(
      id_0, id_2
  );
endmodule
