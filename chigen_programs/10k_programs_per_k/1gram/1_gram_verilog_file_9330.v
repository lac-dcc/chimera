// Seed: 2922308262
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    input wor id_5,
    output wire id_6,
    input tri0 id_7,
    output tri0 id_8
    , id_12,
    output tri id_9,
    input uwire id_10
);
  wire id_13;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    input wor id_2,
    input uwire id_3,
    output logic id_4,
    output supply1 id_5,
    input logic id_6,
    input tri1 id_7
);
  reg id_9 = 1, id_10;
  initial
    for (id_1 = id_6; 1; id_0 = 1) begin : LABEL_0
      @(posedge 1) fork id_4 <= id_6; join_any
      id_5 = 1;
      $display((id_6));
      id_1 <= id_9;
      id_9 = id_10;
      begin : LABEL_0
        id_4 <= 1'h0 !=? 1;
      end
    end
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_2,
      id_3,
      id_7,
      id_5,
      id_3,
      id_5,
      id_5,
      id_7
  );
  assign modCall_1.id_5 = 0;
  always #1 id_5 = -id_10;
  assign id_0 = id_6;
  wire id_11;
  wire id_12;
endmodule
