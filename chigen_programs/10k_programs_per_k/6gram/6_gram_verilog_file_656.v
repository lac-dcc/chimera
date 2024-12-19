// Seed: 1637179299
module module_0;
  wire id_2;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri0 id_4,
    output supply0 id_5
);
  wire id_7;
  always force id_4 = 1'b0;
  wire id_8;
  module_0 modCall_1 ();
endmodule
module module_0;
  always @(id_1 or id_1)
    if (1 && 1) begin : LABEL_0
      if ((id_1)) #1 $display;
      else
        #0 begin : LABEL_0
          disable id_2;
          assign module_2 = "";
        end
    end else id_1 <= 1;
  module_0 modCall_1 ();
endmodule
