// Seed: 1997653806
module module_0 (
    input  supply1 id_0,
    input  uwire   id_1,
    input  logic   id_2,
    output logic   id_3
);
  wire id_5;
  always @(posedge 1 or posedge id_0)
    if (1) assign id_5 = id_2 == !id_2;
    else id_3 <= id_2;
  uwire id_6 = 1, id_7;
endmodule
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input uwire id_2,
    input supply0 id_3,
    output tri1 id_4,
    output wor id_5,
    output wire id_6,
    input logic id_7,
    input tri module_1,
    output supply1 id_9,
    input wand id_10,
    output logic id_11,
    input wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    input tri1 id_15
);
  wire id_17;
  module_0(
      id_15, id_10, id_7, id_11
  );
  wire id_18;
  initial begin
    id_11 = #id_19 id_7;
    fork
      id_20(1'h0 == (id_7 == id_10));
      begin
        id_20 = 1;
      end
    join
  end
endmodule
