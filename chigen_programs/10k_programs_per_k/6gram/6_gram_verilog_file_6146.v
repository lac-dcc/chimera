// Seed: 3934879032
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input wor id_3,
    input wand id_4,
    input supply0 id_5,
    output wor id_6
);
  always @(id_5 or posedge id_3) begin : LABEL_0
    begin : LABEL_0
      #1;
      if (id_4) id_6 = 1;
    end
  end
  wire id_8;
  assign module_0 = 1'h0;
endmodule
module module_1 (
    output tri1 id_0,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wand id_4,
    output tri1 id_5
    , id_8,
    output supply0 id_6
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_6
  );
  assign modCall_1.type_12 = 0;
endmodule
