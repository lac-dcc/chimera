// Seed: 727087312
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
    id_21
);
  inout tri0 id_21;
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_21 = (id_19 ? id_16 : -1) == -1;
endmodule
module module_1 #(
    parameter id_16 = 32'd57,
    parameter id_2  = 32'd14
) (
    input wire id_0,
    input tri id_1,
    input tri0 _id_2,
    input tri1 id_3,
    output logic id_4,
    input tri1 id_5,
    input wire id_6,
    output wand id_7,
    inout wand id_8,
    input wand id_9,
    output supply0 id_10,
    input supply1 id_11,
    input wand id_12,
    output wand id_13,
    output tri id_14,
    input tri id_15,
    input tri0 _id_16,
    output wand id_17,
    output supply1 id_18,
    input tri id_19,
    input wire id_20,
    output wor id_21,
    output wire id_22
);
  wire [1 : ~  (  !  id_16  )  ~^  id_2] id_24;
  initial begin : LABEL_0
    deassign id_24;
    if ("" !== 1 == !1) begin : LABEL_1
      id_4 <= 1;
    end
  end
  module_0 modCall_1 (
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24
  );
endmodule
