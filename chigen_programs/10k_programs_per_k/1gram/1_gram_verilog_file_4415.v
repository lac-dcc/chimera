// Seed: 1538778211
module module_0 (
    input wand id_0,
    output uwire id_1,
    input supply1 id_2
);
  integer id_4 = id_2 * 1'd0;
  assign id_4 = id_4;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd6,
    parameter id_20 = 32'd34,
    parameter id_21 = 32'd3,
    parameter id_25 = 32'd25
) (
    input wand id_0[id_25  - "" : id_21],
    input uwire id_1,
    output supply1 id_2,
    output supply1 id_3,
    input uwire id_4,
    input tri id_5,
    input wor id_6,
    input tri id_7,
    output supply1 id_8,
    output supply1 id_9,
    input wor _id_10,
    input supply1 id_11,
    output tri0 id_12
    , id_27,
    input uwire id_13,
    output wire id_14,
    output tri0 id_15,
    output logic id_16,
    output tri1 id_17,
    input wire id_18,
    output supply0 id_19,
    input tri _id_20,
    input tri0 _id_21,
    input wand id_22,
    input wire id_23,
    output wire id_24,
    input tri0 _id_25
);
  parameter id_28 = 1;
  assign id_15 = 1;
  assign id_16 = 1;
  struct packed {
    logic id_29;
    logic id_30;
    struct packed {logic [1  -  id_10 : 1 'b0 ||  id_20  +  -1 'b0] id_31;} id_32;
  } id_33;
  ;
  always @(posedge id_33.id_30)
    if (id_28)
      if (id_28)
        if (id_28) id_33.id_32 = id_13;
        else id_16 <= 1 + id_28 + -1;
  module_0 modCall_1 (
      id_6,
      id_24,
      id_22
  );
  assign modCall_1.id_0 = 0;
endmodule
