// Seed: 1048705484
module module_0 (
    input wor  id_0,
    input tri1 id_1
);
  localparam id_3 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd33,
    parameter id_5 = 32'd65,
    parameter id_7 = 32'd70
) (
    output wand id_0,
    input tri id_1,
    output tri0 id_2,
    output wire id_3,
    input tri _id_4,
    output supply0 _id_5,
    input wor id_6,
    input tri _id_7,
    input tri0 id_8,
    input tri id_9,
    input tri0 id_10
);
  wire [1 : id_4] id_12;
  wire id_13[1 : id_5];
  assign id_12 = id_4 ? id_13 : id_8;
  parameter id_14 = -1;
  id_15 :
  assert property (@(posedge id_1 or posedge id_1 * id_10 or negedge id_10) id_8) id_15 <= id_8;
  module_0 modCall_1 (
      id_10,
      id_10
  );
  struct packed {
    logic id_16;
    logic [-1 : -1] id_17;
    struct packed {
      logic id_18  = id_14;
      logic id_19;
    } id_20;
    logic id_21;
    struct packed {
      id_22 [id_7 : 1] id_23[-1 'b0 : -1];
      logic id_24;
      logic id_25;
    } id_26;
  } id_27[1 : -1];
endmodule : SymbolIdentifier
