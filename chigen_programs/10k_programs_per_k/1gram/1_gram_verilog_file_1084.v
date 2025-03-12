// Seed: 2353561642
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  logic id_3;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd79,
    parameter id_23 = 32'd21
) (
    input tri id_0,
    input tri1 id_1,
    output logic id_2,
    input tri id_3,
    input supply1 id_4[1 : id_10],
    output wand id_5,
    input tri0 id_6,
    output uwire id_7,
    output logic id_8,
    input wor id_9,
    input tri1 _id_10
    , id_22,
    output tri id_11,
    input uwire id_12,
    input supply0 id_13,
    input wire id_14,
    input wire id_15,
    input supply1 id_16,
    output supply0 id_17,
    output logic id_18,
    input supply1 id_19,
    output supply1 id_20
);
  wire _id_23;
  ;
  assign id_5 = id_13;
  wire [id_23 : 1 'h0] id_24, id_25;
  logic id_26;
  ;
  always begin : LABEL_0
    if (-1) id_2 <= 1 == 1;
    else id_18 = (id_19 ? !-1 : 1);
    begin : LABEL_1
      id_8 <= id_6 | 1;
    end
  end
  nor primCall (
      id_20,
      id_13,
      id_6,
      id_16,
      id_26,
      id_3,
      id_0,
      id_22,
      id_12,
      id_24,
      id_1,
      id_14,
      id_15,
      id_9,
      id_25
  );
  module_0 modCall_1 (
      id_25,
      id_26
  );
endmodule
