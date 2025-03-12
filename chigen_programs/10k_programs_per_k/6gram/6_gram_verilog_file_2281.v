// Seed: 3643789631
module module_0 (
    output tri0 id_0,
    output wand id_1,
    input wor id_2,
    output tri id_3,
    output uwire id_4,
    input supply0 id_5,
    input wire id_6,
    output wand id_7,
    output uwire id_8,
    input wire id_9
    , id_13,
    output supply0 id_10,
    input wire id_11
);
  wire id_14;
  assign id_1 = id_2;
  wire  id_15;
  logic id_16;
  ;
  assign id_1 = id_6;
  initial begin : LABEL_0
    $signed(69);
    ;
    SystemTFIdentifier;
  end
  wire id_17;
  assign id_3 = $realtime;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output uwire id_1,
    input tri id_2,
    inout supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output logic id_6
);
  always @(posedge -1'b0) begin : LABEL_0
    id_6 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_3,
      id_3,
      id_5,
      id_1,
      id_0,
      id_5,
      id_3,
      id_2
  );
endmodule
