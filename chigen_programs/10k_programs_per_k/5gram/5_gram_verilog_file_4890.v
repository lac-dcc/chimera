// Seed: 1009850569
module module_0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  module_0();
  assign id_3 = 1;
endmodule
module module_2 (
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
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = (id_6);
  wire id_11;
  reg  id_12;
  assign id_9 = id_9 == id_11;
  module_0();
  initial begin
    assume #1  (id_3) $display(id_9, 1, id_9, 1'b0, 1, 1 & id_10, id_10 ^ 1);
    else $display(id_11);
    #1;
    for (id_7 = 1; id_12; id_6 = ~id_11 == id_9) begin
      id_8 <= 1'b0;
    end
    #id_13 begin
      if (1 & ~id_10)
        if (1) #0;
        else id_6 <= 1;
    end
    #1 id_12 <= 1;
    `define pp_14 0
    #1;
    `pp_14 = 1;
  end
endmodule
