// Seed: 1726162646
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input wand id_2,
    input wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    input wand id_6,
    input wor id_7,
    input wor id_8,
    input tri id_9,
    input tri id_10,
    input wor id_11
);
  wand id_13;
  wire id_14;
  assign id_13 = 1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wire id_0,
    output wire id_1,
    output wand id_2,
    input supply0 id_3,
    input wand id_4,
    input logic id_5,
    output supply0 id_6,
    input wand id_7,
    output logic id_8,
    input supply0 id_9,
    input supply1 id_10,
    output logic id_11,
    input tri id_12,
    input logic id_13,
    input tri0 id_14,
    output tri0 id_15,
    input supply0 id_16,
    input uwire id_17,
    input tri1 id_18,
    input logic id_19,
    output tri id_20,
    output tri1 id_21
    , id_24,
    output supply1 id_22
);
  wire id_25;
  assign id_22 = 1 == id_13;
  initial begin : LABEL_0
    begin : LABEL_0
      id_8 <= id_5;
      disable id_26;
      id_11 <= id_13;
      id_8  <= id_19;
      $display({id_24{1}}, ~id_24);
      disable id_27;
    end
  end
  module_0 modCall_1 (
      id_18,
      id_0,
      id_10,
      id_14,
      id_2,
      id_4,
      id_16,
      id_14,
      id_10,
      id_7,
      id_17,
      id_7
  );
endmodule
