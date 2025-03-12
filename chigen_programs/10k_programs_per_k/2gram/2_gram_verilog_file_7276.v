// Seed: 971085589
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output uwire id_2,
    output supply0 id_3,
    input tri0 id_4,
    input wor id_5,
    output supply0 id_6
);
  wire [-1 : -1 'h0 +  (  -1  )] id_8;
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    input tri id_2,
    output tri0 id_3,
    input supply0 id_4,
    output supply0 id_5,
    output uwire id_6,
    output wire id_7,
    input tri1 id_8,
    input wire id_9
);
  always begin : LABEL_0
  end
  wire id_11 = id_9;
  wire [-1 'b0 : 1] id_12 = id_4;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_3,
      id_5,
      id_0,
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
  assign id_11 = id_12;
endmodule
