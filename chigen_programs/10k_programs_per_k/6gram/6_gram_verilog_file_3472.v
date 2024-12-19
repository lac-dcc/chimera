// Seed: 2584531738
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_4;
  assign id_1 = id_4 == 1'h0;
  function id_5;
    input id_6;
    begin : LABEL_0
      id_3 <= (1 && id_5 * 1) == id_6;
      id_6 <= id_5;
      id_4 <= id_6;
      id_5 = id_6;
      id_1 <= #1 id_5;
      fork
        id_7(id_6);
        begin : LABEL_0
          id_3 = id_2;
          fork
            for (id_7 = 1; id_7; id_3 = 1) @(posedge 1 != {id_4, id_5});
            $display(1);
          join_none
          id_3 = #id_8 1'b0;
          wait (1'h0);
        end
      join
    end
  endfunction
  reg   id_9 = id_4;
  uwire id_10;
  assign id_4 = 1;
  wire id_11;
  tri1 id_12;
  assign module_1.id_3 = 0;
  assign id_10 = !id_10;
  wire id_13;
  always @(posedge id_13) id_12 = 1;
  uwire id_14 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    for (id_3 = id_14 + id_10; 1; id_7 = id_15 < "") begin : LABEL_0
      id_14 = id_15;
      begin : LABEL_0
        id_7 <= 1;
        id_3 = 1;
      end
    end
    id_2 <= 1 || 1;
    id_5 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  wire id_18;
  assign id_12[1] = 1 < |id_16;
endmodule
