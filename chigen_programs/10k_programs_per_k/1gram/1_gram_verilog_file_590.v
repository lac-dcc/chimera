// Seed: 1651345823
module module_0 (
    output wire id_0,
    input supply1 id_1,
    input wor id_2,
    input wire id_3,
    input tri0 id_4,
    input tri id_5,
    input tri id_6,
    output tri0 id_7,
    input uwire id_8,
    input wire id_9,
    input tri id_10,
    input supply1 id_11
    , id_20,
    input uwire id_12,
    input tri id_13,
    input uwire id_14,
    output wand id_15,
    output wor id_16,
    input uwire id_17,
    input supply0 id_18
);
  assign id_20 = -1;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output logic id_2,
    output wor   id_3,
    output logic id_4
);
  assign id_4 = id_1;
  wire id_6;
  ;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_16 = 0;
  localparam id_7 = 1;
  final id_4 <= #(id_1) id_6;
  struct packed {
    logic   id_8   = 1;
    integer id_9;
    logic   id_10;
    logic   id_11;
    union packed {
      logic id_12;
      logic id_13;
      logic id_14;
      struct packed {logic id_15;} id_16;
    } id_17;
  } id_18;
  assign id_0 = id_18.id_10;
  assign id_18.id_14 = id_18.id_16;
  logic id_19[1 : -1];
  ;
  wire id_20;
  assign id_4 = -1;
  always begin : LABEL_0
    begin : LABEL_1
      id_18.id_12 <= 1'b0;
    end
    id_2 = -1;
  end
endmodule
