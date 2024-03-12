module bootrom(/*autoport*/
//output
         q,
//input
         address,
         clock);

input wire   [10:0]  address;
input wire    clock;
output wire [31:0]  q;


blk_mem_gen_v7_3 blk_mem(/*autoinst*/
           .douta(q),
           .clka(clock),
           .addra(address));

endmodule