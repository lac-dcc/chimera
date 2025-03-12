// Seed: 2062665718
module module_0 (
    output uwire id_0,
    input uwire module_0,
    output wire id_2,
    output uwire id_3,
    input supply1 id_4
);
  assign id_0 = -1'b0;
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    output tri id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    inout supply0 id_4
);
  task id_6;
    begin : LABEL_0
      disable id_7;
    end
  endtask
  module_0 modCall_1 (
      id_1,
      id_4,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_7 = 32'd36,
    parameter id_8 = 32'd35
) (
    input tri0 id_0,
    output wor id_1,
    input supply0 id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri id_6,
    input wand _id_7,
    input tri0 _id_8,
    input wor id_9,
    input tri1 id_10,
    output wire id_11,
    input wire id_12,
    output tri0 id_13,
    output supply0 id_14,
    output uwire id_15
);
  logic id_17;
  logic id_18 [1  &  1 : -1] = -1 - 1;
  module_0 modCall_1 (
      id_15,
      id_10,
      id_14,
      id_1,
      id_3
  );
  logic [7:0] id_19 = id_19[-1'h0 : id_8];
  struct packed {
    id_20 id_21;
    logic [1  !=  id_7 : -1] id_22;
  } id_23;
  ;
  always @(negedge id_19 < 1'h0 or posedge id_3) begin : LABEL_0
    $signed(60);
    ;
  end
  assign id_1 = id_19;
endmodule
