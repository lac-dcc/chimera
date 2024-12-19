// Seed: 902431075
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_3;
  wire id_4;
  tri  id_5 = 1'd0;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
  always id_3 = id_2;
  wire id_6;
endmodule
module module_2 (
    input wor id_0,
    input wor id_1,
    input wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    output wor id_5,
    input tri0 id_6,
    input uwire id_7,
    input uwire id_8,
    input supply1 id_9
);
  assign module_3.id_7 = 0;
endmodule
module module_3 (
    output wire id_0,
    output wire id_1,
    input tri0 id_2,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    input wor id_6,
    output tri0 id_7,
    output supply0 id_8
);
  always @(1'd0 or posedge 1)
    #1
      #id_10 begin : LABEL_0
        cover (id_4);
      end
  module_2 modCall_1 (
      id_10,
      id_5,
      id_4,
      id_6,
      id_4,
      id_0,
      id_6,
      id_10,
      id_10,
      id_2
  );
endmodule
