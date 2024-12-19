// Seed: 2021940062
module module_0 (
    input  tri id_0,
    output wor id_1
);
  always
  fork
    id_3;
    begin : LABEL_0
      if (1 == id_0) id_3 = 1;
    end
  join
  reg id_4;
  always @(*) begin : LABEL_0
    wait (1);
  end
  always @(posedge 1 or posedge id_4) begin : LABEL_0
    id_3 <= 1'b0;
    id_1 = 1;
    id_3 = id_3;
    id_4 = 1;
  end
endmodule
module module_1 (
    output tri id_0,
    output tri0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wor id_5
);
  wire id_7;
  or primCall (id_5, id_2, id_4, id_3, id_7);
  module_0 modCall_1 (
      id_3,
      id_5
  );
  assign modCall_1.type_1 = 0;
  wire id_8;
  wire id_9;
endmodule
