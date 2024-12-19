// Seed: 72278630
module module_0;
  wire id_1;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  function id_8;
    input id_9;
    input id_10, id_11, id_12, id_13;
    input integer id_14;
    begin : LABEL_0
      id_11 <= id_4;
    end
  endfunction
  wire id_15;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_3 = 32'd1,
    parameter id_4 = 32'd80
);
  id_1(
      .id_0(id_2), .id_1(id_2), .id_2(1'd0), .id_3(0)
  ); defparam id_3.id_4 = 1;
  module_0 modCall_1 ();
endmodule
