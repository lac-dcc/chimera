// Seed: 1666509086
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input supply0 id_2,
    input uwire id_3,
    output wire id_4,
    input wire id_5,
    output supply0 module_0,
    output supply1 id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10,
    input tri1 id_11,
    output uwire id_12,
    input tri1 id_13,
    input wire id_14,
    input tri0 id_15,
    input uwire id_16,
    output tri id_17,
    output tri0 id_18
);
  assign id_7 = 1;
  wor  id_20;
  wire id_21;
  initial id_20 = 1'b0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input wor id_2,
    input wire id_3,
    output wire id_4
);
  reg id_6;
  module_0(
      id_2,
      id_0,
      id_2,
      id_3,
      id_1,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0,
      id_4,
      id_1
  );
  always @(1'b0) begin
    id_6 <= 1'b0 & 1 & 1;
  end
  bufif1 (id_1, id_3, id_0);
endmodule
