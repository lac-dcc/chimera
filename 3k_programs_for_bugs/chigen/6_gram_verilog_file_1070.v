// Seed: 2120180126
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output wire id_2
);
  wire id_4;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    output supply0 id_7,
    input wand id_8,
    output wire id_9
);
  assign id_9 = (id_6);
  module_0(
      id_2, id_6, id_7
  );
endmodule
module module_2 (
    input  wand  id_0,
    input  logic id_1,
    output wand  id_2
    , id_5,
    output tri0  id_3
);
  reg id_6;
  reg id_7;
  module_0(
      id_0, id_0, id_3
  );
  generate
    initial begin
      #1 id_6 <= 1;
      #1;
      #1 begin
        forever begin
          id_7 <= id_1;
          if (1) id_5 <= 1'h0;
          else begin
            #1;
            id_5 <= 1;
            id_5 <= 1'd0;
          end
        end
      end
      $display(id_7 == 1'b0, 1);
    end
    for (id_8 = 1; ~id_7; id_5 = 1) begin : id_9
      assign id_7 = 1;
    end
  endgenerate
endmodule
