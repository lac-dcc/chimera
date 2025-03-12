// Seed: 1788243176
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  assign module_1._id_16 = 0;
  output wire id_2;
  inout wire id_1;
  wire id_11;
  specify
    specparam id_12 = 1;
  endspecify
endmodule
module module_1 #(
    parameter id_1  = 32'd90,
    parameter id_11 = 32'd99,
    parameter id_13 = 32'd72,
    parameter id_15 = 32'd25,
    parameter id_16 = 32'd44
) (
    input uwire id_0,
    input tri0 _id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    output supply0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    input uwire id_8,
    output wire id_9,
    input supply1 id_10,
    output tri1 _id_11,
    input tri1 id_12,
    input wand _id_13,
    output tri0 id_14,
    output tri0 _id_15,
    input tri0 _id_16,
    input wor id_17
);
  struct packed {
    logic [id_16 : id_16  ==  1 'h0 &  1  &  -1  ==  1] id_19;
    struct packed {
      logic [-1 'b0 : -1] id_20;
      id_21 id_22;
    } [1  ==  id_13 : id_1] id_23;
  } [id_11 : id_15] id_24;
  module_0 modCall_1 (
      id_24,
      id_23,
      id_21,
      id_22,
      id_22,
      id_24,
      id_22,
      id_21,
      id_24,
      id_24
  );
  wire id_25;
  wire id_26;
  assign id_24.id_21 = {id_0{id_1}} ? id_24.id_22 == id_24.id_23 : id_8 - 1 ? id_24.id_23 : 1;
endmodule
