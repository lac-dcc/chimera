// Seed: 4058214990
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    input supply0 id_3,
    output uwire id_4
);
  assign id_2 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    output supply0 id_2,
    output wire id_3,
    output logic id_4
);
  initial begin : LABEL_0
    id_4 = #id_6 "";
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input tri0 id_0,
    input wor id_1
    , id_8,
    input tri id_2,
    input supply1 id_3,
    output uwire id_4,
    output wor id_5,
    input wand id_6
);
  bit id_9;
  ;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_5
  );
  assign modCall_1.id_0 = 0;
  assign id_4 = -1;
  parameter id_10 = 1;
  wire id_11 = ~id_8;
  always @("") begin : LABEL_0
    id_9 = id_0;
  end
endmodule
