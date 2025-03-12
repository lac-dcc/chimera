// Seed: 1482979865
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    output supply0 id_9,
    input uwire id_10
);
  assign id_9 = 1;
  always @(posedge -1 or id_4) begin : LABEL_0
    $signed(19);
    ;
    SystemTFIdentifier(1'h0, -1, id_6);
  end
  wire id_12;
  assign id_9 = id_8;
  wire id_13 = ~id_4;
  assign id_9 = -1;
  wire id_14;
  ;
  assign id_9 = (1 < id_12);
  wire id_15;
  ;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    output tri0 id_3
);
  wire id_5;
  ;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
