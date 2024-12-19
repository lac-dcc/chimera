// Seed: 4281472636
module module_0 (
    output wand id_0,
    output tri1 id_1
);
  task id_3;
    begin : LABEL_0
      `define pp_4 0
      id_1 = 1;
    end
    id_1 = 1;
  endtask
  logic [7:0]
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
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
      id_20,
      id_21,
      id_22,
      id_23;
  assign module_1.type_8 = 0;
  wire id_24;
  assign id_20[1] = 1'd0;
  integer id_25;
  wire id_26;
  wire id_27;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output wand id_2
    , id_13,
    output tri0 id_3,
    input tri id_4,
    input wire id_5,
    output wand id_6,
    output tri0 id_7,
    input uwire id_8,
    output tri0 id_9,
    input wor id_10,
    output supply0 id_11
);
  wire id_14;
  id_15 :
  assert property (@(posedge 1) 1)
  else begin : LABEL_0
    id_7 = id_5;
  end
  final $display(id_1 & id_5);
  assign id_7 = id_1;
  assign id_2 = 1 + 1'b0;
  id_16(
      .id_0(id_3), .id_1(id_0), .id_2(id_0), .id_3(id_7), .id_4(id_8), .id_5(1'b0)
  );
  logic [7:0] id_17;
  always @(id_1 or posedge 1) begin : LABEL_0
    id_17[1] <= id_13;
    $display(id_5);
  end
  assign id_17[1] = id_0;
  tri1 id_18 = 1;
  module_0 modCall_1 (
      id_7,
      id_2
  );
  assign id_7 = 1;
  wire id_19;
  assign id_3 = "" !== 1;
endmodule
