// Seed: 2376714029
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output supply1 id_2
    , id_14,
    input tri0 id_3,
    output supply1 id_4,
    input tri id_5,
    output supply0 id_6
    , id_15,
    output supply0 id_7,
    output uwire id_8,
    output supply1 module_0,
    input supply1 id_10,
    input supply1 id_11,
    output tri1 id_12
);
  always @(id_3) begin : LABEL_0
    cover (1 & id_15);
    #1 begin : LABEL_1
      wait (1'b0);
    end
    id_14 <= 1;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd39
) (
    output supply0 id_0,
    input supply1 id_1,
    output wire id_2,
    output supply1 _id_3,
    input supply0 id_4,
    input tri1 id_5
);
  wire id_7[id_3 : id_3];
  ;
  wor id_8 = id_5 == id_5;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_4,
      id_2,
      id_4,
      id_0,
      id_0,
      id_2,
      id_2,
      id_4,
      id_5,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
