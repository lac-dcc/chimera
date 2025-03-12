// Seed: 1988663544
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
    id_22,
    id_23,
    id_24
);
  output wire id_24;
  input wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  assign module_1._id_3 = 0;
  output wire id_1;
  wire id_25;
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd24,
    parameter id_10 = 32'd14,
    parameter id_15 = 32'd87,
    parameter id_3  = 32'd56,
    parameter id_5  = 32'd43,
    parameter id_6  = 32'd91,
    parameter id_7  = 32'd27
) (
    input wire _id_0,
    output logic id_1,
    input wand id_2,
    input supply0 _id_3,
    input tri0 id_4,
    input uwire _id_5
    , id_13,
    input tri _id_6,
    input supply1 _id_7,
    input tri0 id_8,
    input tri1 id_9
    , id_14,
    input wand _id_10,
    output supply0 id_11
);
  logic [1 'b0 : id_3] _id_15;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_14,
      id_13,
      id_14,
      id_14,
      id_14,
      id_13,
      id_14,
      id_14,
      id_14,
      id_13,
      id_14,
      id_14,
      id_13,
      id_13,
      id_14,
      id_14,
      id_14,
      id_14,
      id_13,
      id_14,
      id_14,
      id_14
  );
  generate
    assign id_14 = -1 < id_3;
    for (id_16 = id_7; 1 - -1; id_1 = 1 * id_14 - -1) begin : LABEL_0
      logic [id_0 : id_15  #  (
          .  id_10(  id_5  !=  1  ),
          .  id_7 (  id_6  ),
          .  id_0 (  -1  )
)] id_17;
      ;
    end
  endgenerate
endmodule
