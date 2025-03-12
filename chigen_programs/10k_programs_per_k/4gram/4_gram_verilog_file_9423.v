// Seed: 2296798792
module module_0 (
    output supply0 id_0,
    input  supply0 id_1,
    output uwire   module_0,
    input  supply1 id_3
);
  wire id_5 = id_1, id_6;
  module_2 modCall_1 (
      id_5,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output wand id_1,
    input supply1 id_2
);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_0
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  output tri1 id_2;
  output wire id_1;
  logic [7:0] id_3;
  assign id_3[-1] = id_3;
  assign id_2 = 1;
endmodule
module module_3 (
    input uwire id_0,
    input uwire id_1,
    input tri0 id_2
    , id_22,
    input wor id_3,
    input tri1 id_4,
    input tri0 id_5,
    input tri0 id_6
    , id_23,
    output supply1 id_7,
    input wor id_8,
    output logic id_9,
    input supply1 id_10,
    input supply1 id_11,
    output supply1 id_12,
    output tri1 id_13
    , id_24,
    input tri1 id_14,
    output tri1 id_15,
    output supply1 id_16,
    inout supply0 id_17,
    input supply1 id_18,
    output logic id_19,
    input supply0 id_20
);
  always
  fork
    `define pp_25 0
    `pp_25 <= -1;
    id_23 = 1;
    id_22 = id_20;
    id_19 = id_23;
    if (-1) begin : LABEL_0
      id_9 <= -1;
      if (1) begin : LABEL_1
        return 1;
      end
    end else begin : LABEL_2
      id_22 <= 1;
      deassign id_22;
      id_24 = id_1;
    end
  join : SymbolIdentifier
  wire id_26;
  assign id_12 = id_11;
  module_2 modCall_1 (
      id_26,
      id_26
  );
  logic [1 : -1] id_27 = 1;
  id_28 :
  assert property (@(posedge id_3) `pp_25)
  else $unsigned(62);
  ;
  assign id_12 = id_3;
endmodule
