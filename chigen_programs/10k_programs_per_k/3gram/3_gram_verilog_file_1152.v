// Seed: 2332897850
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    output wire id_4,
    input wand id_5,
    input wire id_6,
    output tri0 id_7,
    output wire id_8,
    input wor id_9,
    input supply1 id_10,
    input wor id_11,
    input tri1 id_12,
    input tri1 id_13,
    output supply0 id_14,
    output tri1 id_15,
    output wor id_16,
    output supply0 id_17,
    input wand id_18
);
  wire id_20, id_21;
  assign id_1 = 1;
endmodule
module module_1 (
    input  supply0 id_0,
    input  supply1 id_1,
    input  logic   id_2,
    output supply0 id_3
);
  reg id_5 = 1'b0;
  always @(posedge 1) begin
    id_5 <= id_2;
  end
  module_0(
      id_0,
      id_3,
      id_0,
      id_0,
      id_3,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0
  );
endmodule
