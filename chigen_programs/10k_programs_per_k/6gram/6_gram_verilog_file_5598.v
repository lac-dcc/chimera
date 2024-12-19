// Seed: 3675597936
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri0 id_5 = 1;
  initial id_5 = id_3 == id_3;
  integer id_6;
  wire id_7;
  initial begin : LABEL_0
    id_6 <= 1;
    id_1 = #1 id_3;
  end
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
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5[1] = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2
  );
  function integer id_7;
    input id_8;
    input id_9;
    begin : LABEL_0
      id_8 <= 1;
      id_3 <= id_8 < id_7;
      $display(id_8);
      if (id_6 && "")
        if (id_3 - 1) id_4 <= 1'b0;
        else #1;
      else id_9 = 1;
    end
  endfunction
endmodule
