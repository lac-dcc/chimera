// Seed: 3933311350
module module_0;
  reg id_2;
  initial
    #1 begin : LABEL_0
      id_2 <= id_1;
      fork
        id_3(1, id_3);
      join
      wait (id_1);
      force id_1 = 1;
      id_3 <= 1'b0;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5, id_6, id_7;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_8;
  assign id_3 = 1;
endmodule
module module_2 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wor id_4
    , id_8,
    input wor id_5,
    input supply0 id_6
);
endmodule
module module_3 (
    input supply1 id_0,
    input supply0 id_1,
    input wire id_2,
    input tri0 id_3,
    input wor id_4
);
  wire id_6;
  wire id_7;
  wire id_8;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
