// Seed: 1010350450
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output tri1 id_2,
    input wire id_3,
    input wand id_4,
    output tri1 id_5,
    output tri0 id_6
);
  assign id_5 = 1 || id_0 + id_3;
  parameter id_8 = 1;
  initial begin : LABEL_0
    deassign id_2;
  end
  wire id_9;
  assign id_6 = id_0 > id_3;
endmodule
module module_1 #(
    parameter id_4 = 32'd39
) (
    output wor id_0,
    output tri0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri0 _id_4,
    input uwire id_5,
    input tri1 id_6,
    output supply0 id_7
);
  logic [-1 : id_4] id_9, id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_5,
      id_1,
      id_7
  );
  wire id_11;
  wire id_12;
  assign id_1  = id_3 ? (('d0 || id_6 && "")) : id_9;
  assign id_11 = 1 & id_9;
  always @(posedge id_5 == id_6) begin : LABEL_0
    deassign id_7;
  end
  bit id_13;
  always @(negedge -1) begin : LABEL_1
    $unsigned(63);
    ;
  end
  always @(posedge 1 or negedge -1) begin : LABEL_2
    id_13 <= -1'b0;
  end
endmodule
