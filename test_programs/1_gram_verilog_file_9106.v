// Seed: 2870179816
module module_0;
  wire id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    begin : LABEL_0
      id_4 <= 1 & 1;
    end
  end
  wire id_7;
  module_0 modCall_1 ();
endmodule
module module_2;
  wire id_2, id_3;
  wire id_4;
  assign module_3.id_0 = 0;
endmodule
module module_3 (
    output uwire id_0,
    input tri1 id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 id_5
);
  assign id_0 = id_5;
  or primCall (id_0, id_1, id_2, id_3, id_4, id_5);
  module_2 modCall_1 ();
endmodule
