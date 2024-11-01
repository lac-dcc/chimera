// Seed: 3713133430
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  integer id_9;
  pmos (id_1, {1, id_8 + id_4 ^ 1, id_6, 1}, 1, id_4);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri id_4;
  always begin
    id_4 = id_1 !=? id_1;
    id_2 <= "";
  end
  assign id_3 = 1;
  uwire id_5;
  always_comb @(posedge 1'b0 or id_4) id_3 = id_4;
  assign id_5 = id_1;
  wire id_6;
  assign id_3 = 1;
  wire id_7;
  wire id_8;
  module_0(
      id_3, id_6, id_6, id_1, id_7, id_5, id_6, id_7
  );
endmodule
