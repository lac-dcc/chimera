// Seed: 1982677924
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output wire id_2,
    output tri id_3,
    input tri id_4,
    input wire id_5,
    input tri0 id_6,
    input wire id_7,
    input wor id_8,
    input wor id_9,
    output supply0 id_10,
    output supply0 id_11
);
  wire id_13;
  assign id_2 = -1;
  parameter id_14 = "";
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_0  = 32'd49,
    parameter id_10 = 32'd89,
    parameter id_15 = 32'd67,
    parameter id_16 = 32'd88,
    parameter id_4  = 32'd92
) (
    input tri1 _id_0,
    output tri0 id_1,
    input wor id_2,
    input wor id_3,
    output tri _id_4,
    output supply1 id_5,
    output tri0 id_6,
    output uwire id_7,
    output wire id_8,
    output tri1 id_9,
    input wire _id_10,
    output wire id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri1 id_14,
    input wor _id_15,
    input tri1 _id_16,
    output tri0 id_17
    , id_20,
    output uwire id_18
);
  struct packed {
    logic [id_10 : id_0] id_21;
    logic [id_15 : 1 'b0 &  id_16] id_22;
  } [1 : id_4] id_23;
  ;
  wire id_24;
  module_0 modCall_1 (
      id_3,
      id_17,
      id_6,
      id_5,
      id_3,
      id_12,
      id_3,
      id_13,
      id_2,
      id_12,
      id_18,
      id_17
  );
  assign modCall_1.id_9 = 0;
endmodule
