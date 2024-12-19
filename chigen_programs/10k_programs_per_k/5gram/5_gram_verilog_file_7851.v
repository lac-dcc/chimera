// Seed: 328433694
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    input tri0 id_3
    , id_21,
    input tri0 id_4,
    input tri0 id_5
    , id_22,
    input uwire id_6,
    input wand id_7,
    input tri1 id_8,
    input wire id_9,
    input supply0 id_10,
    output tri0 id_11,
    input supply1 id_12,
    output uwire id_13,
    input wand id_14,
    output tri1 id_15,
    input wor id_16,
    input tri id_17,
    input tri0 id_18,
    output tri id_19
);
  logic [7:0] id_23;
  assign id_23[""] = id_7 ? id_0 : id_16;
  wire id_24;
  assign id_21[1'b0] = 1;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output tri0  id_2
);
  wand id_4;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4,
      id_4,
      id_0,
      id_2,
      id_4,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_10 = 0;
  assign id_1 = id_1++;
  reg id_5;
  always @(negedge id_4) begin : LABEL_0
    id_1 <= 1;
    if (1) begin : LABEL_0
      if (1'b0) id_5 <= 1;
    end else begin : LABEL_0
      id_5 <= (id_5 != 1);
      $display(id_0);
    end
  end
  wire id_6;
  wire id_7;
  assign id_5 = 1;
  supply0 id_8 = 1;
  import id_9::*;
  wire id_10;
endmodule
