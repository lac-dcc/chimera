// Seed: 2233665478
module module_0 (
    input wor id_0,
    output wire id_1,
    input wor id_2,
    input tri0 id_3
    , id_28 = 1,
    output supply1 id_4,
    input tri0 id_5,
    input wire id_6,
    input uwire id_7,
    input tri id_8,
    output supply0 id_9,
    output tri0 id_10,
    output supply1 id_11,
    input tri id_12,
    input tri1 id_13,
    output wand id_14,
    output tri0 id_15,
    input wor id_16,
    input supply1 id_17,
    input wire id_18,
    output supply1 id_19,
    output tri id_20,
    input tri1 id_21,
    input wire id_22,
    input wor id_23,
    input supply0 id_24,
    input supply0 id_25,
    input supply0 id_26
);
  wire [-1 : 1] id_29;
endmodule
module module_1 #(
    parameter id_10 = 32'd65,
    parameter id_19 = 32'd11,
    parameter id_3  = 32'd69,
    parameter id_5  = 32'd17
) (
    output logic id_0,
    output supply1 id_1,
    output logic id_2,
    input tri0 _id_3,
    output wor id_4,
    input wor _id_5[id_10 : 1 'b0]
    , id_15,
    output wire id_6,
    input tri1 id_7,
    output wand id_8,
    output uwire id_9,
    input tri0 _id_10,
    output supply0 id_11,
    output uwire id_12,
    input supply1 id_13
);
  wire [id_5 : -1 'b0 +  -1] id_16;
  assign id_12 = id_5;
  assign id_4  = id_13;
  assign id_15 = id_3;
  assign id_1  = -1;
  assign id_12 = id_3;
  always id_0 <= id_16;
  always begin : LABEL_0
    begin : LABEL_1
      id_11 -= 1;
    end
  end
  logic id_17[-1 : id_3];
  ;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_13,
      id_7,
      id_4,
      id_7,
      id_7,
      id_13,
      id_13,
      id_6,
      id_11,
      id_9,
      id_7,
      id_13,
      id_12,
      id_6,
      id_13,
      id_7,
      id_13,
      id_1,
      id_12,
      id_13,
      id_13,
      id_7,
      id_13,
      id_13,
      id_13
  );
  assign modCall_1.id_17 = 0;
  assign id_8 = id_16;
  struct packed {logic id_18;} [id_10 : -1] _id_19;
  ;
  assign id_19 = id_19.id_18[-1-id_19][-1 : ""];
  logic id_20;
  ;
  always id_2 <= -1;
  assign id_4  = -1;
  assign id_6  = 1;
  assign id_4  = -1;
  assign id_20 = id_17;
endmodule
