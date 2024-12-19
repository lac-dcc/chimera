// Seed: 882356505
module module_0;
  always @(posedge 1) begin : LABEL_0
    return id_1;
  end
  always_ff @* begin : LABEL_0
    #1 begin : LABEL_0
      #1;
    end
  end
  initial begin : LABEL_0
    force id_2 = 1'd0;
  end
  assign module_1.id_0 = 0;
  wire id_3;
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5
);
  function void id_7(input id_8 = id_2, input id_9, input id_10, input id_11);
    id_4 = (id_9);
  endfunction
  module_0 modCall_1 ();
  assign id_7 = {id_10{id_2}};
endmodule
