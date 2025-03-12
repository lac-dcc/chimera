// Seed: 3118523745
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri0 id_3
);
  assign id_2 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wand id_2,
    input tri id_3,
    input wire id_4,
    input tri1 id_5,
    input wire id_6,
    input tri0 id_7,
    output wand id_8,
    input supply0 id_9,
    input wire id_10,
    output tri1 id_11,
    input tri0 id_12
    , id_27,
    input supply1 id_13,
    output logic id_14,
    input tri1 id_15,
    input tri id_16
    , id_28,
    input uwire id_17 id_29,
    input supply0 id_18,
    output supply0 id_19,
    input wor id_20,
    input wor id_21,
    output uwire id_22,
    output logic id_23,
    output tri1 id_24,
    input tri id_25
);
  reg id_30;
  ;
  nand primCall (
      id_14,
      id_17,
      id_12,
      id_33,
      id_10,
      id_20,
      id_15,
      id_32,
      id_9,
      id_30,
      id_3,
      id_1,
      id_5,
      id_4,
      id_31,
      id_29,
      id_25,
      id_7,
      id_2,
      id_34,
      id_27,
      id_13,
      id_18,
      id_6,
      id_28,
      id_0,
      id_16
  );
  wire id_31;
  ;
  always @(posedge 1) begin : LABEL_0
    if (1) id_30 = id_3 == id_13;
    id_23 <= id_15;
  end
  always @(id_4 or posedge -1) begin : LABEL_1
    begin : LABEL_2
      #1;
      id_27 <= -1;
      fork
        wait (id_6);
        begin : LABEL_3
          #1;
          id_14 <= id_7;
          $unsigned(48);
          ;
        end
      join
    end
  end
  parameter id_32 = 1;
  parameter id_33 = -1 == id_32;
  wire id_34;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_29,
      id_21
  );
  assign modCall_1.id_3 = 0;
endmodule
