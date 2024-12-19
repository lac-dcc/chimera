// Seed: 1937801799
module module_0;
  wire id_1;
  tri0 id_2;
  assign id_2 = 1'd0;
endmodule : SymbolIdentifier
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8[1] = id_13;
  nor primCall (id_12, id_13, id_14, id_15, id_2, id_4, id_5, id_6, id_7, id_9);
  id_15(
      1, 1'b0
  );
  always @(posedge id_11 or id_14) begin : LABEL_0
    id_6 <= 1;
    id_12 = !id_4;
    #1 id_15 = ~|1;
  end
  module_0 modCall_1 ();
endmodule
