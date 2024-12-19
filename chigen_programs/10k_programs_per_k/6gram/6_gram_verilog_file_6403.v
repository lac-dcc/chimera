// Seed: 3823780627
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    output wor id_0,
    input tri id_1,
    input supply1 id_2,
    input tri id_3,
    input wand id_4,
    output wor id_5,
    input tri id_6,
    input tri0 id_7,
    output tri id_8,
    input wire id_9,
    input tri0 id_10,
    input supply1 id_11,
    output wand id_12,
    input uwire id_13
);
  supply0 id_15;
  assign id_5 = id_15;
  uwire id_16;
  always @(negedge id_9) begin : LABEL_0
    id_12 = id_13;
  end
  wire id_17;
  wire id_18;
  always @(posedge 1) begin : LABEL_0
    id_15 = id_4;
    wait (~(1 !== id_16));
    fork
      $display(1'b0);
    join
  end
  module_0 modCall_1 (
      id_16,
      id_17,
      id_18,
      id_18,
      id_16,
      id_17,
      id_18,
      id_18,
      id_17,
      id_18
  );
endmodule
