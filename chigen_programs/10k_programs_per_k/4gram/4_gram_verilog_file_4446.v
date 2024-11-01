// Seed: 1795009701
module module_0 ();
  reg id_2;
  function automatic id_3(input id_4, input reg id_5);
    fork
      id_5 <= id_2;
      id_5 <= 1;
    join_any
  endfunction
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  if (1) begin : id_4
    assign id_4 = id_4;
  end
  reg  id_5;
  wire id_6;
  reg  id_7;
  always
    if (1) #1 $display("");
    else id_5 <= id_7;
  module_0();
  initial begin
    if (id_7) begin
      if (1) id_5 <= 1;
      else begin
        id_7 = 1;
      end
      if (1) id_7 = 1;
      else begin
        wait (1);
      end
    end
  end
endmodule
