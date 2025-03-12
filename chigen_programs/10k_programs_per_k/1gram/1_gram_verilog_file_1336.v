// Seed: 1114711569
module module_0 (
    input  wire id_0,
    input  wire id_1,
    output tri1 id_2,
    input  wire id_3
);
  wire id_5 = id_1;
  uwire id_6, id_7, id_8;
  assign id_6 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    input tri0 id_2
    , id_18,
    output logic id_3,
    input supply0 id_4,
    output logic id_5,
    input wor id_6,
    output supply0 id_7,
    output wire id_8,
    output wire id_9,
    input uwire id_10,
    output supply0 id_11,
    input wand id_12,
    output tri0 id_13,
    input wor id_14,
    input tri id_15
    , id_19,
    output tri id_16
    , id_20
);
  union {logic id_21;} id_22;
  ;
  module_0 modCall_1 (
      id_14,
      id_10,
      id_8,
      id_2
  );
  assign modCall_1.id_6 = 0;
  always begin : LABEL_0
    begin : LABEL_1
      id_5 = id_20;
    end
    id_3 <= (1);
    $clog2(29);
    ;
    begin : LABEL_2
      logic id_23;
      SystemTFIdentifier(id_10);
      id_18 <= 1;
    end
    @(-1'b0) id_1 = id_0;
    logic id_24;
  end
  assign id_3 = id_22.id_21;
endmodule
