// Seed: 3273944727
module module_0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = 1;
  wire id_7, id_8;
  wire id_9;
  wire id_10;
  wire id_11;
  module_0 modCall_1 ();
endmodule
module module_2;
  genvar id_1;
  module_0 modCall_1 ();
  function id_2;
    input integer id_3;
    output id_4;
    if (id_4)
      if (id_3)
        if (id_4 / id_1)
          if (1) id_3 <= id_2;
          else
            @(posedge 1) begin : LABEL_0
              id_4 <= id_4;
            end
        else begin : LABEL_0
          id_2 = 1;
          $display(id_1 + 1);
        end
  endfunction
endmodule
