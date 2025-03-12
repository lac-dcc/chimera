// Seed: 2865112751
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input wand id_2,
    output supply1 id_3
);
  wire id_5;
  ;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    output logic id_2,
    input wire id_3,
    output wire id_4,
    input tri0 id_5,
    output supply0 id_6,
    input tri0 id_7,
    input wor id_8,
    input tri0 id_9,
    input supply1 id_10,
    output logic id_11,
    input wor id_12,
    input supply1 id_13,
    input wand id_14,
    output tri1 id_15,
    output wand id_16,
    input uwire id_17,
    input tri0 id_18
);
  assign id_4 = id_8;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_12,
      id_4
  );
  wire id_20 = {id_7};
  initial begin : LABEL_0
    id_2 = -1;
    begin : LABEL_1
      id_11 <= -1'b0;
      wait (id_0 == id_10);
      id_2 = id_14;
    end
  end
endmodule
