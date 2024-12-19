// Seed: 1336683567
module module_0 (
    input tri id_0
    , id_7,
    output supply0 id_1,
    output supply0 id_2
    , id_8,
    input supply1 id_3,
    input tri0 id_4,
    input supply0 id_5
);
  assign id_8 = 1 - id_7;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input uwire id_2,
    input uwire id_3
    , id_8,
    input wor id_4,
    input uwire id_5,
    output wor id_6
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_3,
      id_4
  );
  assign id_8 = 1;
  always @(posedge 1'b0 or posedge id_3) begin : LABEL_0
    if ($display) for (id_6 = 1 && 1; id_3; id_6 = 1) id_8 <= #id_4  ~id_5;
  end
  xor primCall (id_6, id_1, id_3, id_5, id_8, id_2, id_0);
endmodule
