// Seed: 2806385135
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  assign id_3 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  function automatic id_7;
    input id_8;
    begin : LABEL_0
      if (id_4) id_2 <= 1 == id_7;
    end
  endfunction
  always @(id_6) begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_5 <= id_4;
      disable id_9;
    end else id_8 <= 1'h0;
  end
  always @(negedge 1 or posedge id_8) begin : LABEL_0
    id_5 <= 1;
  end
  id_10 :
  assert property (@(posedge 1) id_7)
  else $display;
  module_0 modCall_1 ();
  wire id_11;
endmodule
