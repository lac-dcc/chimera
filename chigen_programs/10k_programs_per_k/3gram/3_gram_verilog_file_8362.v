// Seed: 4235233922
module module_0 ();
  assign module_1.type_1 = 0;
  always_ff @(posedge id_1)
    if (1'b0) id_1 = id_1 - 1;
    else begin : LABEL_0
      id_1 <= #1 id_1;
      $display(1 == 1, id_1, 1);
    end
  reg id_2 = id_1;
  assign id_1 = 1'b0;
endmodule
module module_1 (
    input tri id_0,
    output supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri id_5,
    input uwire id_6,
    output supply1 id_7
);
  wire id_9;
  assign id_4 = id_3;
  logic [7:0] id_10;
  assign id_7 = (1);
  module_0 modCall_1 ();
  wire id_11;
  assign id_11 = id_9;
  wire id_12;
  assign id_4 = id_10[1'b0 : 1];
endmodule
