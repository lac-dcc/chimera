// Seed: 2840910802
module module_0 (
    id_1,
    .id_23(id_2),
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  inout wire id_22;
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  assign module_1.id_5 = 0;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire [1 : 1] id_24;
endmodule
module module_1 #(
    parameter id_0  = 32'd20,
    parameter id_15 = 32'd92,
    parameter id_6  = 32'd25
) (
    input wire _id_0,
    input supply1 id_1,
    input tri id_2,
    input tri1 id_3,
    input uwire id_4,
    output wire id_5,
    input tri0 _id_6
);
  bit id_8;
  ;
  initial begin : LABEL_0
    id_8 <= "";
  end
  wire id_9;
  wire [-1 : id_6  &&  id_0] id_10;
  integer id_11, id_12, id_13, id_14, _id_15, id_16, id_17, id_18, id_19;
  module_0 modCall_1 (
      id_17,
      id_11,
      id_16,
      id_11,
      id_10,
      id_19,
      id_12,
      id_13,
      id_16,
      id_17,
      id_13,
      id_10,
      id_9,
      id_11,
      id_10,
      id_12,
      id_13,
      id_19,
      id_14,
      id_13,
      id_19,
      id_14
  );
  wire [id_15 : 1] id_20;
  assign id_14 = $signed(57);
  ;
endmodule
