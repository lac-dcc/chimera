// Seed: 4062035221
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output wire id_2,
    output uwire id_3,
    input tri0 id_4,
    output tri0 id_5,
    output supply0 id_6,
    input supply0 id_7,
    input wor id_8,
    input supply0 id_9
);
  always begin : LABEL_0
    begin : LABEL_0
      id_5 = 1'b0;
    end
  end
  wire id_11;
  wire id_12;
  assign module_1.type_11 = 0;
  wire id_13;
  supply0 id_14 = id_0;
  wire id_15;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input tri id_2,
    output tri1 id_3,
    input wor id_4,
    output tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wand id_8
);
  wire id_10;
  assign id_3 = 1;
  assign id_3 = id_0;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_5,
      id_5,
      id_4,
      id_5,
      id_3,
      id_1,
      id_1,
      id_1
  );
endmodule
