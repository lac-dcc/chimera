// Seed: 710564581
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wor id_5,
    input uwire id_6,
    input wand id_7,
    input wor id_8
);
  wire id_10;
  assign id_10 = id_0;
endmodule
module module_1 #(
    parameter id_7 = 32'd72
) (
    input uwire id_0
    , id_17, id_18,
    input wor id_1,
    input wor id_2,
    output uwire id_3,
    input uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input tri _id_7,
    input tri id_8,
    input supply1 id_9,
    input wire id_10,
    input wire id_11,
    output tri1 id_12,
    output supply1 id_13,
    output uwire id_14,
    output tri id_15
);
  assign id_13 = id_11;
  wire [1 : -1] id_19;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_0,
      id_2,
      id_8,
      id_13,
      id_2,
      id_10,
      id_11
  );
  parameter id_20 = -1;
  wire id_21;
  localparam id_22 = 1'b0;
  wire id_23;
  logic [7:0] id_24, id_25, id_26, id_27;
  always @(posedge 1 or posedge id_23) id_17 <= (id_20);
  assign id_27[(id_7)] = -1;
endmodule
