// Seed: 3964883390
module module_0;
  wire id_1;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    output supply0 id_3,
    input supply0 id_4,
    output tri0 id_5,
    output uwire id_6,
    input tri0 id_7,
    input supply1 id_8,
    output wand id_9,
    output logic id_10,
    input wire id_11
);
  always @(posedge id_11 or negedge -1'h0) begin : LABEL_0
    id_10 = 1;
  end
  module_0 modCall_1 ();
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    input tri id_2,
    input wor id_3,
    input uwire id_4,
    input wire id_5,
    input tri id_6
);
  localparam id_8 = -1;
  logic [7:0] id_9, id_10, id_11, id_12, id_13, id_14, id_15, module_2, id_16, id_17, id_18;
  wire id_19;
  module_0 modCall_1 ();
  initial
    #1 begin : LABEL_0
      if (id_8 * id_8 + 1) $clog2(43);
      ;
    end
  wire id_20;
  or primCall (
      id_0,
      id_1,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_2,
      id_3,
      id_4,
      id_5,
      id_6,
      id_8,
      id_9
  );
  always force id_13 = -1;
  assign id_15[1] = -1;
  assign id_20 = id_18;
endmodule
