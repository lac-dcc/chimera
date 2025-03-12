// Seed: 3510491940
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
  output wire id_10;
  inout wire id_9;
  inout supply0 id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_13 = 0;
  assign id_8 = id_7 ? 1 : id_9;
  wire id_11;
endmodule
module module_1 (
    output wire id_0,
    output supply1 id_1,
    input uwire id_2,
    input tri0 id_3,
    output tri1 id_4,
    input wire id_5,
    output supply0 id_6,
    output logic id_7
    , id_19,
    input wand id_8,
    input tri0 id_9,
    output supply1 id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13
    , id_20,
    output logic id_14,
    output tri id_15,
    input supply1 id_16,
    input tri id_17
);
  always begin : LABEL_0
    if (1) id_14 <= id_2;
    else begin : LABEL_1
      id_7 = #1 id_13;
    end
  end
  module_0 modCall_1 (
      id_20,
      id_20,
      id_20,
      id_20,
      id_19,
      id_20,
      id_19,
      id_20,
      id_20,
      id_20
  );
endmodule
