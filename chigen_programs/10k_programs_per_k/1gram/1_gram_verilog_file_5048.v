// Seed: 1840301589
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  assign module_1._id_12 = 0;
  input wire id_2;
  input wire id_1;
  localparam id_5 = 1;
endmodule
module module_1 #(
    parameter id_1  = 32'd99,
    parameter id_12 = 32'd32,
    parameter id_13 = 32'd60,
    parameter id_4  = 32'd76
) (
    input tri1 id_0
    , id_26,
    input tri _id_1,
    output supply1 id_2,
    input uwire id_3,
    input tri0 _id_4,
    input wire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input wire id_8,
    input wand id_9,
    input tri id_10,
    input tri id_11,
    output wire _id_12,
    input tri _id_13
    , id_27,
    input tri0 id_14,
    output logic id_15,
    input wor id_16,
    input wire id_17,
    input wand id_18,
    input tri0 id_19[id_4 : id_13],
    input wand id_20,
    input tri0 id_21,
    output uwire id_22,
    output tri id_23,
    output wor id_24
);
  assign id_27 = (id_4);
  wire id_28;
  union packed {logic id_29;} id_30;
  initial id_15 = id_14;
  genvar id_31;
  logic   id_32;
  integer id_33;
  ;
  struct {
    logic id_34[id_12 : id_1];
    struct packed {
      logic id_35;
      logic id_36;
    } id_37;
    union packed {
      logic id_38;
      logic id_39;
      logic id_40;
      logic id_41;
      logic id_42;
    } id_43;
  }
      id_44, id_45;
  module_0 modCall_1 (
      id_45,
      id_31,
      id_31,
      id_45
  );
  assign id_32[1'b0][-1'd0 :-1] = id_14 !== 1;
endmodule
