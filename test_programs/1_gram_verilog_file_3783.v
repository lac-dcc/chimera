// Seed: 175277426
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    input wand id_2,
    input uwire id_3,
    input supply0 id_4
);
  wire \id_6 ;
  assign module_1.type_35 = 0;
  localparam id_7 = "";
  assign id_0 = 1'd0;
  tri id_8;
  id_9(
      .id_0(-1'd0 / $realtime),
      .id_1(-1),
      .id_2(1),
      .id_3(1'h0),
      .id_4(id_1 & id_8),
      .id_5(""),
      .id_6(-1),
      .id_7(id_4),
      .id_8(-1'b0),
      .id_9(1),
      .id_10(id_4),
      .id_11(id_2),
      .sum(id_4),
      .id_12(),
      .id_13(id_2),
      .id_14(id_8 == -1),
      .id_15(-1)
  );
endmodule
module module_1 (
    input logic id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    output wand id_8,
    input wor id_9,
    output logic id_10,
    input wor id_11,
    input wor id_12,
    input tri1 id_13,
    output logic id_14,
    input wire id_15,
    input uwire id_16,
    output supply0 id_17,
    output tri id_18,
    input wor id_19,
    input logic id_20,
    input wire id_21,
    output wor id_22,
    output wand id_23,
    output supply1 id_24,
    output tri0 id_25,
    output tri0 id_26,
    input wire id_27,
    output uwire id_28
);
  always #(-1) id_18 = id_13;
  function id_30;
    input id_31;
    begin : LABEL_0
      #1;
      fork
        begin : LABEL_0
          @(negedge -1'h0) id_14 <= 1;
        end
        if (-1) id_10.id_0 <= id_20;
      join
    end
  endfunction
  module_0 modCall_1 (
      id_8,
      id_1,
      id_5,
      id_11,
      id_13
  );
endmodule
